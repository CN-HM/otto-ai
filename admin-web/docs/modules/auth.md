# 登录与鉴权模块

## 模块范围

- 登录
- 注册
- 短信验证码
- 找回密码
- 修改密码
- 登录态管理
- 路由守卫

## 相关接口

- `/user/login`
- `/user/register`
- `/user/smsVerification`
- `/user/retrieve-password`
- `/user/change-password`

## 页面规划

- 登录页
- 注册页
- 找回密码页
- 修改密码页或弹窗

## 当前进展

- 已创建登录页 `src/app/features/auth/login-page.component.*`
- 已创建注册页 `src/app/features/auth/register-page.component.*`
- 已创建找回密码页 `src/app/features/auth/retrieve-password-page.component.*`
- 已创建修改密码页 `src/app/features/auth/change-password-page.component.*`
- 已创建 `AuthService`、`AuthStorageService`
- 已接入 `/user/login` 调用
- 已接入 `/user/register` 调用
- 已接入 `/user/smsVerification` 调用
- 已接入 `/user/retrieve-password` 调用
- 已接入 `/user/change-password` 调用
- 已建立本地登录态存储
- 已建立认证请求头注入拦截器
- 已建立 401 错误处理拦截器
- 已建立 `authGuard` 路由守卫
- 已支持未登录跳转到 `/login`
- 已支持登录页、注册页、找回密码页之间互相跳转
- 已支持登录后进入修改密码页

## 待补充

- Token 存储策略
- 请求头约定
- 登录成功后的用户信息结构
- 401 处理策略
- 图形验证码实际展示与获取机制
