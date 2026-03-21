# vercel.json Configuration Reference

## Basic Configuration

```json
{
  "version": 2,
  "name": "my-project"
}
```

## Build Configuration

```json
{
  "version": 2,
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/next"
    }
  ]
}
```

## Routes/Rewrites

```json
{
  "version": 2,
  "routes": [
    {
      "src": "/api/(.*)",
      "dest": "/api/$1"
    },
    {
      "src": "/(.*)",
      "dest": "/index.html"
    }
  ]
}
```

## Headers

```json
{
  "version": 2,
  "headers": [
    {
      "source": "/api/(.*)",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "no-cache"
        }
      ]
    }
  ]
}
```

## Environment Variables

```json
{
  "version": 2,
  "env": {
    "API_KEY": "@api-key",
    "DATABASE_URL": "@database-url"
  },
  "build": {
    "env": {
      "BUILD_SECRET": "@build-secret"
    }
  }
}
```

## Functions Configuration

```json
{
  "version": 2,
  "functions": {
    "api/*.js": {
      "memory": 1024,
      "maxDuration": 10
    }
  }
}
```

## Full Example (Next.js)

```json
{
  "version": 2,
  "name": "my-next-app",
  "buildCommand": "next build",
  "devCommand": "next dev",
  "installCommand": "npm install",
  "framework": "nextjs",
  "regions": ["fra1", "iad1"],
  "env": {
    "NEXT_PUBLIC_API_URL": "https://api.example.com"
  },
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        }
      ]
    }
  ],
  "rewrites": [
    {
      "source": "/old-path",
      "destination": "/new-path"
    }
  ],
  "redirects": [
    {
      "source": "/old-blog/(.*)",
      "destination": "/blog/$1",
      "permanent": true
    }
  ]
}
```

## Static Site

```json
{
  "version": 2,
  "builds": [
    {
      "src": "package.json",
      "use": "@vercel/static-build",
      "config": {
        "distDir": "dist"
      }
    }
  ]
}
```
