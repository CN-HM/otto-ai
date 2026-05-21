<#
.SYNOPSIS
    为 admin-web 生成 TypeScript/Angular OpenAPI 客户端。
.DESCRIPTION
    下载 admin-api Swagger 文档，使用 OpenAPI Generator CLI 生成 typescript-angular 客户端代码。
    对标 App 侧的 generate_dart_dio_client.ps1 流程。
#>
param(
    [string]$SwaggerUrl = "http://localhost:8002/swagger/v1/swagger.json",
    [string]$OutDir = "./src/app/api/openapi",
    [switch]$Docker = $false
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$projectRoot = Resolve-Path (Join-Path $scriptDir "..")

# 临时目录存放 swagger.json
$tempDir = Join-Path $projectRoot "api-json"
if (-not (Test-Path $tempDir)) {
    New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
}

$swaggerFile = Join-Path $tempDir "ai-api-latest.json"

Write-Host "正在下载 Swagger 文档: $SwaggerUrl"
try {
    Invoke-WebRequest -Uri $SwaggerUrl -OutFile $swaggerFile -UseBasicParsing
    Write-Host "Swagger 文档已下载到: $swaggerFile"
} catch {
    Write-Error "下载 Swagger 文档失败: $($_.Exception.Message)"
    exit 1
}

# 解析输出目录
$resolvedOutDir = Resolve-Path (Join-Path $projectRoot $OutDir) -ErrorAction SilentlyContinue
if (-not $resolvedOutDir) {
    $resolvedOutDir = Join-Path $projectRoot $OutDir
}

if (Test-Path $resolvedOutDir) {
    Write-Host "清理旧生成代码: $resolvedOutDir"
    Remove-Item -Path $resolvedOutDir -Recurse -Force
}

# 生成器与附加属性
$generator = "typescript-angular"
$additionalProperties = "ngVersion=18.0.0,modelSuffix=,modelFileSuffix=.model,serviceFileSuffix=.service,apiModulePrefix=Api,withInterfaces=true,enumPropertyNaming=original,stringEnums=true,supportsES6=true,npmName=AI-admin-api,npmVersion=1.0.0"

$openApiGeneratorCommand = Get-Command openapi-generator-cli -ErrorAction SilentlyContinue
$javaCommand = Get-Command java -ErrorAction SilentlyContinue
$dockerCommand = Get-Command docker -ErrorAction SilentlyContinue

if ($Docker -and $dockerCommand) {
    $containerOutDir = [System.IO.Path]::GetRelativePath($projectRoot, $resolvedOutDir) -replace '\\', '/'
    $containerSwagger = [System.IO.Path]::GetRelativePath($projectRoot, $swaggerFile) -replace '\\', '/'
    $dockerArgs = @(
        'run', '--rm',
        '-v', "${projectRoot}:/local",
        'openapitools/openapi-generator-cli',
        'generate',
        '-i', "/local/$containerSwagger",
        '-g', $generator,
        '-o', "/local/$containerOutDir",
        "--additional-properties=$additionalProperties"
    )
    Write-Host "使用 Docker 生成客户端..."
    & $dockerCommand.Source @dockerArgs
} elseif ($openApiGeneratorCommand -and $javaCommand) {
    Write-Host "使用本地 openapi-generator-cli 生成客户端..."
    & $openApiGeneratorCommand.Source generate `
        -i $swaggerFile `
        -g $generator `
        -o $resolvedOutDir `
        --additional-properties=$additionalProperties
} else {
    throw "openapi-generator-cli 需要 Java；当前未检测到 Java，且 Docker 不可用。请安装 Java 或 Docker。"
}

if ($LASTEXITCODE -ne 0) {
    throw "OpenAPI Generator TypeScript/Angular 客户端生成失败。"
}

Write-Host "API 客户端生成完成: $resolvedOutDir"
