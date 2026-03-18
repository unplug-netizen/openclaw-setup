const crypto = require('crypto');

/**
 * Generate username from name components
 */

function generateUsername(firstName, lastName, options = {}) {
  const strategies = [
    () => `${firstName.toLowerCase()}${lastName.toLowerCase()}`,
    () => `${firstName.toLowerCase()}_${lastName.toLowerCase()}`,
    () => `${firstName.toLowerCase()}.${lastName.toLowerCase()}`,
    () => `${firstName[0].toLowerCase()}${lastName.toLowerCase()}`,
    () => `${firstName.toLowerCase()}${lastName[0].toLowerCase()}`,
    () => `${lastName.toLowerCase()}${firstName.toLowerCase()}`,
  ];
  
  const random = options.seed ? 
    parseInt(crypto.createHash('md5').update(options.seed).digest('hex').substring(0, 8), 16) / 0xffffffff :
    Math.random();
  
  const strategy = strategies[Math.floor(random * strategies.length)];
  let username = strategy();
  
  // Add random suffix if requested
  if (options.addSuffix) {
    username += `_${Math.floor(Math.random() * 10000)}`;
  }
  
  // Add prefix if requested
  if (options.prefix) {
    username = `${options.prefix}_${username}`;
  }
  
  return username;
}

// CLI usage
if (require.main === module) {
  const [,, firstName, lastName] = process.argv;
  if (!firstName || !lastName) {
    console.log('Usage: node generate-username.js <firstName> <lastName> [options]');
    process.exit(1);
  }
  
  const username = generateUsername(firstName, lastName, { addSuffix: true });
  console.log(username);
}

module.exports = { generateUsername };
