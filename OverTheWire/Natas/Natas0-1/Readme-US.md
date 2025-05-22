# 🕵️ Natas - Level 0-1 (🇺🇸 English)  
*Date:* 2025-05-22  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas0.natas.labs.overthewire.org`, bypass the restriction applied by the site, and find the password to proceed to the next level.

---

## 🔎 ANALYSIS

- The page displays the message:  
  **"You can find the password for the next level on this page, but rightclicking has been blocked!"**
- The site attempts to prevent source inspection by disabling right-click with JavaScript.

---

## 🧱 STEPS

To bypass this restriction, the shortcut `Ctrl + U` was used to directly view the HTML source code.  
- Inside the source, the password was found in an **HTML comment**.

---

## 🔑 Password Found

```
TguMNxKo1DSa1tujBLuZJnDUlCcUAPlI
```

---

## ✅ CONCLUSION

Client-side restrictions using JavaScript can easily be bypassed with native browser shortcuts.  
This level highlights the importance of inspecting raw HTML in web-based challenges.

---

## 🧪 TOOLS / COMMANDS USED

None — everything was done directly in the browser.

---

## 🧠 Observations

Relying on JavaScript to hide sensitive information is a critical flaw.  
Attackers can easily retrieve data exposed in the frontend, such as API keys, credentials, or internal logic, simply by viewing the source code — making this a real and dangerous client-side security risk.
