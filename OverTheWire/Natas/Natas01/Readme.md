# 🕵️ Natas - Level 01 (🇺🇸 English)  
*Date:* 2025-05-22  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas1.natas.labs.overthewire.org`, bypass the limitation imposed by the site, and find the password to proceed to the next level.

---

## 🔎 ANALYSIS

- When accessing the page, the following message is displayed:  
  **"You can find the password for the next level on this page, but right-clicking has been disabled!"**
- The site attempts to prevent source code inspection by disabling right-click via JavaScript.

---

## 🧱 STEPS

To bypass this, we used the keyboard shortcut `Ctrl + U`, which opens the raw HTML source code directly.  
- Inside the source code, the password was found in an **HTML comment**.

---

## 🔑 PASSWORD FOUND

```
TguMNxKo1DSa1tujBLuZJnDUlCcUAPlI
```


---

## ✅ CONCLUSION

Client-side restrictions via JavaScript are easily bypassed using native browser shortcuts.  
This level highlights the importance of inspecting the raw HTML when solving web challenges.

---

## 🧪 COMMANDS USED

None — everything was done directly in the browser.

---

## 🧠 NOTES

Relying on the client side to hide sensitive information is a critical flaw.  
Any user can inspect the page source and retrieve exposed data like passwords, tokens, or internal routines — making this type of vulnerability a real and common threat in poorly protected applications.

---

<p align="center"> <a href="../Natas00/Readme.md">⬅️ Previous</a> • <a href="../Natas02/Readme.md">Next ➡️</a> </p>
