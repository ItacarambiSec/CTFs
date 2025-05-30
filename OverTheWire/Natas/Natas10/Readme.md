# 🕵️ Natas - Level 10 (🇺🇸 English)  
*Date: 2025-05-27* 
*Difficulty: Easy* 
*Category: Web* 

---

## 🎯 Objective

The objective in this level is to exploit a command injection vulnerability in the PHP script to obtain the password for the next level (`natas11`). The challenge is to bypass a security filter that blocks common command concatenation characters.

---

## 🔎 Analysis

- The Natas10 web application has an input field "Find words containing:", which uses the `grep` function to search for words in a `dictionary.txt` file. 
- When analyzing the PHP source code, we identified the following excerpt:
```php
if($key != "") {
if(preg_match('/[;|&]/',$key)) {
print "Input contains an illegal character!"; } else {
        passthru("grep -i $key dictionary.txt");
    }
}
```
- This code applies a basic security filter using `preg_match`. It checks if the input ($key) contains the semicolon (;) or pipe (|) characters. If either of these characters is found, the script prints an error message "Input contains an illegal character!". 
- The `passthru()` function is used to execute the `grep` command directly in the operating system shell, making it vulnerable to command injection if the input is not properly sanitized. 
- Initial injection attempts using `;` (e.g. `test; cat /etc/natas_webpass/natas11`) were blocked by the filter, as expected. 
- We observed that HTTP requests use URL-Encoding for special characters (e.g. `%3B` for ;, `%2F` for /, `+` or `%20` for space). 

---

## 🧱 Steps

1. Filter Analysis: We confirm that the filter blocks ; and |, preventing most direct command injection techniques. 
2. Identifying Other Separators: We reflect on other characters that the operating system shell interprets as command separators, notably the newline character `\n`. 
3. Newline Encoding: Since `\n` cannot be inserted directly into the URL, we decided to use its URL-Encoding representation, which is `%0A`. 
4. Payload Formulation: We construct the payload by injecting \n (as %0A) followed by the desired command: `test%0Acat%20/etc/natas_webpass/natas11`. 5. Attack Execution: We inserted the payload directly into the Natas10 URL (e.g. `http://natas10.natas.labs.overthewire.org/?needle=test%0Acat%20/etc/natas_webpass/natas11`).
6. Response Validation: The server processed the request and returned the `grep` result (listing words from dictionary.txt that contain "test") and, crucially, the output of the `cat /etc/natas_webpass/natas11` command, revealing the next level password.

---

## 🔑 Password Found

```
UJdqkK1pTu6VLt9UHWAgRZz6sVUZ3lEk
```

## ✅ Conclusion

The exploit was successful because the PHP filter was an incomplete blacklist, targeting only a few characters (; and |) and failing to consider other command delimiters such as the newline character (\n). The operating system shell interprets \n as a command separator, allowing the execution of a second injected command, even after PHP decodes the URL. This case reinforces the importance of using whitelists (allowing only what is explicitly safe) and correctly escaping arguments passed to system commands.

---

## 🧪 Commands Used

`cat /etc/natas_webpass/natas11`: Injected command to read the password file. (Without URL-encoding)

---

## 🧠 Notes

- The `$_REQUEST` in PHP automatically decodes URL parameters. This means that `%0A` is transformed into `\n` before reaching `preg_match` and `passthru()`. 
- The weakness of blacklist-based filters is evident here; there are always other characters or methods that can be used to bypass them. 
- PHP's escapeshellarg() function would be a more effective security measure, as it would escape the entire argument, preventing the `\n` from being interpreted as a command separator by the shell. 

---

<p align="center"> <a href="../Natas09/Readme.md">⬅️ Previous</a> • <a href="../Natas11/Readme.md">Next ➡️</a> </p>
