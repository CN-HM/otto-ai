param(
    [string]$OpenApiUrl = "http://localhost:8002/swagger/v1/swagger.json",
    [string]$OutputDir = "packages/openapi",
    [string]$Generator = "dart-dio",
    [string]$AdditionalProperties = "supportsAdditionalProperties=true,useNullSafety=true,ensureUniqueParams=true",
    [string]$DockerImage = "openapitools/openapi-generator-cli"
)

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $PSCommandPath
$projectRoot = (Resolve-Path (Join-Path $scriptDir "..")).Path
$resolvedOutputDir = if ([System.IO.Path]::IsPathRooted($OutputDir)) {
    $OutputDir
} else {
    Join-Path $projectRoot $OutputDir
}

function Write-Utf8NoBom {
    param(
        [string]$Path,
        [string]$Content
    )

    $utf8NoBom = [System.Text.UTF8Encoding]::new($false)
    [System.IO.File]::WriteAllText($Path, $Content, $utf8NoBom)
}

function Remove-UnusedImport {
    param(
        [string]$Content,
        [string]$ImportLine,
        [string]$Symbol
    )

    if (-not $Content.Contains($ImportLine)) {
        return $Content
    }

    $withoutImport = $Content.Replace("$ImportLine`r`n", '').Replace("$ImportLine`n", '')
    if ($withoutImport -notmatch "\b$([regex]::Escape($Symbol))\b") {
        return $withoutImport
    }

    return $Content
}

function Apply-GeneratedFixes {
    param([string]$Root)

    $apiDir = Join-Path $Root 'lib/src/api'
    if (Test-Path $apiDir) {
        Get-ChildItem $apiDir -Filter '*.dart' -File | ForEach-Object {
            $content = Get-Content $_.FullName -Raw
            $updated = Remove-UnusedImport -Content $content -ImportLine "import 'package:built_value/json_object.dart';" -Symbol 'JsonObject'
            $updated = Remove-UnusedImport -Content $updated -ImportLine "import 'package:openapi/src/model/volo_abp_http_remote_service_error_response.dart';" -Symbol 'VoloAbpHttpRemoteServiceErrorResponse'

            if ($_.Name -eq 'dataset_api.dart') {
                $updated = $updated.Replace(
                    "const _type = FullType(BuiltMap, [FullType(String), FullType(BuiltList)]);",
                    "const _type = FullType(BuiltMap, [FullType(String), FullType(BuiltList, [FullType(String)])]);"
                )
            }

            if ($updated -ne $content) {
                Write-Utf8NoBom -Path $_.FullName -Content $updated
            }
        }
    }

    $serializersPath = Join-Path $Root 'lib/src/serializers.dart'
    if (Test-Path $serializersPath) {
        $content = Get-Content $serializersPath -Raw
        $updated = $content.Replace(
            "const FullType(BuiltMap, [FullType(String), FullType(BuiltList)]),",
            "const FullType(BuiltMap, [FullType(String), FullType(BuiltList, [FullType(String)])]),"
        ).Replace(
            "() => MapBuilder<String, BuiltList>(),",
            "() => MapBuilder<String, BuiltList<String>>(),"
        )

        if ($updated -ne $content) {
            Write-Utf8NoBom -Path $serializersPath -Content $updated
        }
    }
}

if (-not (Get-Command openapi-generator-cli -ErrorAction SilentlyContinue) -and -not (Get-Command docker -ErrorAction SilentlyContinue)) {
    throw "未找到 openapi-generator-cli，且 Docker 不可用。请先安装 openapi-generator-cli 或 Docker。"
}

try {
    $response = Invoke-WebRequest -Uri $OpenApiUrl -UseBasicParsing -TimeoutSec 30
} catch {
    throw "无法访问 OpenAPI 描述：$OpenApiUrl。请先启动 admin-api。$($_.Exception.Message)"
}

if ($response.StatusCode -ne 200) {
    throw "OpenAPI 描述返回异常状态码：$($response.StatusCode)"
}

if (Test-Path $resolvedOutputDir) {
    Remove-Item $resolvedOutputDir -Recurse -Force
}

$arguments = @(
    'generate',
    '-i', $OpenApiUrl,
    '-g', $Generator,
    '-o', $resolvedOutputDir,
    "--additional-properties=$AdditionalProperties"
)

$javaCommand = Get-Command java -ErrorAction SilentlyContinue
$openApiGeneratorCommand = Get-Command openapi-generator-cli -ErrorAction SilentlyContinue
$dockerCommand = Get-Command docker -ErrorAction SilentlyContinue
$dartCommand = Get-Command dart -ErrorAction SilentlyContinue
$flutterCommand = Get-Command flutter -ErrorAction SilentlyContinue

if ($openApiGeneratorCommand -and $javaCommand) {
    & $openApiGeneratorCommand.Source @arguments
} elseif ($dockerCommand) {
    $containerOutputDir = [System.IO.Path]::GetRelativePath($projectRoot, $resolvedOutputDir) -replace '\\', '/'
    $dockerArguments = @(
        'run',
        '--rm',
        '-v', "${projectRoot}:/local",
        $DockerImage,
        'generate',
        '-i', $OpenApiUrl,
        '-g', $Generator,
        '-o', "/local/$containerOutputDir",
        "--additional-properties=$AdditionalProperties"
    )

    & $dockerCommand.Source @dockerArguments
} else {
    throw "openapi-generator-cli 需要 Java；当前未检测到 Java，且 Docker 不可用。"
}

if ($LASTEXITCODE -ne 0) {
    throw "OpenAPI Generator Dart client 生成失败。"
}

if (-not (Test-Path (Join-Path $resolvedOutputDir 'pubspec.yaml'))) {
    throw "生成结果中未找到 pubspec.yaml：$resolvedOutputDir"
}

Push-Location $resolvedOutputDir
try {
    if ($dartCommand) {
        & $dartCommand.Source pub get
        if ($LASTEXITCODE -ne 0) {
            throw "生成客户端依赖恢复失败。"
        }

        & $dartCommand.Source run build_runner build --delete-conflicting-outputs
        if ($LASTEXITCODE -ne 0) {
            throw "生成客户端 build_runner 执行失败。"
        }
    } elseif ($flutterCommand) {
        & $flutterCommand.Source pub get
        if ($LASTEXITCODE -ne 0) {
            throw "生成客户端依赖恢复失败。"
        }

        & $flutterCommand.Source pub run build_runner build --delete-conflicting-outputs
        if ($LASTEXITCODE -ne 0) {
            throw "生成客户端 build_runner 执行失败。"
        }
    } else {
        throw "未找到 dart 或 flutter，无法补全 generated/api 所需的 built_value 代码。"
    }
} finally {
    Pop-Location
}

Apply-GeneratedFixes -Root $resolvedOutputDir

Write-Host "OpenAPI Generator Dart client 已生成到: $resolvedOutputDir"

