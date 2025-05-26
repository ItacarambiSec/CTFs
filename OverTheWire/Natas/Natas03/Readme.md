# 🕵️ Natas - Level 03 (🇺🇸 English)  
*Date:* 2025-05-23  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas3.natas.labs.overthewire.org`, discover where the password is hidden, and use it to advance to the next level.

---

## 🔎 ANALYSIS

- When accessing the main URL, the page displays the message:  
  **"There is nothing on this page"**
- The page source provides no useful information, except for a few `.js` scripts and an interesting HTML comment:  
  `<!-- No more information leaks!! Not even Google will find it this time... -->`
- This suggests that a hidden directory may exist intentionally.
- We then start **manual directory enumeration**, beginning with common paths.

---

## 🧱 STEPS

1. Based on the hint in the comment, we try accessing `robots.txt`, which often contains rules that prevent search engines from indexing certain paths:  
   `http://natas3.natas.labs.overthewire.org/robots.txt`
2. The content of this file was:  
   - `User-agent: * Disallow: /s3cr3t/`
3. This indicates the existence of a `/s3cr3t/` directory that should not be indexed by search engines.
4. We manually browse to that directory:  
   `http://natas3.natas.labs.overthewire.org/s3cr3t/`
5. Inside it, we find the file `users.txt`.
6. Opening the file reveals the credentials for the next level.

---

## 🔑 PASSWORD FOUND


```
QryZXc2e0zahULdHrtHxzyYkj59kUxLQ
```

---

## ✅ CONCLUSION

This level reinforces the importance of checking common files like `robots.txt`, which often reveal hidden or unprotected directories.  
In real-world environments, this type of exposure can allow attackers to discover sensitive endpoints or confidential files.

---

## 🧪 COMMANDS USED

No terminal commands were necessary. The entire exploration was done through the browser:

---

## 🧠 NOTES

Trying to hide directories using only `robots.txt` is **not a security measure** — it’s merely a suggestion to search engines.  
In a real environment, this can be easily exploited by any user with basic knowledge.  
Resources like these should be protected with proper authentication or access control.

---

<p align="center"> <a href="../Natas02/Readme.md">⬅️ Previous</a> • <a href="../Natas04/Readme.md">Next ➡️</a> </p>
