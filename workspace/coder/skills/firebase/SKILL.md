---
name: firebase
description: Deploy and manage Firebase projects including Hosting, Firestore, Functions, and Authentication. Use when deploying web apps to Firebase Hosting, managing Firestore databases, deploying Cloud Functions, or configuring Firebase Auth.
---

# Firebase

Deploy and manage Firebase projects via the Firebase CLI.

## Prerequisites

Firebase CLI must be installed and authenticated:
```bash
firebase --version
firebase login
firebase projects:list
```

## Capabilities

- **Hosting**: Deploy static web apps
- **Firestore**: Database operations, security rules
- **Functions**: Deploy Cloud Functions
- **Auth**: User management
- **Storage**: File storage operations

## Project Setup

```bash
# Initialize Firebase in project
firebase init

# Select services: Hosting, Firestore, Functions, etc.
# Creates firebase.json and .firebaserc
```

## Common Commands

### Hosting
```bash
# Deploy to hosting
firebase deploy --only hosting

# Deploy specific site
firebase deploy --only hosting:target-name

# Preview channel
defirebase hosting:channel:deploy preview-name
```

### Firestore
```bash
# Deploy security rules
firebase deploy --only firestore:rules

# Deploy indexes
firebase deploy --only firestore:indexes
```

### Functions
```bash
# Deploy all functions
firebase deploy --only functions

# Deploy specific function
firebase deploy --only functions:functionName

# View function logs
firebase functions:log
```

### General
```bash
# Deploy everything
firebase deploy

# Deploy specific services
firebase deploy --only hosting,firestore

# Check project status
firebase projects:list
```

## Scripts

- `deploy-hosting.sh` - Deploy with validation
- `deploy-functions.sh` - Deploy Cloud Functions
- `emulator-start.sh` - Start local Firebase emulator

## References

- `references/security-rules.md` - Firestore security rules examples
- `references/firebase.json.md` - Configuration reference
