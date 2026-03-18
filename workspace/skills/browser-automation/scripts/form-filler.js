const { chromium } = require('playwright');

/**
 * Fill forms from JSON data
 * Usage: node form-filler.js <url> <data.json>
 */

async function fillForm(url, data, options = {}) {
  const browser = await chromium.launch({ headless: options.headless !== false });
  const context = await browser.newContext();
  const page = await context.newPage();
  
  try {
    await page.goto(url, { waitUntil: 'networkidle' });
    
    for (const [field, value] of Object.entries(data)) {
      // Try multiple selector strategies
      const selectors = [
        `input[name="${field}"]`,
        `input[id="${field}"]`,
        `input[placeholder*="${field}" i]`,
        `textarea[name="${field}"]`,
        `select[name="${field}"]`
      ];
      
      for (const selector of selectors) {
        const element = await page.locator(selector).first();
        if (await element.isVisible().catch(() => false)) {
          const tagName = await element.evaluate(el => el.tagName.toLowerCase());
          
          if (tagName === 'select') {
            await element.selectOption(value);
          } else {
            await element.fill(value);
          }
          console.log(`Filled ${field}: ${value}`);
          break;
        }
      }
    }
    
    await page.screenshot({ path: 'form-filled.png' });
    console.log('Screenshot saved: form-filled.png');
    
    return { success: true };
  } catch (error) {
    console.error('Error:', error.message);
    return { success: false, error: error.message };
  } finally {
    await browser.close();
  }
}

// CLI usage
if (require.main === module) {
  const [,, url, dataFile] = process.argv;
  if (!url || !dataFile) {
    console.log('Usage: node form-filler.js <url> <data.json>');
    process.exit(1);
  }
  
  const fs = require('fs');
  const data = JSON.parse(fs.readFileSync(dataFile, 'utf8'));
  fillForm(url, data).then(result => {
    console.log('Result:', result);
    process.exit(result.success ? 0 : 1);
  });
}

module.exports = { fillForm };
