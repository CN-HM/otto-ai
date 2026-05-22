import { EnvironmentProviders, makeEnvironmentProviders } from '@angular/core';
import { BASE_PATH } from './variables';

export function provideApi(_baseUrl: string): EnvironmentProviders {
    return makeEnvironmentProviders([
        {
            provide: BASE_PATH,
            useValue: ''  // 空字符串使 API 服务生成相对 URL，由 apiBaseUrlInterceptor 统一添加前缀
        }
    ]);
}