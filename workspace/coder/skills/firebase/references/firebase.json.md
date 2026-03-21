# firebase.json Configuration Reference

## Basic Hosting

```json
{
  "hosting": {
    "public": "dist",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

## Hosting with Multiple Sites

```json
{
  "hosting": [
    {
      "target": "app",
      "public": "dist",
      "rewrites": [{"source": "**", "destination": "/index.html"}]
    },
    {
      "target": "admin",
      "public": "admin-dist",
      "rewrites": [{"source": "**", "destination": "/index.html"}]
    }
  ]
}
```

## With Firestore

```json
{
  "firestore": {
    "rules": "firestore.rules",
    "indexes": "firestore.indexes.json"
  },
  "hosting": {
    "public": "public"
  }
}
```

## With Functions

```json
{
  "functions": [
    {
      "source": "functions",
      "codebase": "default"
    }
  ],
  "hosting": {
    "public": "public",
    "rewrites": [
      {
        "source": "/api/**",
        "function": "api"
      }
    ]
  }
}
```

## Full Configuration

```json
{
  "firestore": {
    "rules": "firestore.rules",
    "indexes": "firestore.indexes.json"
  },
  "functions": {
    "source": "functions"
  },
  "hosting": {
    "public": "dist",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [{"source": "**", "destination": "/index.html"}],
    "headers": [
      {
        "source": "/**",
        "headers": [{"key": "Cache-Control", "value": "max-age=3600"}]
      }
    ]
  },
  "storage": {
    "rules": "storage.rules"
  },
  "emulators": {
    "auth": {"port": 9099},
    "functions": {"port": 5001},
    "firestore": {"port": 8080},
    "hosting": {"port": 5000},
    "ui": {"enabled": true}
  }
}
```
