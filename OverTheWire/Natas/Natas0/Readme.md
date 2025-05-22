# 🕵️ Natas - Level 0  
*Date:* 2024-05-22  
*Difficulty:* Easy  
*Category:* Web

---

## 🎯 OBJETIVO

Acessar a página `http://natas0.natas.labs.overthewire.org`, identificar onde está escondida a senha para o próximo nível e usá-la para avançar.

---

## 🔎 ANÁLISE

- A página inicial exibe a mensagem “This page contains nothing.”
- Não há elementos interativos nem campos de login.
- A dica diz que a senha está na própria página.

---

## 🧱 ETAPAS

### 🔍 Inspeção inicial

- Acessada a URL via navegador.
- Código-fonte da página foi inspecionado com `Ctrl + U`.

### 🟢 Resultado

- A senha estava presente **em um comentário HTML** no código-fonte da página.

---

## ✅ CONCLUSÃO

- Não foi necessário usar ferramentas externas.
- Esse nível demonstra a importância de **inspecionar o código HTML de páginas web**, especialmente comentários e trechos ocultos.

---

## 🧪 COMANDOS UTILIZADOS

Nenhum comando necessário — apenas navegação e inspeção via navegador.

---

## 🧠 Observações

- Todos os níveis do Natas partem do princípio de que **a senha para o próximo nível está acessível de alguma forma** — seja visível, escondida, ou acessível via falhas.

