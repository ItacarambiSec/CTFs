# 🕵️ Natas - Level 08 (🇺🇸 English)  
*Date:* 2025-05-24  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 Objective

Access `http://natas8.natas.labs.overthewire.org`, identify and decode the correct secret string, and retrieve the password to advance to level 9.

---

## 🔎 Analysis

- Upon accessing the site, we find an interactive input field that expects a **secret**.
- Inspecting the page source, we notice an interesting link:
```html
  <a href="index-source.html">
```
- Accessing this file reveals the backend PHP source code. In it, we find an encoded string:  
`$encodedSecret = "3d3d516343746d4d6d6c315669563362";`
- And a custom encoding function:
  ```php
  function encodeSecret($secret) {
    return bin2hex(strrev(base64_encode($secret))); }
  ```
- This shows that the input is encoded using this function and compared to $encodedSecret.   

---

## 🧱 Steps

1. Accessed the index-source.html file and analyzed the PHP code.   
2. Identified that the expected value is the result of the encodeSecret() function.   
3. Based on the function logic (base64 → reverse → bin2hex), we created a helper script to reverse the process.   
4. The script natas08_encoder_decoder.php was developed and made available here:   
[natas08_encoder_decoder.php](https://github.com/ItacarambiSec/Projects/blob/main/Ctf-scripts/Overthewire_natas/natas08_encoder_decoder.md)
5. We executed the command:
```bash
php natas08_encoder_decoder.php decode 3d3d516343746d4d6d6c315669563362
```
6. The result was:
```bash
oubWYf2kBq
```
7. After submitting this value in the input field and clicking "Submit", we got the following response:
`Access granted. The password for natas9 is ZE1ck82lmdGIoErlhQgWND6j2Wzz6b6t`

---

## 🔑 Password Found

```
ZE1ck82lmdGIoErlhQgWND6j2Wzz6b6t
```

---

## ✅ Conclusion

This level requires understanding and reversing a custom encoding function.
In real-world security testing, this type of challenge is common when facing proprietary obfuscation or transformation logic.
Reversing it with a helper script proved to be the most efficient approach.

---

## 🧪 Commands Used

```bash
php natas08_encoder_decoder.php decode 3d3d516343746d4d6d6c315669563362
```

---

## 🧠 Observations

Even when passwords are not directly visible, it is often possible to retrieve them by reverse engineering validation logic.
This level emphasizes the importance of understanding transformations like Base64, string reversal, and hexadecimal encoding — and reinforces the value of reusable scripts in exploration challenges.

---

## 📎 Scripts Developed

To solve this level, we created a helper script:

[natas08_encoder_decoder.php](https://github.com/ItacarambiSec/Projects/blob/main/Ctf-scripts/Overthewire_natas/natas08_encoder_decoder.md)

This utility can be reused in other levels that use similar encoding logic.

---

<p align="center"> <a href="../Natas07/Readme.md">⬅️ Previous Level</a> • <a href="../Natas09/Readme.md">Next Level ➡️</a> </p> 
