# Firestore Security Rules Examples

## Basic Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow read/write for authenticated users
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

## User-Owned Data

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can only access their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    
    // Public read, authenticated write
    match /public/{docId} {
      allow read: if true;
      allow write: if request.auth != null;
    }
  }
}
```

## Role-Based Access

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    function isAdmin() {
      return request.auth != null && 
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == 'admin';
    }
    
    match /admin/{docId} {
      allow read, write: if isAdmin();
    }
  }
}
```

## Validation Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /posts/{postId} {
      allow create: if request.auth != null
        && request.resource.data.title is string
        && request.resource.data.title.size() > 0
        && request.resource.data.title.size() < 100
        && request.resource.data.createdAt == request.time;
      
      allow update: if request.auth != null
        && request.resource.data.title is string
        && request.resource.data.updatedAt == request.time;
      
      allow delete: if request.auth != null 
        && resource.data.authorId == request.auth.uid;
    }
  }
}
```
