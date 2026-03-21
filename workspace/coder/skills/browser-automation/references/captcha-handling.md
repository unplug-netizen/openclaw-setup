# Captcha Detection and Handling

## Detection

```javascript
// Check for common CAPTCHA indicators
async function detectCaptcha(page) {
  const captchaSelectors = [
    '.g-recaptcha',
    '[data-sitekey]',
    'iframe[src*="recaptcha"]',
    'iframe[src*="hcaptcha"]',
    '.h-captcha',
    '#captcha',
    'text=I\'m not a robot',
    'text=Verify you are human'
  ];
  
  for (const selector of captchaSelectors) {
    const found = await page.locator(selector).first().isVisible().catch(() => false);
    if (found) return true;
  }
  return false;
}
```

## Handling Strategies

### 1. Pause for Manual Solving
```javascript
if (await detectCaptcha(page)) {
  console.log('CAPTCHA detected! Waiting for manual solving...');
  await page.pause(); // Opens Playwright Inspector
}
```

### 2. Use 2captcha/anti-captcha Service
```javascript
// Requires API key and service integration
const captchaToken = await solveRecaptcha(siteKey, pageUrl, apiKey);
await page.evaluate(token => {
  document.getElementById('g-recaptcha-response').value = token;
});
```

### 3. Fallback to User Notification
```javascript
if (await detectCaptcha(page)) {
  // Send notification to user
  await notifyUser('CAPTCHA needs solving at: ' + page.url());
  // Wait for user to complete
  await page.waitForTimeout(60000);
}
```

## Common CAPTCHA Types

| Type | Selector | Handling |
|------|----------|----------|
| reCAPTCHA v2 | `.g-recaptcha` | Manual or service |
| reCAPTCHA v3 | Invisible | Usually automatic |
| hCaptcha | `.h-captcha` | Manual or service |
| Image CAPTCHA | `img[src*="captcha"]` | OCR or manual |
