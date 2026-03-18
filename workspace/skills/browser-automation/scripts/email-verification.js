const { chromium } = require('playwright');

/**
 * Extract verification links from email content and open them
 */

async function openVerificationLink(emailContent, options = {}) {
  // Common verification link patterns
  const patterns = [
    /https:\/\/[^\s"]+verify[^\s"]*/i,
    /https:\/\/[^\s"]+confirm[^\s"]*/i,
    /https:\/\/[^\s"]+activate[^\s"]*/i,
    /https:\/\/[^\s"]+auth[^\s"]*/i,
    /https:\/\/[^\s"]+\/verify[?\/][^\s"]*/i
  ];
  
  let link = null;
  for (const pattern of patterns) {
    const match = emailContent.match(pattern);
    if (match) {
      link = match[0];
      break;
    }
  }
  
  if (!link) {
    console.log('No verification link found');
    return { success: false, error: 'No link found' };
  }
  
  console.log(`Found verification link: ${link}`);
  
  if (options.open !== false) {
    const browser = await chromium.launch({ headless: options.headless !== false });
    const context = await browser.newContext();
    const page = await context.newPage();
    
    try {
      await page.goto(link, { waitUntil: 'networkidle' });
      await page.waitForTimeout(3000);
      
      const currentUrl = page.url();
      console.log(`Verified! Current URL: ${currentUrl}`);
      
      await page.screenshot({ path: 'verification-result.png' });
      
      await browser.close();
      return { success: true, url: currentUrl, link };
    } catch (error) {
      await browser.close();
      return { success: false, error: error.message, link };
    }
  }
  
  return { success: true, link };
}

// CLI usage
if (require.main === module) {
  const [,, emailFile] = process.argv;
  if (!emailFile) {
    console.log('Usage: node email-verification.js <path-to-email-content>');
    process.exit(1);
  }
  
  const fs = require('fs');
  const content = fs.readFileSync(emailFile, 'utf8');
  openVerificationLink(content).then(result => {
    console.log('Result:', result);
    process.exit(result.success ? 0 : 1);
  });
}

module.exports = { openVerificationLink };
