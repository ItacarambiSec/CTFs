# 🕵️ Natas - Level 11 (🇺🇸 English)  
*Date:* 2025-05-30  
*Difficulty:* Medium   
*Category:* Web   

---

## 🎯 Objective

The objective of this challenge is to exploit the XOR encryption vulnerability used in cookie protection to obtain the next level password (Natas12).  

---

## 🔎 Analysis

- The web application at `http://natas11.natas.labs.overthewire.org/` uses cookies to store user preferences, such as the option to show the password and the background color.  
- The source code reveals that these cookies are protected using XOR encryption with a secret key.  
- The preferences are stored in JSON format, then XOR encrypted, and finally Base64 encoded before being set to the cookie value "data".  
- The PHP script has logic that checks whether the `showpassword` preference is set to "yes". If it is, the password for the next level is displayed on the page.  
- By analyzing the source code and knowing the standard format of the cookie data, we can perform a known-plaintext attack to discover the XOR key used.  

---

## 🧱 Steps

1. **Access the Application:** Navigate to `http://natas11.natas.labs.overthewire.org/`.
2. **Analyze the Cookie:** Inspect the browser cookies and identify the cookie named "data". Copy the value of this cookie.
3. **Base64 Decode:** Use a Base64 decoder (such as the `base64 -d` command on Linux or an online decoder) to decode the value of the "data" cookie.
4. **Known Plaintext Attack:**
    - Identify the known plaintext (the default values): `{"showpassword":"no","bgcolor":"#ffffff"}`.
    - Perform the byte-by-byte XOR operation between the known plaintext and the ciphertext (result of the Base64 decoding) to discover the XOR key. We use a Python script to automate this step. 
5. **Identify XOR Key:** The script revealed that the XOR key used is `eDWo`.  
6. **Create Malicious Payload:** Construct a Python dictionary representing the desired data, with the `showpassword` key set to `"yes"` and `bgcolor` holding a valid hexadecimal value (e.g. `#ffffff`).  
7. **Encode to JSON:** Convert the Python dictionary to a JSON string using `json.dumps()`.  
8. **Encrypt with XOR:** Apply the byte-by-byte XOR operation between the JSON string and the XOR key (`eDWo`). We implemented this logic in a Python script.  
9. **Encode to Base64:** Encode the result of the previous step to Base64 using `base64.b64encode()`. 10. **Replace the Cookie:** Use your browser's developer tools (or a proxy like Burp Suite) to replace the "data" cookie value with the value generated in the previous step.  
11. **Reload the Page:** Reload the page so that the server can read the modified cookie.  

---

## 🔑 Password Found

```
yZdkjAYZRd3R7tq7T5kXMjMJlOIkzDeB
```

---

## ✅ Conclusion

The XOR encryption vulnerability with a fixed key allowed a known-plaintext attack to be performed to discover the key used.  With the key in hand, it was possible to manipulate the "data" cookie to change the `showpassword` preference to "yes", resulting in the password being displayed for the next level (Natas12).  

---

## 🧪 Commands Used

```bash

python [natas11_discover_key.py] ()  
python [natas11_manipulate_cookie.py] ()  
```

---

## 🧠 Notes

- Security based on XOR encryption with a static and easily discovered key is fragile and should not be used to protect sensitive information.  
- The lack of randomness (such as a salt) in encryption makes the system vulnerable to known-plaintext attacks.  
- It is crucial to use robust encryption algorithms and secure key management practices to protect data in cookies or any other form of storage.  

---

## 📎 Scripts Developed

`natas11_discover_key.py`: Python script used to discover the XOR key via known-plaintext attack.  
`natas11_manipulate_cookie.py`: Python script used to generate the manipulated "data" cookie value with `showpassword` set to "yes".  

---

<p align="center"> <a href="../Natas10/Readme.md">⬅️ Previous</a> • <a href="../Natas12/Readme.md">Next ➡️</a> </p>
