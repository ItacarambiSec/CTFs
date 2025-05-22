# 🕵️ Natas - Nível 0-1 (🇧🇷 Português)  
*Data:* 22/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🎯 OBJETIVO

Acessar `http://natas0.natas.labs.overthewire.org`, contornar a limitação imposta pelo site e encontrar a senha para avançar ao próximo nível.

---

## 🔎 ANÁLISE

- Ao acessar a página, é exibida a mensagem:  
  **"Você pode encontrar a senha para o próximo nível nesta página, mas o clique com o botão direito foi bloqueado!"**
- O site tenta impedir a inspeção do código-fonte desabilitando o botão direito via JavaScript.

---

## 🧱 ETAPAS

Para contornar isso, foi utilizado o atalho `Ctrl + U`, que permite visualizar diretamente o código HTML.  
- Dentro do código-fonte, a senha foi localizada em um **comentário HTML**.

---

## 🔑 SENHA ENCONTRADA

```
TguMNxKo1DSa1tujBLuZJnDUlCcUAPlI
```

---

## ✅ CONCLUSÃO

Restrições aplicadas via JavaScript no lado do cliente são facilmente burladas com atalhos nativos do navegador.  
Esse nível mostra a importância de inspecionar o HTML bruto em desafios web.

---

## 🧪 COMANDOS UTILIZADOS

Nenhum — tudo foi feito diretamente pelo navegador.

---

## 🧠 Observações

Confiar no lado cliente para ocultar informações sensíveis é uma falha crítica.  
Qualquer usuário pode inspecionar o código-fonte e recuperar dados expostos, como senhas, tokens ou rotinas internas — tornando esse tipo de vulnerabilidade uma ameaça real e comum em aplicações mal protegidas.
