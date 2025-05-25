# 🕵️ Natas - Level 07 (🇺🇸 English)  
*Date:* 2025-05-24  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas7.natas.labs.overthewire.org` and retrieve the password to advance to level 8.

---

## 🔎 ANALYSIS

- After logging in with the credentials from the previous level, we find a simple interface with **two navigation links**:

  ```html
  <a href="index.php?page=home">Home</a>
  <a href="index.php?page=about">About</a>
- In the page source, there’s also an interesting HTML comment:
  `<!-- hint: password for webuser natas8 is in /etc/natas_webpass/natas8 -->`
- This provides a crucial hint: the index.php file loads page content based on the page parameter passed via the URL.
- That likely means the file uses this parameter to include other files — a dangerous behavior if not properly validated.
- We suspect a Local File Inclusion (LFI) vulnerability and test the following URL:
`http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8`
- And it works! The contents of the file are displayed directly in the browser, revealing the password for the next level.

---

## 🧱 STEPS

1. Accessed `http://natas7.natas.labs.overthewire.org` using the credentials from level 6.
2. Inspected the page source and found links using the page parameter.
3. Noticed a comment indicating the path to the natas8 password file.
4. Suspected a local file inclusion vulnerability.
5. Modified the URL to directly load the password file:
`http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8`
6. The server returned the contents of the file, revealing the next password.

---

## 🔑 PASSWORD FOUND

```
lW0CNOOkm0oQ4JVBkJ9yuGe1n9rMil45
```

---

## ✅ CONCLUSION

This level highlights how exposing server-side include files can completely compromise application logic.
It reinforces the need for directory-level access control and secure file handling practices in web servers.This level demonstrates a critical vulnerability: arbitrary file inclusion via user input.
LFI vulnerabilities allow attackers to read sensitive files from the server and, in some configurations, may even lead to code execution.

---

## 🧪 COMMANDS USED

No terminal commands were needed in this level.  
All steps were executed via the browser  

---

## 🧠 NOTES

In real-world applications, LFI (Local File Inclusion) or RFI (Remote File Inclusion) vulnerabilities can result in information disclosure, session hijacking, or remote code execution.
To prevent this:

- Never include files based directly on user input.
- Use whitelists to strictly define what can be loaded.
- Disable risky PHP options like allow_url_include.

---

<p align="center"> <a href="../Natas06/Readme-US.md">⬅️ Previous</a> • <a href="../Natas08/Readme-US.md">Next ➡️</a> </p>

