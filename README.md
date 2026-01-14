# Vercel Deployment Skill for Claude Code

> 一个帮助你在 Claude Code 中快速部署项目到 Vercel 的技能插件

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Vercel](https://img.shields.io/badge/Vercel-000000?logo=vercel&logoColor=white)](https://vercel.com/)

## 简介

这个技能为 Claude Code 添加了 Vercel 部署能力，让你能够：

- 一键部署到预览环境
- 一键部署到生产环境
- 管理环境变量
- 查看部署日志
- 回滚部署

## 功能特性

- 🚀 **一键部署** - 自动部署到预览或生产环境
- 🔍 **智能检测** - 自动检查并安装 Vercel CLI
- 🔐 **自动登录** - 引导完成 Vercel 账户登录
- 🔗 **自动关联** - 自动链接项目到 Vercel
- 📋 **完整命令** - 所有 Vercel CLI 命令参考
- 🛠️ **故障排查** - 内置常见问题解决方案

## 安装

### 方法 1: 使用 Claude Code 内置安装（推荐）

在 Claude Code 中运行：

```
/install https://github.com/ryrhappy/vercel-deploy-skill
```

### 方法 2: 手动安装

1. 克隆仓库到你的本地技能目录：

```bash
git clone https://github.com/ryrhappy/vercel-deploy-skill ~/.claude/skills/vercel-deploy
```

2. 重启 Claude Code

### 方法 3: 复制文件

1. 下载 [SKILL.md](skills/vercel-deploy/SKILL.md) 文件
2. 创建目录：`mkdir -p ~/.claude/skills/vercel-deploy`
3. 将文件复制到该目录

## 使用

安装后，在 Claude Code 中使用自然语言即可触发技能。

### 自动检查流程

当你请求部署时，技能会自动：

1. ✅ 检查 Vercel CLI 是否安装（如未安装则自动安装）
2. ✅ 检查是否已登录 Vercel（如未登录则引导登录）
3. ✅ 检查项目是否已关联（如未关联则自动链接）
4. ✅ 执行部署命令

### 示例对话

```
你: 部署到 vercel 生产环境

Claude: 好的，让我先检查环境...

[检查中] Vercel CLI 未安装，正在安装...
$ npm install -g vercel

[检查中] 需要登录 Vercel...
$ vercel login
请在浏览器中完成登录...

[检查中] 项目未关联，正在链接...
$ vercel link

一切就绪！正在部署到生产环境...
$ vercel --prod
```

```
你: 查看最近的部署

Claude: 好的，让我获取部署列表...
$ vercel list
```

```
你: 添加一个生产环境的环境变量 API_KEY

Claude: 好的，请提供 API_KEY 的值，然后我将执行：
$ vercel env add API_KEY production
```

## 常用命令

| 动作 | 命令 |
|------|------|
| 部署到预览 | `vercel` |
| 部署到生产 | `vercel --prod` |
| 列出部署 | `vercel list` |
| 查看日志 | `vercel logs [url]` |
| 添加环境变量 | `vercel env add KEY [env]` |
| 拉取环境变量 | `vercel env pull .env` |
| 回滚部署 | `vercel rollback [url]` |

## 配置别名（可选）

在 `~/.zshrc` 或 `~/.bashrc` 中添加：

```bash
# Vercel 别名
alias vp='vercel'                    # 部署预览
alias vprod='vercel --prod'          # 部署生产
alias vlist='vercel list'            # 列出部署
alias vlog='vercel logs'             # 查看日志
alias venvls='vercel env ls'         # 列出环境变量
alias venvpull='vercel env pull .env' # 拉取环境变量
```

然后运行 `source ~/.zshrc` 使其生效。

## 前置要求

### 无需手动配置！

本技能会自动检查并引导你完成所有前置步骤：

| 步骤 | 自动检查 | 自动处理 |
|------|----------|----------|
| 1️⃣ Vercel CLI | `which vercel` | `npm install -g vercel` |
| 2️⃣ 登录状态 | `vercel whoami` | `vercel login` |
| 3️⃣ 项目关联 | `ls .vercel` | `vercel link` |

只需一句话 "部署到 vercel"，技能会自动完成所有准备工作！

### 手动安装（可选）

如果你想提前准备环境，也可以手动执行：

```bash
# 1. 安装 Vercel CLI
npm install -g vercel

# 2. 登录 Vercel
vercel login

# 3. 链接项目（在项目目录下）
vercel link
```

## 项目结构

```
vercel-deploy-skill/
├── .claude-plugin/
│   └── plugin.json         # 插件元数据
├── skills/
│   └── vercel-deploy/
│       └── SKILL.md        # 技能定义
├── scripts/
│   └── install.sh          # 安装脚本
└── README.md               # 本文件
```

## 示例

### 部署到预览环境（自动处理所有检查）

```
你: 部署到 vercel 预览环境

Claude: 让我检查环境...

✓ Vercel CLI 已安装
✓ 已登录为 ryrhappy
✓ 项目已关联

正在部署到预览环境...
$ vercel

预览地址: https://article-to-image-xxx.vercel.app
```

### 首次部署（自动安装和配置）

```
你: 帮我部署到 vercel

Claude: 让我检查环境...

✗ Vercel CLI 未安装
正在安装...
$ npm install -g vercel
✔ 安装完成

✗ 需要登录 Vercel
请在浏览器中完成登录...
$ vercel login
✔ 登录成功

✗ 项目未关联
正在关联项目...
$ vercel link
✔ 关联成功

现在可以部署了！
$ vercel --prod
```

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

## 作者

ryrhappy

## 相关链接

- [Vercel 官方文档](https://vercel.com/docs)
- [Vercel CLI 命令参考](https://vercel.com/docs/cli)
- [Claude Code 文档](https://github.com/anthropics/claude-code)

---

## 工作原理

### 自动检查流程图

```
用户请求部署
    ↓
检查 Vercel CLI
    ↓ 未安装 → 自动安装 → 继续
    ↓ 已安装
检查登录状态
    ↓ 未登录 → 引导登录 → 继续
    ↓ 已登录
检查项目关联
    ↓ 未关联 → 自动关联 → 继续
    ↓ 已关联
执行部署 ✅
```

### 智能错误处理

技能会识别以下错误并自动处理：

| 错误信息 | 原因 | 自动处理 |
|----------|------|----------|
| `vercel: command not found` | CLI 未安装 | 运行 `npm install -g vercel` |
| `Error: Not logged in` | 未登录 | 运行 `vercel login` |
| `Error: No project found` | 项目未关联 | 运行 `vercel link` |
| `Permission denied` | 权限问题 | 检查登录状态 |
