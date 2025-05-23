# 🕵️ Natas - Nível 04-05 (🇧🇷 Português)  
*Data:* 23/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🎯 OBJETIVO

Acessar `http://natas4.natas.labs.overthewire.org/`, entender a restrição de acesso imposta pelo servidor e encontrar a senha para o próximo nível.

---

## 🔎 ANÁLISE

- Ao acessarmos diretamente a URL, mesmo após o login, recebemos a seguinte mensagem:

  ```
  Acesso não permitido. Você está acessando de "http://natas4.natas.labs.overthewire.org/index.php", enquanto usuários autorizados devem acessar apenas de "http://natas5.natas.labs.overthewire.org/".
  ```

- Essa mensagem indica que o acesso à página está sendo **filtrado com base no cabeçalho HTTP `Referer`** — um campo que informa de onde a requisição foi originada.
- Ou seja, a aplicação só libera o conteúdo caso a requisição tenha vindo de `http://natas5.natas.labs.overthewire.org/`.

---

## 🧱 ETAPAS

1. Após observar o comportamento no navegador, acessamos o **DevTools (F12)** e navegamos até a aba **Network**.
2. Lá, identificamos que o campo `Referer` na requisição estava apontando para:
   ```
   Referer: http://natas4.natas.labs.overthewire.org/index.php
   ```
3. Sabendo que podemos modificar cabeçalhos HTTP manualmente com a ferramenta `curl`, executamos o seguinte comando:

   ```bash
   curl http://natas4.natas.labs.overthewire.org/ \
     -u natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ \
     -H "Referer: http://natas5.natas.labs.overthewire.org/"
   ```

4. Explicação dos argumentos:
   - `curl` → ferramenta de requisição HTTP
   - `-u user:senha` → autenticação básica
   - `-H` → define um cabeçalho HTTP customizado (no caso, o `Referer`)

5. Com isso, burlamos a verificação do servidor, que validava se o acesso "veio" da URL esperada.

---

## 🔑 SENHA ENCONTRADA

```
0n35PkggAPm2zbEpOU802c0x0Msn1ToK
```

---

## ✅ CONCLUSÃO

Este nível introduz a manipulação de cabeçalhos HTTP — uma técnica simples, porém poderosa.  
O cabeçalho `Referer` é facilmente falsificável e, portanto, **não deve ser usado como método de autenticação ou controle de acesso em aplicações reais**.

---

## 🧪 COMANDOS UTILIZADOS

```bash
curl http://natas4.natas.labs.overthewire.org/ \
  -u natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ \
  -H "Referer: http://natas5.natas.labs.overthewire.org/"
```

---

## 🧠 Observações

Usar cabeçalhos HTTP como critério para liberar funcionalidades é uma prática insegura.  
Em contextos reais, isso pode ser explorado por qualquer atacante com conhecimento básico de requisições HTTP.  
A segurança de endpoints deve sempre envolver **validações no servidor**, como autenticação forte, tokens, ou permissões baseadas em sessão.
