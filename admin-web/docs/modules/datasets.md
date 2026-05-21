# 知识库模块

## 模块范围

- 知识库管理
- 知识库文档管理
- 检索测试

## 相关接口

- `/datasets`
- `/datasets/{dataset_id}`
- `/datasets/{dataset_id}/retrieval-test`

## 页面规划

- 知识库列表
- 知识库详情
- 文档管理
- 检索测试页

## 待补充

- 已创建知识库列表页 `src/app/features/datasets/knowledge-bases-page.component.*`
- 已创建知识库详情页 `src/app/features/datasets/knowledge-base-detail-page.component.*`
- 已创建知识库新增编辑页 `src/app/features/datasets/knowledge-base-form-page.component.*`
- 已创建知识库检索测试页 `src/app/features/datasets/knowledge-base-retrieval-page.component.*`
- 已创建知识库文档管理页 `src/app/features/datasets/knowledge-base-documents-page.component.*`
- 已创建知识库文档切片明细页 `src/app/features/datasets/knowledge-base-document-chunks-page.component.*`
- 已创建 `KnowledgeBaseService` 与接口模型
- 已接入知识库分页列表、详情、创建、更新、删除与检索测试接口骨架
- 已接入知识库文档分页列表、上传、删除、切片明细与解析控制接口骨架
- 当前筛选字段：知识库名称 / 页码 / 每页数量
- 文档上传与切片管理接口清单
- 当前已补文档切片明细、解析观察与手工 JSON 解析控制面板，并支持针对当前文档、选中切片、当前页切片、观察队列文档快速生成解析动作
- 检索测试输入输出结构
