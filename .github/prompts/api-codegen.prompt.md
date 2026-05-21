---
description: "从 admin-api Swagger 重新生成前端 API 代码。运行 api-codegen 脚本更新 admin-web 的 API 层。"
agent: "agent"
tools: ["run_in_terminal"]
---

从 Swagger 重新生成前端 API 代码。

## 步骤

1. 确保 admin-api 正在运行（http://localhost:8002）
2. 运行生成脚本：

```bash
cd admin-web && npm run api:generate
```

3. 检查 `src/app/api/` 下生成的文件，确认没有错误
4. 列出新增或变更的 API 方法
