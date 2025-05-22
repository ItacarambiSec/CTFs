# 🕵️ Natas - Level 0 (🇺🇸 English)  
*Date:* 2025-05-22  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas0.natas.labs.overthewire.org` and find the password to advance to the next level.

---

## 🔎 ANALYSIS

The homepage shows: “You can find the password for the next level on this page.”  
No input fields or interactions.  
The instructions suggest the password is on the page itself.

---

## 🧱 STEPS

### Initial Inspection

- Opened the page in browser.  
- Used `Ctrl + U` to view the HTML source code.

### Result

- The password was found inside an **HTML comment** in the source code.

---

## 🔑 Password Found

```
0nzCigAq7t2iALyvU9xcHlYN4MlkIwlq
```

---

## ✅ CONCLUSION

- No tools or advanced techniques were needed.  
- This level teaches the value of looking at the raw HTML, especially comments and hidden elements.

---

## 🧪 TOOLS / COMMANDS USED

None — basic browser navigation only.

---

## 🧠 Notes

Every Natas level contains the password to the next level somewhere, often using security flaws or hidden hints.
