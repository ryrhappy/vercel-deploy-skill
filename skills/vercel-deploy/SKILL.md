---
name: vercel-deploy
description: This skill should be used when the user asks to "deploy to vercel", "vercel deployment", "vercel cli", mentions "vercel", "deploy production", "deploy preview", or discusses Vercel platform deployment. Provides comprehensive guidance for deploying projects to Vercel using the CLI.
version: 1.0.0
license: MIT
---

# Vercel Deployment Skill

This skill helps you deploy projects to Vercel using the Vercel CLI. It covers deploying to production, preview environments, and common Vercel operations.

## When This Skill Activates

This skill activates when you:
- Ask to deploy to Vercel
- Mention Vercel CLI commands
- Request deployment to production or preview environments
- Ask about Vercel environment variables
- Need help with Vercel project management

## IMPORTANT: Always Check Prerequisites First

Before attempting ANY deployment operation, you MUST:

1. **Check if Vercel CLI is installed**
   ```bash
   which vercel
   ```
   If not found, install it:
   ```bash
   npm install -g vercel
   ```

2. **Check if user is logged in**
   ```bash
   vercel whoami
   ```
   If not logged in or shows error, guide user to login:
   ```bash
   vercel login
   ```

3. **Check if project is linked**
   ```bash
   ls -la .vercel 2>/dev/null
   ```
   If `.vercel` directory doesn't exist, link the project:
   ```bash
   vercel link
   ```

### Prerequisite Checklist Flow

When a user requests deployment:

```
START → Check Vercel CLI installed?
  ↓ NO → Install: npm install -g vercel → CONTINUE
  ↓ YES
Check logged in?
  ↓ NO → Run: vercel login → CONTINUE
  ↓ YES
Check project linked?
  ↓ NO → Run: vercel link → CONTINUE
  ↓ YES
PROCEED WITH DEPLOYMENT
```

### Example Prerequisite Checking Conversation

**User**: "Deploy to Vercel"

**You should**:
1. First run: `which vercel`
2. If missing, say: "Vercel CLI is not installed. Installing..." and run `npm install -g vercel`
3. Then run: `vercel whoami`
4. If not logged in, say: "Please login to Vercel..." and run `vercel login`
5. Then check: `ls -la .vercel`
6. If not linked, say: "Linking project..." and run `vercel link`
7. Finally: "All set! Deploying..." and run `vercel --prod`

### Automatic Error Detection

If any command fails with:
- `vercel: command not found` → Install CLI
- `Error: Not logged in` → Run login
- `Error: No project found` → Run link
- `Permission denied` → Check login status

## Prerequisites Summary

| Requirement | Check Command | Fix Command |
|-------------|---------------|-------------|
| Vercel CLI | `which vercel` | `npm install -g vercel` |
| Logged in | `vercel whoami` | `vercel login` |
| Project linked | `ls .vercel` | `vercel link` |

## Deployment Commands

### Deploy to Preview Environment

```bash
vercel
# Or with auto-confirmation
vercel --yes
```

This creates a unique preview URL for testing.

### Deploy to Production

```bash
vercel --prod
# Or with auto-confirmation
vercel --prod --yes
```

This deploys to your production domain.

## Common Commands

### View Deployments

```bash
vercel list               # List all deployments
vercel inspect [url]       # Get deployment details
vercel logs [url]          # View deployment logs
```

### Environment Variables

```bash
vercel env ls                          # List all environment variables
vercel env add KEY production          # Add variable for production
vercel env add KEY preview             # Add variable for preview
vercel env add KEY development         # Add variable for development
vercel env pull .env                    # Pull all variables to .env file
vercel env rm KEY                       # Remove an environment variable
```

### Project Management

```bash
vercel link               # Link current directory to a Vercel project
vercel unlink             # Unlink the project
vercel whoami             # Show current logged-in user
```

### Rollback

```bash
vercel rollback [url]     # Rollback to a previous deployment
vercel remove [url]       # Remove a deployment
```

## Deployment Workflow

### 1. Create a Feature Branch

```bash
git checkout -b feature/my-feature
```

### 2. Deploy to Preview

```bash
vercel
```

### 3. Test the Preview URL

Check the output URL and verify your changes work correctly.

### 4. Merge and Deploy to Production

```bash
git checkout main
git merge feature/my-feature
git push origin main
vercel --prod
```

## Environment Variable Best Practices

### Production vs Preview vs Development

Vercel supports three environments for environment variables:

| Environment | Description |
|-------------|-------------|
| `production` | Used when deploying with `--prod` flag |
| `preview` | Used for preview deployments (default) |
| `development` | Used for local development |

### Adding Environment Variables

```bash
# Production only
vercel env add DATABASE_URL production

# Preview deployments
vercel env add DATABASE_URL preview

# Development (local)
vercel env add DATABASE_URL development

# All environments
vercel env add DATABASE_URL production
vercel env add DATABASE_URL preview
vercel env add DATABASE_URL development
```

### Pulling Environment Variables

To use environment variables locally:

```bash
vercel env pull .env
```

This creates a `.env` file with all your environment variables.

## Configuration File

Create a `vercel.json` in your project root:

```json
{
  "buildCommand": "npm run build",
  "devCommand": "npm run dev",
  "installCommand": "npm install",
  "framework": "nextjs",
  "regions": ["sin1"],
  "env": {
    "NEXT_PUBLIC_APP_ENV": "$APP_ENV"
  }
}
```

### Common Configuration Options

| Option | Description |
|--------|-------------|
| `buildCommand` | Command to build your project |
| `devCommand` | Command to start dev server |
| `installCommand` | Command to install dependencies |
| `framework` | Framework detection (nextjs, react, vue, etc.) |
| `regions` | Deployment regions (sin1, sfo1, iad1, etc.) |
| `env` | Default environment variables |

## Troubleshooting

### Build Fails

1. Check local build works: `npm run build`
2. View deployment logs: `vercel logs [url]`
3. Check environment variables: `vercel env ls`

### Vulnerable Dependencies Detected

Update the affected packages:

```bash
npm update <package-name>@latest
```

### Permission Denied

Ensure you're logged in and have project access:

```bash
vercel whoami
vercel link
```

### Wrong Environment Deployed

Always use the correct flag:
- `vercel` → Preview environment
- `vercel --prod` → Production environment

## Bash Aliases (Optional)

Add to your `~/.zshrc` or `~/.bashrc`:

```bash
# Vercel aliases
alias vp='vercel'                    # Deploy to preview
alias vprod='vercel --prod'          # Deploy to production
alias vlist='vercel list'            # List deployments
alias vlog='vercel logs'             # View logs
alias venvls='vercel env ls'         # List env vars
alias venvpull='vercel env pull .env' # Pull env to .env
```

Then reload: `source ~/.zshrc`

## Additional Resources

- [Vercel CLI Documentation](https://vercel.com/docs/cli)
- [Environment Variables](https://vercel.com/docs/projects/environment-variables)
- [Deployment Configurations](https://vercel.com/docs/projects/project-configuration)
