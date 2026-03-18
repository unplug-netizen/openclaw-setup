const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const VAULT_DIR = path.join(process.env.HOME || process.env.USERPROFILE, '.password-vault');
const VAULT_FILE = path.join(VAULT_DIR, 'vault.json');

// Simple XOR encryption (NOT for production use!)
function encrypt(text, key) {
  const keyBuffer = Buffer.from(key);
  const textBuffer = Buffer.from(text);
  const result = Buffer.alloc(textBuffer.length);
  for (let i = 0; i < textBuffer.length; i++) {
    result[i] = textBuffer[i] ^ keyBuffer[i % keyBuffer.length];
  }
  return result.toString('base64');
}

function decrypt(encrypted, key) {
  const keyBuffer = Buffer.from(key);
  const encryptedBuffer = Buffer.from(encrypted, 'base64');
  const result = Buffer.alloc(encryptedBuffer.length);
  for (let i = 0; i < encryptedBuffer.length; i++) {
    result[i] = encryptedBuffer[i] ^ keyBuffer[i % keyBuffer.length];
  }
  return result.toString('utf8');
}

function ensureVault() {
  if (!fs.existsSync(VAULT_DIR)) {
    fs.mkdirSync(VAULT_DIR, { mode: 0o700 });
  }
  if (!fs.existsSync(VAULT_FILE)) {
    fs.writeFileSync(VAULT_FILE, JSON.stringify({}), { mode: 0o600 });
  }
}

function loadVault() {
  ensureVault();
  const data = fs.readFileSync(VAULT_FILE, 'utf8');
  return JSON.parse(data);
}

function saveVault(vault) {
  fs.writeFileSync(VAULT_FILE, JSON.stringify(vault, null, 2), { mode: 0o600 });
}

function store(service, identifier, password, options = {}) {
  const vault = loadVault();
  const key = `${service}/${identifier}`;
  
  let storedPassword = password;
  if (options.encrypt) {
    const encryptionKey = options.key || process.env.VAULT_KEY || 'default-key-change-me';
    storedPassword = encrypt(password, encryptionKey);
  }
  
  vault[key] = {
    service,
    identifier,
    password: storedPassword,
    encrypted: !!options.encrypt,
    created: new Date().toISOString()
  };
  
  saveVault(vault);
  console.log(`Stored: ${key}`);
}

// CLI usage
if (require.main === module) {
  const [,, service, identifier, password] = process.argv;
  if (!service || !identifier || !password) {
    console.log('Usage: node vault-store.js <service> <identifier> <password> [--encrypt]');
    process.exit(1);
  }
  
  const encrypt = process.argv.includes('--encrypt');
  store(service, identifier, password, { encrypt });
}

module.exports = { store, loadVault, encrypt, decrypt };
