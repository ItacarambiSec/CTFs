# 🕵️ Natas - Level 09 (🇺🇸 English)  
*Date: 2025-05-27*   
*Difficulty: Easy*   
*Category: Web*   

---

## 🎯 Objective

The objective of this challenge is to identify and exploit a command injection vulnerability in a web application in order to obtain the password for the next level (Natas10).

---

## 🔎 Analysis

- The web application at `http://natas9.natas.labs.overthewire.org/` has a search field that apparently searches for words in a dictionary file `(dictionary.txt).` 
- When analyzing the source code, a PHP script reveals the use of the `passthru()` function to execute the command grep -i $key dictionary.txt. 
```php
<?
$key = "";

if(array_key_exists("needle", $_REQUEST)) {
$key = $_REQUEST["needle"];
}

if($key != "") {
passthru("grep -i $key dictionary.txt");
}
?>
```

- The `$key` variable directly receives the value of the `needle` parameter sent via request ($_REQUEST["needle"]), without any input processing.
- The `passthru()` function executes system commands and displays the raw output in the browser, making it dangerous if the user input is not sanitized.
- The lack of sanitization of the user input for the `needlev parameter makes the script vulnerable to command injection, allowing the execution of arbitrary commands on the server.

---

## 🧱 Steps

1. Access the Application: Navigate to `http://natas9.natas.labs.overthewire.org/`.
2. Identify the Search Field: Locate the "Find words containing:" input and the search button.
3. Analyze Behavior: Test the search with a common term such as "test" and observe the output.
4. Inspect Source Code: View the page's source code to find the PHP script and identify the `passthru()` function and input handling.
5. Test Command Injection: Enter `test; pwd` in the search field to verify the execution of arbitrary commands and confirm the vulnerability.
6. Obtain the Password: Use command injection to read the Natas10 password file by entering `test; cat /etc/natas_webpass/natas9` in the search field.

---

## 🔑 Password Found

```
ZE1ck82lmdGIoErlhQgWND6j2Wzz6b6t
```

---

## ✅ Conclusion

The command injection vulnerability was successfully exploited, allowing the execution of operating system commands directly through the application's search field. This made it possible to read the password file `/etc/natas_webpass/natas9`, obtaining the credential for the next level. The lack of validation and sanitization of user input for the `needle` parameter was the main cause of this critical security flaw.

---

## 🧪 Commands Used

`test; pwd` 
`test; cat /etc/natas_webpass/natas9`

---

## 🧠 Notes

This level illustrates the critical importance of validating and sanitizing all user input in web applications. The `passthru()` function and other external command execution functions should be used with extreme caution, ensuring that no special shell characters or metacharacters can be entered by users, in order to avoid command injection attacks. Whitelisting input or using functions that safely escape or quote arguments (such as `escapeshellarg()` or `escapeshellcmd()` in PHP) are essential practices to mitigate this type of vulnerability.

---

<p align="center"> <a href="../Natas08/Readme-BR.md">⬅️ Previous</a> • <a href="../Natas10/Readme-BR.md">Next ➡️</a> </p>
