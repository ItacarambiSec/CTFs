# 🕵️ Natas - Nível 02-03 (🇧🇷 Português)  
*Data:* 23/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🎯 OBJETIVO

Acessar `http://natas3.natas.labs.overthewire.org`, descobrir onde está escondida a senha e usá-la para avançar ao próximo nível.

---

## 🔎 ANÁLISE

- Ao acessar a URL principal, o site exibe a mensagem:  
  **"Não há nada nesta página"**
- O código-fonte da página não fornece nenhuma informação útil além de alguns scripts `.js` e um comentário HTML curioso:  
  `<!-- No more information leaks!! Not even Google will find it this time... -->`
- Isso nos leva a considerar que há um diretório oculto propositalmente.
- Partimos então para uma **enumeração manual de diretórios**, começando pelos mais comuns.

---

## 🧱 ETAPAS

1. A partir da dica no comentário, tentamos acessar `robots.txt`, que geralmente contém regras para impedir que motores de busca indexem determinados caminhos:
   `http://natas3.natas.labs.overthewire.org/robots.txt`
2. O conteúdo desse arquivo era:
  - `User-agent: *Disallow: /s3cr3t/`
3. Isso indica que existe um diretório chamado `/s3cr3t/` que não deve ser indexado por robôs.
4. Acessamos diretamente esse diretório:  
`http://natas3.natas.labs.overthewire.org/s3cr3t/`
5. Lá encontramos o arquivo `users.txt`.
6. Abrindo o arquivo, encontramos as credenciais para o próximo nível.

---

## 🔑 SENHA ENCONTRADA

```
QryZXc2e0zahULdHrtHxzyYkj59kUxLQ
```

---

## ✅ CONCLUSÃO

Este nível reforça a importância de investigar arquivos comuns como `robots.txt`, que muitas vezes revelam diretórios ocultos ou desprotegidos.  
Em ambientes reais, esse tipo de exposição pode permitir que atacantes descubram endpoints sensíveis ou arquivos confidenciais.

---

## 🧪 COMANDOS UTILIZADOS

Nenhum comando via terminal foi necessário. A exploração foi feita diretamente pelo navegador:

- Visualização de código-fonte (Ctrl+U)  
- Acesso direto a: `/robots.txt` e `/s3cr3t/users.txt`

---

## 🧠 Observações

A tentativa de esconder diretórios apenas via `robots.txt` **não é uma medida de segurança** — é apenas uma sugestão para motores de busca.  
Em um ambiente real, isso pode ser facilmente explorado por qualquer usuário com conhecimento básico.  
É fundamental proteger esse tipo de recurso com autenticação ou controle de acesso adequado.

