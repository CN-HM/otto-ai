import { EnvironmentProviders, makeEnvironmentProviders } from '@angular/core';

// 简单占位实现：返回空的 EnvironmentProviders。
// 真实的 OpenAPI 客户端由生成器提供（在 CI/开发流程中可替换）。
export function provideApi(_baseUrl: string): EnvironmentProviders {
    return makeEnvironmentProviders([]);
}