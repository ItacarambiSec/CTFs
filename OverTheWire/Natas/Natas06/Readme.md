# 🕵️ Natas - Level 06 (🇺🇸 English)  
*Date:* 2025-05-24  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas6.natas.labs.overthewire.org` and retrieve the password to advance to level 7.

---

## 🔎 ANALYSIS

- After logging in, we are presented for the first time with an interactive element:  
  A form containing an input field that requests a **secret value**.
- The page provides no direct hints, so we inspect the page source.
- In the HTML, we find a PHP snippet:

```php
<?
include "includes/secret.inc";

if(array_key_exists("submit", $_POST)) {
    if($secret == $_POST['secret']) {
        print "Access granted. The password for natas7 is <censored>";
    } else {
        print "Wrong secret";
    }
}
?>
```
- This code shows that the submitted value is compared to the variable $secret, which is defined in the included file  
  `includes/secret.inc.`   
- Since the file appears publicly accessible, we visit:   
`http://natas6.natas.labs.overthewire.org/includes/secret.inc`
- The returned content is:   
```
<?
$secret = "FOEIUWGHFEEUHOFUOIU";
?>
```
- That’s clearly the expected input. After submitting it, we receive the response:   
`Access granted. The password for natas7 is bmg8SvU1LizuWjx3y7xkNERkHxGre0GS`
---

## 🧱 Steps

1. Accessed `http://natas6.natas.labs.overthewire.org` and identified a form requesting a "secret".  
2. Inspected the page source and found a PHP script that included the `includes/secret.inc` file.  
3. Realized that the `$secret` variable was defined inside that file.  
4. Accessed `includes/secret.inc` directly via browser and obtained the actual value: FOEIUWGHFEEUHOFUOIU. 
5. Submitted this value through the input field and sent the form.  
6. The response confirmed access and revealed the password for the next level. 

---

## 🔑 Password Found

```
bmg8SvU1LizuWjx3y7xkNERkHxGre0GS
```

---

## ✅ Conclusion

This level shows how exposed include files can compromise the security of a web application.
It also reinforces the importance of properly securing directories and sensitive files on the server.

---

## 🧪 Commands Used

No terminal commands were required for this level.
All steps were completed directly through the browser.

---

## 🧠 Observations

In real-world environments, publicly accessible `.inc` or `.php` files pose a serious risk.
It is essential to protect such resources through server configurations (like `.htaccess` or NGINX rules) and never rely on obscurity to hide sensitive data.

---

<p align="center"> <a href="../Natas05/Readme.md">⬅️ Previous</a> • <a href="../Natas07/Readme.md">Next ➡️</a> </p>
