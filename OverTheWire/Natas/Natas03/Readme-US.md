# 🕵️ Natas - Level 02-03 (🇺🇸 English)  
*Date:* 05/23/2025  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas3.natas.labs.overthewire.org`, discover where the password is hidden, and use it to advance to the next level.

---

## 🔎 ANALYSIS

- When accessing the main URL, the site displays the message:  
  **"There is nothing on this page"**
- The page source provides no useful information aside from some `.js` scripts and an intriguing HTML comment:  
  `<!-- No more information leaks!! Not even Google will find it this time... -->`
- This leads us to consider that a directory may be intentionally hidden.
- We then move on to a **manual enumeration of directories**, starting with common ones.

---

## 🧱 STEPS

1. Based on the hint in the comment, we tried accessing `robots.txt`, which usually contains rules to prevent search engines from indexing certain paths:  
   `http://natas3.natas.labs.overthewire.org/robots.txt`
2. The content of this file was:
   - `User-agent: *Disallow: /s3cr3t/`
3. This indicates that a directory named `/s3cr3t/` should not be indexed by bots.
4. We directly accessed this directory:  
   `http://natas3.natas.labs.overthewire.org/s3cr3t/`
5. There we found the file `users.txt`.
6. Opening the file, we found the credentials for the next level.

---

## 🔑 PASSWORD FOUND

```
QryZXc2e0zahULdHrtHxzyYkj59kUxLQ
```

---

## ✅ CONCLUSION

This level reinforces the importance of inspecting common files like `robots.txt`, which often reveal hidden or unprotected directories.  
In real-world environments, this kind of exposure can allow attackers to discover sensitive endpoints or confidential files.

---

## 🧪 COMMANDS USED

No terminal commands were needed. The exploration was conducted directly through the browser:

- View page source (Ctrl+U)  
- Direct access to: `/robots.txt` and `/s3cr3t/users.txt`

---

## 🧠 Notes

Attempting to hide directories via `robots.txt` **is not a security measure** — it's merely a suggestion for search engines.  
In a real environment, this can be easily explored by anyone with basic knowledge.  
It's essential to protect this kind of resource with proper authentication or access control.

---

<p align="center">
  <a href="../Natas02/Readme-US.md">⬅️ Previous</a> • 
  <a href="../Natas04/Readme-US.md">Next ➡️</a>
</p>

