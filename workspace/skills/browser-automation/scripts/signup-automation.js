const { chromium } = require('playwright');

/**
 * Generic signup automation
 * Usage: node signup-automation.js <url> <email> <password> [options]
 */

async function signup(url, email, password, options = {}) {
  const browser = await chromium.launch({ headless: options.headless !== false });
  const context = await browser.newContext();
  const page = await context.newPage();
  
  try {
    console.log(`Navigating to: ${url}`);
    await page.goto(url, { waitUntil: 'networkidle' });
    
    // Common email field selectors
    const emailSelectors = [
      'input[type="email"]',
      'input[name="email"]',
      'input[id*="email"]',
      'input[placeholder*="email" i]'
    ];
    
    // Common password field selectors
    const passwordSelectors = [
      'input[type="password"]',
      'input[name="password"]',
      'input[id*="password"]'
    ];
    
    // Try to find and fill email
    for (const selector of emailSelectors) {
      const found = await page.locator(selector).first();
      if (await found.isVisible().catch(() => false)) {
        await found.fill(email);
        console.log('Filled email');
        break;
      }
    }
    
    // Try to find and fill password
    for (const selector of passwordSelectors) {
      const found = await page.locator(selector).first();
      if (await found.isVisible().catch(() => false)) {
        await found.fill(password);
        console.log('Filled password');
        break;
      }
    }
    
    // Look for submit button
    const submitSelectors = [
      'button[type="submit"]',
      'input[type="submit"]',
      'button:has-text("Sign up")',
      'button:has-text("Create account")',
      'button:has-text("Continue")'
    ];
    
    for (const selector of submitSelectors) {
      const found = await page.locator(selector).first();
      if (await found.isVisible().catch(() => false)) {
        await found.click();
        console.log('Clicked submit');
        break;
      }
    }
    
    // Wait for navigation or confirmation
    await page.waitForTimeout(5000);
    
    // Check for success indicators
    const currentUrl = page.url();
    console.log(`Current URL: ${currentUrl}`);
    
    // Screenshot for debugging
    await page.screenshot({ path: 'signup-result.png' });
    console.log('Screenshot saved: signup-result.png');
    
    return { success: true, url: currentUrl };
    
  } catch (error) {
    console.error('Error:', error.message);
    await page.screenshot({ path: 'signup-error.png' });
    return { success: false, error: error.message };
  } finally {
    await browser.close();
  }
}

// CLI usage
if (require.main === module) {
  const [,, url, email, password] = process.argv;
  if (!url || !email || !password) {
    console.log('Usage: node signup-automation.js <url> <email> <password>');
    process.exit(1);
  }
  signup(url, email, password).then(result => {
    console.log('Result:', result);
    process.exit(result.success ? 0 : 1);
  });
}

module.exports = { signup };
