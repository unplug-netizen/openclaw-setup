const fs = require('fs');
const path = require('path');

const VAULT_DIR = path.join(process.env.HOME || process.env.USERPROFILE, '.password-vault');
const VAULT_FILE = path.join(VAULT_DIR, 'vault.json');

function list() {
  if (!fs.existsSync(VAULT_FILE)) {
    console.log('Vault is empty');
    return [];
  }
  
  const vault = JSON.parse(fs.readFileSync(VAULT_FILE, 'utf8'));
  const entries = Object.values(vault);
  
  if (entries.length === 0) {
    console.log('Vault is empty');
    return [];
  }
  
  console.log('Stored credentials:');
  console.log('');
  
  entries.forEach(entry => {
    const encryptedIndicator = entry.encrypted ? ' 🔒' : '';
    console.log(`  ${entry.service}/${entry.identifier}${encryptedIndicator}`);
    console.log(`    Created: ${entry.created}`);
    console.log('');
  });
  
  return entries;
}

// CLI usage
if (require.main === module) {
  list();
}

module.exports = { list };
