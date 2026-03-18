---
name: identity-fake
description: Generate realistic fake identities for testing and account creation. Use when creating test accounts that require consistent personal information like names, addresses, and usernames.
---

# Identity Fake

Generate realistic fake identities for testing purposes.

## Capabilities

- Generate consistent fake names (first, last, full)
- Create realistic usernames and email addresses
- Generate addresses and phone numbers
- Create birthdates and ages
- Generate company names and job titles
- Consistent seed-based generation (same input = same identity)

## Usage

```bash
# Generate complete identity
node generate-identity.js

# Generate with specific seed
node generate-identity.js --seed myproject

# Generate only specific fields
node generate-identity.js --fields name,email,username
```

## Output Format

```json
{
  "firstName": "Alex",
  "lastName": "Morgan",
  "fullName": "Alex Morgan",
  "username": "alexmorgan_dev",
  "email": "alexmorgan.dev@example.com",
  "password": "Tr0ub4dor&3x7",
  "birthdate": "1990-03-15",
  "address": {
    "street": "123 Main Street",
    "city": "San Francisco",
    "state": "CA",
    "zip": "94102",
    "country": "US"
  },
  "phone": "+1-555-0123",
  "company": "Tech Solutions Inc",
  "jobTitle": "Software Engineer"
}
```

## Scripts

- `generate-identity.js` - Generate fake identity
- `generate-username.js` - Generate username from name
- `generate-password.js` - Generate secure password
