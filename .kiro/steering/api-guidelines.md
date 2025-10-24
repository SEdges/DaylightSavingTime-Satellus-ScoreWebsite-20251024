---
inclusion: fileMatch
fileMatchPattern: '*api*'
---


# API开发指南

## RESTful设计原则
- 使用HTTP动词表示操作（GET, POST, PUT, DELETE）
- 资源名使用复数形式
- 状态码使用标准HTTP状态码

## 安全要求
- 所有API端点必须进行身份验证
- 敏感数据传输使用HTTPS
- 实施速率限制防止滥用

## 错误处理
- 返回一致的错误格式
- 提供有意义的错误消息
- 记录详细的错误日志