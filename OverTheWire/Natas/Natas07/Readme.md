# 🕵️ Natas - Level 07 (🇺🇸 English)  
*Date:* 2025-05-24  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas7.natas.labs.overthewire.org` and retrieve the password to advance to level 8.

---

## 🔎 ANALYSIS

- When accessing the URL with the credentials obtained from the previous level, we are presented with an interface containing **two links**:

```html
  <a href="index.php?page=home">Home</a>
  <a href="index.php?page=about">About</a>
```
- Additionally, the page source contains a helpful HTML comment:   
`<!-- hint: password for webuser natas8 is in /etc/natas_webpass/natas8 -->`
- This gives us a strong clue: the page content is being loaded dynamically based on the page parameter in the URL.  
- This also suggests that `index.php` is including or loading files directly based on user input.
If proper validation is not in place, this can lead to arbitrary file reading — a Local File Inclusion (LFI) vulnerability.
- Based on this, we attempt to load the mentioned file directly via the page parameter:  
`http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8`

---

## 🧱 Steps

1. Accessed `http://natas7.natas.labs.overthewire.org` with the correct credentials.  
2. Inspected the page source and found two links based on the `page` parameter.  
3. Also found a comment pointing to the location of the password file for `natas8`.  
4. Suspected a Local File Inclusion (LFI) vulnerability via the `page` parameter.
5. Modified the URL to directly load the password file:  
`http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8`
6. The contents of the file were successfully loaded in the browser, revealing the password.  
---

## 🔑 Password Found

```
xcoXLmzMkoIP9D7hlgPlh9XD7OgLAe5Q
```

---

## ✅ Conclusion

This level demonstrates a critical vulnerability: arbitrary file inclusion via GET parameter.
Vulnerabilities like this allow users to read sensitive files from the system, completely compromising the application.
It is essential to validate and sanitize any user input used to load or include files.

---

## 🧪 Commands Used

No terminal commands were required in this level.
All steps were performed directly through the browser.

---

## 🧠 Observations

In real-world applications, file inclusion vulnerabilities (LFI/RFI) can allow anything from reading private files to remote code execution, depending on server configuration.
Best practices include:

Never use raw user input in `include()` or `require()` functions.  
Use whitelists to restrict loadable files.  
Disable dangerous PHP directives (like `allow_url_include`, etc.).  

---

<p align="center"> <a href="../Natas06/Readme.md">⬅️ Previous</a> • <a href="../Natas08/Readme.md">Next ➡️</a> </p>
