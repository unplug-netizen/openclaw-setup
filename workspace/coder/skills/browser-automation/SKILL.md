---
name: browser-automation
description: Automate web browser interactions for form filling, account creation, and web workflows. Use when filling out forms, creating accounts on websites, extracting verification links from emails, or performing repetitive web tasks.
---

# Browser Automation

Automate web browser interactions using Playwright.

## Prerequisites

Playwright must be installed:
```bash
npm install -g playwright
playwright install chromium
```

## Capabilities

- Navigate websites and fill forms
- Click buttons and interact with elements
- Extract text and links from pages
- Handle multi-step workflows
- Screenshot pages for debugging
- Wait for dynamic content

## Common Patterns

### Account Creation Workflow
```javascript
// 1. Navigate to signup page
await page.goto('https://service.com/signup');

// 2. Fill form fields
await page.fill('[name="email"]', email);
await page.fill('[name="password"]', password);

// 3. Submit form
await page.click('button[type="submit"]');

// 4. Wait for verification/redirect
await page.waitForNavigation();
```

### Email Verification
```javascript
// 1. Check email for verification link
// 2. Extract link with regex
// 3. Navigate to link
await page.goto(verificationLink);
```

## Scripts

- `signup-automation.js` - Generic signup form handler
- `email-verification.js` - Extract and open verification links
- `form-filler.js` - Fill forms from JSON data

## References

- `references/selectors.md` - Common CSS selectors for popular services
- `references/captcha-handling.md` - Captcha detection and handling
