# 🕵️ Natas - Level 03–04 (🇺🇸 English)  
*Date:* 2025-05-23  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas4.natas.labs.overthewire.org` and retrieve the password to advance to level 5.

---

## 🔎 ANALYSIS

- When accessing the URL, we're presented with the following message:  
- **Access denied. You are accessing from `http://natas4.natas.labs.overthewire.org/index.php`, while authorized users should access only from `http://natas5.natas.labs.overthewire.org/`.**
- In addition to the notice, there's a button that lets us reload the page through the `index.php` file. When clicked, it automatically pulls the `Referer` from the request.
- This suggests that the system uses the **HTTP `Referer` header** as a criterion to allow or block access.
- By inspecting the request through the browser's **DevTools** (F12 > "Network" tab > selecting the `index.php` request), we can confirm the following headers:
`Host: natas4.natas.labs.overthewire.org
Referer: http://natas4.natas.labs.overthewire.org/index.php`
- The site expects the request to come from an external referer (`http://natas5.natas.labs.overthewire.org/`), not from its own page.

---

## 🧱 STEPS

1. We identified that the problem lies in the `Referer` header, which must be altered.
2. We used the **`curl`** tool to send a custom request with the correct `Referer`.
3. We executed the following command in the terminal:
```
 curl http://natas4.natas.labs.overthewire.org/ \
   -u natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ \
   -H "Referer: http://natas5.natas.labs.overthewire.org/"
```
4. Upon execution, we get: `Access granted. The password for natas5 is 0n35PkggAPm2zbEpOU802c0x0Msn1ToK`

---

## 🔑 PASSWORD FOUND

```
0n35PkggAPm2zbEpOU802c0x0Msn1ToK
```

## ✅ CONCLUSION

This level shows how the misuse of the Referer header can be easily bypassed, reinforcing that HTTP headers should never be used as a security mechanism.


---

## 🧪 COMMANDS USED

`curl:` Command-line tool for making HTTP requests.  
`-u:` Specifies the user and password in the format user:password.  
`-H:` Allows adding a custom header — in this case, the Referer.  

---

## 🧠 NOTES

Relying on the Referer header for access control is a common security flaw. This header can be easily manipulated by any user using basic tools like curl, Postman, or browser extensions.
In a real-world scenario, access control should be implemented using strong authentication, session tokens, or server-side validation.

---


<p align="center">
  <a href="../Natas02-03/Readme-US.md">⬅️ Level 02–03</a> • 
  <a href="../Natas04-05/Readme-US.md">Level 04–05 ➡️</a>
</p>
