# 🕵️ Natas - Level 02 (🇺🇸 English)  
*Date:* 2025-05-22  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas2.natas.labs.overthewire.org`, identify where the password is stored, and use it to advance to the next level.

---

## 🔎 ANALYSIS

- When accessing the main URL, the site displays only the message:  
  **"There is nothing on this page."**
- The page contains no visible content or interactive elements.
- This leads us to inspect the **HTML source code**.
- In the HTML, we find some scripts and an image referenced with:  
  `<img src="files/pixel.png">`
- This suggests the existence of a browsable directory called `files`.

---

## 🧱 STEPS

1. We manually accessed the directory:  
   `http://natas2.natas.labs.overthewire.org/files/`
2. Inside it, two files were listed:  
   - `pixel.png` (the referenced image)  
   - `users.txt`
3. Opening `users.txt` revealed a list of users and passwords.
4. We located the password for the next level associated with the current user (natas3).

---

## 🔑 PASSWORD FOUND

```
3gqisGdR0pjm6tpkDKdIWO2hSvchLeYH
```

---

## ✅ CONCLUSION

This level illustrates the importance of testing common directories and paths (such as `/files/`, `/admin/`, etc.), even if they are not visible in the main interface.  
The exposure of sensitive files in publicly accessible directories is a recurring and dangerous flaw in web systems.

---

## 🧪 COMMANDS USED

No terminal commands were necessary. The entire exploration was done through the browser:

- Viewing page source (`Ctrl+U`)  
- Direct URL navigation

---

## 🧠 NOTES

Exposing directories and sensitive files (like `users.txt`) poses a serious security risk.  
In real-world scenarios, this could grant access to valid credentials, API routes, config files, or even backups.  
Proper permission settings and file management are essential to avoid such exposures in production environments.

---

<p align="center">
  <a href="../Natas01/Readme.md">⬅️ Previous</a> • 
  <a href="../Natas03/Readme.md">Next ➡️</a>
</p>
