# 🕵️ Natas - Level 02 (🇺🇸 English)  
*Date:* 05/22/2025  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas2.natas.labs.overthewire.org`, identify where the password is stored, and use it to proceed to the next level.

---

## 🔎 ANALYSIS

- When accessing the main URL, the site only displays the message:  
  **"There is nothing on this page"**.
- The page contains no interactive elements or visible content.
- So we move on to inspect the **HTML source code**.
- In the HTML, we identified some scripts and an image referenced via:  
  `<img src="files/pixel.png">`
- This suggests the existence of an accessible directory called `files`.

---

## 🧱 STEPS

1. We manually accessed the directory:  
   `http://natas2.natas.labs.overthewire.org/files/`
2. Inside it, there were two files:  
   - `pixel.png` (the previously referenced image)  
   - `users.txt`
3. When opening `users.txt`, we found a list of users and passwords.
4. We located the password for the next level associated with the current user (natas3).

---

## 🔑 PASSWORD FOUND

```
3gqisGdR0pjm6tpkDKdIWO2hSvchLeYH
```

---

## ✅ CONCLUSION

This level illustrates the importance of testing common directories and paths (like `/files/`, `/admin/`, etc.) even if they’re not visible on the main interface.  
Exposing sensitive files in publicly accessible directories is a recurring and dangerous flaw in web systems.

---

## 🧪 COMMANDS USED

No terminal commands were necessary. The exploration was conducted directly via browser:

- Source code viewing (Ctrl+U)  
- Direct URL navigation

---

## 🧠 Notes

Exposing directories and sensitive files (like `users.txt`) is a serious risk.  
In real environments, this could grant access to valid credentials, API routes, configuration files, and even backups.  
It is crucial to properly configure access permissions and avoid publishing internal files in production environments.

---

<p align="center">
  <a href="../Natas01/Readme-US.md">⬅️ Previous</a> • 
  <a href="../Natas03/Readme-US.md">Next ➡️</a>
</p>

