const crypto = require('crypto');

const firstNames = [
  'Alex', 'Jordan', 'Taylor', 'Morgan', 'Casey', 'Riley', 'Quinn', 'Avery',
  'Sam', 'Jamie', 'Dakota', 'Reese', 'Skyler', 'Rowan', 'Emerson', 'Finley',
  'Emma', 'Liam', 'Olivia', 'Noah', 'Ava', 'Oliver', 'Isabella', 'Elijah',
  'Sophia', 'Lucas', 'Mia', 'Mason', 'Charlotte', 'Ethan'
];

const lastNames = [
  'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller', 'Davis',
  'Rodriguez', 'Martinez', 'Hernandez', 'Lopez', 'Gonzalez', 'Wilson', 'Anderson',
  'Thomas', 'Taylor', 'Moore', 'Jackson', 'Martin', 'Lee', 'Perez', 'Thompson',
  'White', 'Harris', 'Sanchez', 'Clark', 'Ramirez', 'Lewis', 'Robinson'
];

const domains = ['example.com', 'testmail.com', 'devmail.net', 'automation.io'];

const cities = [
  { name: 'San Francisco', state: 'CA', zip: '94102' },
  { name: 'New York', state: 'NY', zip: '10001' },
  { name: 'Austin', state: 'TX', zip: '78701' },
  { name: 'Seattle', state: 'WA', zip: '98101' },
  { name: 'Denver', state: 'CO', zip: '80201' },
  { name: 'Boston', state: 'MA', zip: '02101' },
  { name: 'Chicago', state: 'IL', zip: '60601' },
  { name: 'Portland', state: 'OR', zip: '97201' }
];

const companies = [
  'Tech Solutions', 'Digital Innovations', 'Cloud Systems', 'Data Dynamics',
  'Smart Apps', 'Code Works', 'Net Services', 'Web Systems', 'Dev Studio',
  'Software Labs', 'Tech Ventures', 'Digital First', 'Innovation Hub'
];

const jobTitles = [
  'Software Engineer', 'Developer', 'Product Manager', 'Designer',
  'DevOps Engineer', 'Data Analyst', 'QA Engineer', 'Tech Lead',
  'Full Stack Developer', 'Frontend Developer', 'Backend Developer'
];

function seededRandom(seed) {
  const hash = crypto.createHash('md5').update(seed).digest('hex');
  return parseInt(hash.substring(0, 8), 16) / 0xffffffff;
}

function generatePassword(length = 16) {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*';
  let password = '';
  for (let i = 0; i < length; i++) {
    password += chars[Math.floor(Math.random() * chars.length)];
  }
  return password;
}

function generateIdentity(seed = null) {
  const random = seed ? seededRandom(seed) : Math.random();
  
  const firstName = firstNames[Math.floor(random * firstNames.length)];
  const lastName = lastNames[Math.floor(random * lastNames.length)];
  const fullName = `${firstName} ${lastName}`;
  
  const username = `${firstName.toLowerCase()}${lastName.toLowerCase()}_${Math.floor(random * 1000)}`;
  const domain = domains[Math.floor(random * domains.length)];
  const email = `${firstName.toLowerCase()}.${lastName.toLowerCase()}@${domain}`;
  
  const city = cities[Math.floor(random * cities.length)];
  const streetNumber = Math.floor(100 + random * 900);
  
  const birthYear = 1980 + Math.floor(random * 25);
  const birthMonth = 1 + Math.floor(random * 12);
  const birthDay = 1 + Math.floor(random * 28);
  const birthdate = `${birthYear}-${String(birthMonth).padStart(2, '0')}-${String(birthDay).padStart(2, '0')}`;
  
  const company = companies[Math.floor(random * companies.length)];
  const jobTitle = jobTitles[Math.floor(random * jobTitles.length)];
  
  return {
    firstName,
    lastName,
    fullName,
    username,
    email,
    password: generatePassword(),
    birthdate,
    age: new Date().getFullYear() - birthYear,
    address: {
      street: `${streetNumber} ${['Main', 'Oak', 'Pine', 'Cedar', 'Maple'][Math.floor(random * 5)]} Street`,
      city: city.name,
      state: city.state,
      zip: city.zip,
      country: 'US'
    },
    phone: `+1-555-${String(Math.floor(random * 10000)).padStart(4, '0')}`,
    company: `${company} Inc`,
    jobTitle
  };
}

// CLI usage
if (require.main === module) {
  const args = process.argv.slice(2);
  const seedIndex = args.indexOf('--seed');
  const seed = seedIndex !== -1 ? args[seedIndex + 1] : null;
  
  const identity = generateIdentity(seed);
  console.log(JSON.stringify(identity, null, 2));
}

module.exports = { generateIdentity, generatePassword };
