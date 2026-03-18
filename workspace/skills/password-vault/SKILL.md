---
name: password-vault
description: Securely store and manage passwords and API tokens locally. Use when saving credentials for accounts, API keys, or tokens that need to be retrieved later.
---

# Password Vault

Secure local storage for passwords and API tokens.

## Storage Location

- **Linux/macOS**: `~/.password-vault/`
- **File format**: JSON with optional basic encryption

## Security Notes

⚠️ **This is NOT a production password manager!**
- Uses basic file permissions (600) for protection
- Optional XOR encryption (not cryptographically secure)
- Intended for automation/testing credentials only
- For production: Use proper secret management (HashiCorp Vault, AWS Secrets Manager, etc.)

## Capabilities

- Store passwords with service/identifier
- Retrieve passwords by key
- List all stored credentials
- Delete credentials
- Import/export functionality
- Basic encryption option

## Usage

```bash
# Store password
node vault-store.js <service> <identifier> <password>

# Retrieve password
node vault-get.js <service> <identifier>

# List all credentials
node vault-list.js

# Delete credential
node vault-delete.js <service> <identifier>

# Export all (encrypted)
node vault-export.js --encrypt

# Import from file
node vault-import.js <file>
```

## Scripts

- `vault-store.js` - Store a credential
- `vault-get.js` - Retrieve a credential
- `vault-list.js` - List all credentials
- `vault-delete.js` - Delete a credential
- `vault-export.js` - Export credentials
- `vault-import.js` - Import credentials
