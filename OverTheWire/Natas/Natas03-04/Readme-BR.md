# 🕵️ Natas CTF - Níveis 01-04 (🇧🇷 Português)
*Data:* 23/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🔹 Nível 01-02

### 🎯 OBJETIVO

Acessar `http://natas2.natas.labs.overthewire.org`, identificar o local onde a senha está armazenada e usá-la para avançar ao próximo nível.

### 🔎 ANÁLISE

- Ao acessar a URL principal, o site exibe apenas a mensagem:  
  **"Não há nada nesta página "**.
- A página não apresenta elementos interativos nem conteúdo visível.
- Com isso, partimos para a inspeção do **código-fonte HTML**.
- No HTML, identificamos alguns scripts e uma imagem referenciada via:  
  `<img src="files/pixel.png">`
- Isso sugere a existência de um diretório acessível chamado `files`.

### 🧱 ETAPAS

1. Acessamos manualmente o diretório:  
   `http://natas2.natas.labs.overthewire.org/files/`
2. Dentro dele, estavam presentes dois arquivos:  
   - `pixel.png` (a imagem já referenciada)
   - `users.txt`
3. Ao abrir o `users.txt`, encontramos uma lista de usuários e senhas.
4. Localizamos a senha para o próximo nível associada ao usuário atual (natas3).

### 🔑 SENHA ENCONTRADA

```
3gqisGdR0pjm6tpkDKdIWO2hSvchLeYH
```

### ✅ CONCLUSÃO

Esse nível ilustra a importância de testar diretórios e caminhos comuns (como `/files/`, `/admin/`, etc.) mesmo que não estejam visíveis na interface principal.  
A exposição de arquivos sensíveis em diretórios acessíveis ao público é uma falha recorrente e perigosa em sistemas web.

---

## 🔹 Nível 02-03

### 🎯 OBJETIVO

Acessar `http://natas3.natas.labs.overthewire.org`, descobrir onde está escondida a senha e usá-la para avançar ao próximo nível.

### 🔎 ANÁLISE

- Ao acessar a URL principal, o site exibe a mensagem:  
  **"Não há nada nesta página"**
- O código-fonte da página não fornece nenhuma informação útil além de alguns scripts `.js` e um comentário HTML curioso:  
  `<!-- No more information leaks!! Not even Google will find it this time... -->`
- Isso nos leva a considerar que há um diretório oculto propositalmente.
- Partimos então para uma **enumeração manual de diretórios**, começando pelos mais comuns.

### 🧱 ETAPAS

1. A partir da dica no comentário, tentamos acessar `robots.txt`:
   `http://natas3.natas.labs.overthewire.org/robots.txt`
2. O conteúdo desse arquivo era:
   ```
   User-agent: *
   Disallow: /s3cr3t/
   ```
3. Isso indica que existe um diretório chamado `/s3cr3t/` que não deve ser indexado por robôs.
4. Acessamos diretamente esse diretório:  
   `http://natas3.natas.labs.overthewire.org/s3cr3t/`
5. Lá encontramos o arquivo `users.txt`.
6. Abrindo o arquivo, encontramos as credenciais para o próximo nível:

### 🔑 SENHA ENCONTRADA

```
natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ
```

### ✅ CONCLUSÃO

Este nível reforça a importância de investigar arquivos comuns como `robots.txt`, que muitas vezes revelam diretórios ocultos ou desprotegidos.  
Em ambientes reais, esse tipo de exposição pode permitir que atacantes descubram endpoints sensíveis ou arquivos confidenciais.

---

## 🔹 Nível 03-04

### 🎯 OBJETIVO

Acessar `http://natas4.natas.labs.overthewire.org/`, identificar a restrição de acesso imposta e contorná-la para obter a senha do próximo nível.

### 🔎 ANÁLISE

- Após logar e acessar a URL principal, o site exibe a mensagem:  
  **"Acesso não permitido. Você está acessando de 'http://natas4.natas.labs.overthewire.org/index.php', enquanto usuários autorizados devem acessar apenas de 'http://natas5.natas.labs.overthewire.org/'."**
- Essa mensagem sugere que o problema está relacionado ao **Referer Header**, um cabeçalho HTTP que informa a origem da requisição.
- Verificamos o cabeçalho da requisição via DevTools (F12 > Network > index.php):

```
Host: natas4.natas.labs.overthewire.org  
Referer: http://natas4.natas.labs.overthewire.org/index.php
```

### 🧱 ETAPAS

1. O site exige que o campo `Referer` seja:  
   `http://natas5.natas.labs.overthewire.org/`
2. Usamos o comando `curl` para modificar esse cabeçalho e obter acesso.

**Comando:**
```bash
curl http://natas4.natas.labs.overthewire.org/   -u natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ   -H "Referer: http://natas5.natas.labs.overthewire.org/"
```

### 🔑 SENHA ENCONTRADA

```
0n35PkggAPm2zbEpOU802c0x0Msn1ToK
```

### ✅ CONCLUSÃO

Este nível mostra a importância dos cabeçalhos HTTP no controle de acesso e como eles podem ser manipulados por ferramentas simples como o `curl`.  
Confiar em campos como `Referer` para autorização é extremamente inseguro.

---
