# 🕵️ Natas - Level 05–06 (🇺🇸 English)  
*Date:* 2025-05-24  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJECTIVE

Access `http://natas6.natas.labs.overthewire.org` and retrieve the password to advance to level 7.

---

## 🔎 ANALYSIS

- Upon logging in, for the first time we are presented with an interactive element:  
  A form with an input field that asks for a **secret value**.
- The page doesn’t provide any hints directly, so we inspect the page source.
- In the HTML source, we find a PHP snippet:
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
- This code shows that the input is compared against the $secret variable, which is defined in the included file: includes/secret.inc.
- Since that file is publicly accessible, we try to visit:
`http://natas6.natas.labs.overthewire.org/includes/secret.inc`
- The result is:
```
<?
$secret = "FOEIUWGHFEEUHOFUOIU";
?>
```
- **Access granted. The password for natas7 is bmg8SvU1LizuWjx3y7xkNERkHxGre0GS**

🧱 STEPS

1. Accessed http://natas6.natas.labs.overthewire.org and noticed a form requesting a "secret".  
2. Viewed the page source and found a PHP script including includes/secret.inc.  
3. Realized that the variable $secret was defined in that file.  
4. Accessed the file directly via the browser at /includes/secret.inc and found the secret value: FOEIUWGHFEEUHOFUOIU.  
5. Submitted the form with this value.  
6. Received the message: Access granted, along with the password for the next level.  

---

## 🔑 PASSWORD FOUND

```
bmg8SvU1LizuWjx3y7xkNERkHxGre0GS
```

---

## ✅ CONCLUSION

This level highlights how exposing server-side include files can completely compromise application logic.
It reinforces the need for directory-level access control and secure file handling practices in web servers.


---

## 🧪 COMMANDS USED

No terminal commands were needed in this level.  
All steps were executed via the browser  

---

## 🧠 NOTES

In real-world environments, exposing include files like .inc or .php is a severe security risk.
Such files should be protected via server configuration (e.g., .htaccess, NGINX rules) and security should never rely on obscurity.

---


<p align="center"> <a href="../Natas04-05/Readme-US.md">⬅️ Previous</a> • <a href="../Natas06-07/Readme-US.md">Next ➡️</a> </p> 
