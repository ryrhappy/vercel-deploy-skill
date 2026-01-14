#!/bin/bash

# Vercel Deploy Skill - 安装脚本
# 用法: ./scripts/install.sh

set -e

INSTALL_DIR="$HOME/.claude/skills/vercel-deploy"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "🚀 正在安装 Vercel Deployment Skill..."
echo ""

# 检查 Claude 技能目录是否存在
if [ ! -d "$HOME/.claude" ]; then
    echo "❌ 错误: Claude Code 目录不存在 (~/.claude)"
    echo "   请确保已安装 Claude Code"
    exit 1
fi

# 创建技能目录
echo "📁 创建技能目录: $INSTALL_DIR"
mkdir -p "$INSTALL_DIR"

# 复制技能文件
echo "📋 复制技能文件..."
cp "$PROJECT_ROOT/skills/vercel-deploy/SKILL.md" "$INSTALL_DIR/"

echo ""
echo "✅ 安装完成!"
echo ""
echo "使用方法:"
echo "  1. 重启 Claude Code"
echo "  2. 在对话中说: '部署到 vercel' 或 'vercel 部署'"
echo ""
echo "如需配置别名，将以下内容添加到 ~/.zshrc:"
echo ""
echo "  # Vercel 别名"
echo "  alias vp='vercel'"
echo "  alias vprod='vercel --prod'"
echo "  alias vlist='vercel list'"
echo "  alias vlog='vercel logs'"
echo "  alias venvls='vercel env ls'"
echo "  alias venvpull='vercel env pull .env'"
echo ""
