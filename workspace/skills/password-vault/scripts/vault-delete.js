const fs = require('fs');
const path = require('path');

const VAULT_DIR = path.join(process.env.HOME || process.env.USERPROFILE, '.password-vault');
const VAULT_FILE = path.join(VAULT_DIR, 'vault.json');

function remove(service, identifier) {
  if (!fs.existsSync(VAULT_FILE)) {
    console.log('Vault is empty');
    return false;
  }
  
  const vault = JSON.parse(fs.readFileSync(VAULT_FILE, 'utf8'));
  const key = `${service}/${identifier}`;
  
  if (!vault[key]) {
    console.log(`Not found: ${key}`);
    return false;
  }
  
  delete vault[key];
  fs.writeFileSync(VAULT_FILE, JSON.stringify(vault, null, 2), { mode: 0o600 });
  console.log(`Deleted: ${key}`);
  return true;
}

// CLI usage
if (require.main === module) {
  const [,, service, identifier] = process.argv;
  if (!service || !identifier) {
    console.log('Usage: node vault-delete.js <service> <identifier>');
    process.exit(1);
  }
  
  const result = remove(service, identifier);
  process.exit(result ? 0 : 1);
}

module.exports = { remove };
