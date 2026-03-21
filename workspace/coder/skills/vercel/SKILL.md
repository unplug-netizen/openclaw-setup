---
name: vercel
description: Deploy and manage projects on Vercel including serverless functions, edge functions, and static site hosting. Use when deploying Next.js, React, Vue, or other frontend frameworks to Vercel's edge network.
---

# Vercel

Deploy and manage projects on Vercel's edge network.

## Prerequisites

Vercel CLI must be installed and authenticated:
```bash
vercel --version
vercel login
```

## Capabilities

- Deploy frontend frameworks (Next.js, React, Vue, Svelte, etc.)
- Manage serverless and edge functions
- Configure environment variables
- Manage custom domains
- Preview deployments
- Monitor deployments and logs

## Project Setup

```bash
# Initialize Vercel in project
vercel

# Link to existing project
vercel --confirm

# Set up environment variables
vercel env add <name>
```

## Common Commands

### Deployment
```bash
# Deploy to production
vercel --prod

# Deploy preview (default)
vercel

# Deploy with specific flag
vercel --yes
```

### Environment Variables
```bash
# Add environment variable
vercel env add API_KEY

# Add from file
vercel env add API_KEY production < secret.txt

# List environment variables
vercel env ls

# Remove environment variable
vercel env rm API_KEY
```

### Domains & Aliases
```bash
# Add custom domain
vercel domains add example.com

# List domains
vercel domains ls

# Remove domain
vercel domains rm example.com
```

### Logs & Monitoring
```bash
# View logs
vercel logs

# View logs for specific deployment
vercel logs <deployment-url>

# Follow logs
vercel logs --follow
```

### Project Management
```bash
# List projects
vercel projects

# Project information
vercel project ls

# Remove project
vercel remove <project-name>
```

## Scripts

- `deploy-prod.sh` - Deploy to production with checks
- `deploy-preview.sh` - Create preview deployment
- `vercel-status.sh` - Check project status and config

## References

- `references/vercel.json.md` - Configuration file reference
