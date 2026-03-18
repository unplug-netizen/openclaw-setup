const fs = require('fs');
const path = require('path');

const VAULT_DIR = path.join(process.env.HOME || process.env.USERPROFILE, '.password-vault');
const VAULT_FILE = path.join(VAULT_DIR, 'vault.json');

function decrypt(encrypted, key) {
  const keyBuffer = Buffer.from(key);
  const encryptedBuffer = Buffer.from(encrypted, 'base64');
  const result = Buffer.alloc(encryptedBuffer.length);
  for (let i = 0; i < encryptedBuffer.length; i++) {
    result[i] = encryptedBuffer[i] ^ keyBuffer[i % keyBuffer.length];
  }
  return result.toString('utf8');
}

function get(service, identifier) {
  if (!fs.existsSync(VAULT_FILE)) {
    console.log('Vault is empty');
    return null;
  }
  
  const vault = JSON.parse(fs.readFileSync(VAULT_FILE, 'utf8'));
  const key = `${service}/${identifier}`;
  const entry = vault[key];
  
  if (!entry) {
    console.log(`Not found: ${key}`);
    return null;
  }
  
  let password = entry.password;
  if (entry.encrypted) {
    const encryptionKey = process.env.VAULT_KEY || 'default-key-change-me';
    password = decrypt(password, encryptionKey);
  }
  
  console.log(password);
  return password;
}

// CLI usage
if (require.main === module) {
  const [,, service, identifier] = process.argv;
  if (!service || !identifier) {
    console.log('Usage: node vault-get.js <service> <identifier>');
    process.exit(1);
  }
  
  const password = get(service, identifier);
  process.exit(password ? 0 : 1);
}

module.exports = { get };
