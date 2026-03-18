# Common CSS Selectors for Popular Services

## Firebase / Google

```css
/* Signup */
input[type="email"]
input[name="email"]
input#identifierId
input[type="password"]
button:has-text("Next")
button:has-text("Create account")

/* Verification */
div:has-text("Verify your email")
a[href*="verify"]
```

## Vercel

```css
/* Signup */
input[name="email"]
input[type="password"]
input[name="username"]
button:has-text("Sign Up")
button:has-text("Continue")

/* Dashboard */
a[href*="/new"]
button:has-text("Add Project")
```

## GitHub

```css
/* Signup */
input#user_login
input#user_email
input#user_password
button:has-text("Sign up")

/* Verification */
a[href*="/users/confirmation"]
```

## Generic Patterns

```css
/* Email fields */
input[type="email"]
input[name*="email" i]
input[id*="email" i]
input[placeholder*="email" i]

/* Password fields */
input[type="password"]
input[name*="password" i]
input[name*="pass" i]

/* Submit buttons */
button[type="submit"]
input[type="submit"]
button:has-text("Sign up")
button:has-text("Create")
button:has-text("Continue")
button:has-text("Next")

/* Checkboxes */
input[type="checkbox"][name*="terms"]
input[type="checkbox"][name*="agree"]
```
