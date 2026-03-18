const crypto = require('crypto');

/**
 * Generate secure password
 */

const DEFAULT_LENGTH = 16;

const CHAR_SETS = {
  lowercase: 'abcdefghijklmnopqrstuvwxyz',
  uppercase: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
  numbers: '0123456789',
  symbols: '!@#$%^&*()_+-=[]{}|;:,.<>?'
};

function generatePassword(options = {}) {
  const length = options.length || DEFAULT_LENGTH;
  const includeSymbols = options.symbols !== false;
  const includeNumbers = options.numbers !== false;
  
  let chars = CHAR_SETS.lowercase + CHAR_SETS.uppercase;
  if (includeNumbers) chars += CHAR_SETS.numbers;
  if (includeSymbols) chars += CHAR_SETS.symbols;
  
  let password = '';
  
  // Ensure at least one of each required type
  password += CHAR_SETS.lowercase[Math.floor(Math.random() * CHAR_SETS.lowercase.length)];
  password += CHAR_SETS.uppercase[Math.floor(Math.random() * CHAR_SETS.uppercase.length)];
  if (includeNumbers) {
    password += CHAR_SETS.numbers[Math.floor(Math.random() * CHAR_SETS.numbers.length)];
  }
  if (includeSymbols) {
    password += CHAR_SETS.symbols[Math.floor(Math.random() * CHAR_SETS.symbols.length)];
  }
  
  // Fill remaining length
  for (let i = password.length; i < length; i++) {
    password += chars[Math.floor(Math.random() * chars.length)];
  }
  
  // Shuffle
  return password.split('').sort(() => Math.random() - 0.5).join('');
}

function generatePassphrase(options = {}) {
  const words = [
    'apple', 'banana', 'cherry', 'dragon', 'eagle', 'falcon', 'garden', 'harbor',
    'island', 'jungle', 'knight', 'lemon', 'mountain', 'nebula', 'ocean', 'piano',
    'quantum', 'river', 'sunset', 'tiger', 'unicorn', 'valley', 'whale', 'zenith'
  ];
  
  const count = options.words || 4;
  const selected = [];
  
  for (let i = 0; i < count; i++) {
    selected.push(words[Math.floor(Math.random() * words.length)]);
  }
  
  const number = Math.floor(Math.random() * 100);
  return `${selected.join('-')}-${number}`;
}

// CLI usage
if (require.main === module) {
  const args = process.argv.slice(2);
  
  if (args.includes('--passphrase')) {
    console.log(generatePassphrase());
  } else {
    const lengthArg = args.find(a => a.startsWith('--length='));
    const length = lengthArg ? parseInt(lengthArg.split('=')[1]) : DEFAULT_LENGTH;
    console.log(generatePassword({ length }));
  }
}

module.exports = { generatePassword, generatePassphrase };
