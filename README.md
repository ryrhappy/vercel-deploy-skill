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

- 自动检测项目配置
- 智能选择部署环境
- 完整的命令参考
- 故障排查指南

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

安装后，在 Claude Code 中使用自然语言即可触发技能：

```
你: 部署到 vercel 生产环境
Claude: [自动执行 vercel --prod]

你: 查看最近的部署
Claude: [自动执行 vercel list]

你: 添加一个环境变量
Claude: [提示你执行 vercel env add ...]
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

1. 安装 Vercel CLI：
   ```bash
   npm install -g vercel
   ```

2. 登录 Vercel：
   ```bash
   vercel login
   ```

3. 链接项目（首次部署时）：
   ```bash
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

### 部署到预览环境

```
你: 部署到 vercel 预览环境
Claude: 好的，我将执行 vercel 命令部署到预览环境...
```

### 部署到生产环境

```
你: 部署到 vercel 生产环境
Claude: 好的，我将执行 vercel --prod 部署到生产环境...
```

### 管理环境变量

```
你: 添加一个生产环境的环境变量 API_KEY
Claude: 好的，请提供 API_KEY 的值，然后我将执行：
vercel env add API_KEY production
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
