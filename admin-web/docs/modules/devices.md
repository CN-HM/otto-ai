# 设备与 OTA 模块

## 模块范围

- 设备管理
- 设备解绑与状态查看
- OTA 固件管理
- 固件上传

## 相关接口

- `/device/update/{id}`
- `/device/unbind`
- `/device/provisioning/issue`
- `/device/bootstrap`
- `/device/manual-add`
- `/otaMag`
- `/otaMag/{id}`
- `/otaMag/upload`

## 页面规划

- 设备列表
- 设备详情
- BLE 配网接入说明
- OTA 列表
- OTA 编辑
- 固件上传

## 风险点

- 已创建设备列表页 `src/app/features/devices/devices-page.component.*`
- 已创建设备详情页 `src/app/features/devices/device-detail-page.component.*`
- 已将旧设备绑定页降级为 BLE 配网说明页 `src/app/features/devices/device-bind-page.component.*`
- 已创建 OTA 列表页 `src/app/features/devices/ota-list-page.component.*`
- 已创建 OTA 详情页 `src/app/features/devices/ota-detail-page.component.*`
- 已创建 OTA 新增编辑页 `src/app/features/devices/ota-form-page.component.*`
- 已创建 `DeviceService` 与接口模型
- 已接入管理员设备分页查询、设备更新、解绑设备、手动添加设备接口
- 设备签发凭证与 BLE 写入流程由移动端负责，网页端不再承载激活码绑定或 MAC 兼容认领
- 已接入 OTA 列表、OTA 详情、OTA 新增、OTA 编辑、OTA 删除、OTA 下载链接、固件上传骨架
- OTA 列表页同时支持侧栏预览与独立详情路由
- 当前列表筛选字段：设备关键词
- OTA 上传成功后会自动回填 `firmwarePath`、`size` 与 `firmwareName`
- 已将 OTA 上传统一切换为显式 `FormData` helper，并补充上传文件类型约束与提示
- 已在 OTA 上传的 `FormData` body part 中显式附带文件名，贴近常见后端 multipart 解析要求
- 已为 OTA 上传补充 `fileName` / `originalFilename` 文本字段冗余，降低部分服务端仅从文本 part 读取文件名时的适配风险
- 已补 OTA 上传返回值字段兼容，支持 `filePath` / `url` / `downloadUrl` / `fileName` / `originalFilename` 等别名与嵌套对象
- OpenAPI 当前将 `/otaMag/upload` 标为 `application/json + binary string`，但前端仍按 `FormData` 上传，实际请求格式需要联调确认
- OTA 版本字段与设备版本字段需统一映射
