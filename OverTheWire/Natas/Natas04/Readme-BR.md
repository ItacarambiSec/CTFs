# 🕵️ Natas - Nível 03-04 (🇧🇷 Português)  
*Data:* 23/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🎯 OBJETIVO

Acessar `http://natas4.natas.labs.overthewire.org` e obter a senha necessária para avançar ao nível 5.

---

## 🔎 ANÁLISE

- Ao acessar a URL, somos recebidos com a seguinte mensagem:
- **Acesso não permitido. Você está acessando de `http://natas4.natas.labs.overthewire.org/index.php`, enquanto usuários autorizados devem acessar apenas de `http://natas5.natas.labs.overthewire.org/`.**
- Além da observação, temos também um botão que nos permite atualizar a página através do arquivo ìndex.php, ao executar, ele puxa automaticamente o `Referer` da requisição
- Isso sugere que o sistema utiliza o **cabeçalho HTTP `Referer`** como critério para permitir ou bloquear o acesso à página.
- Ao investigar pelo **DevTools** do navegador (F12 > Aba "Network" > selecionando a requisição de `index.php`), podemos confirmar os seguintes headers da requisição:
`Host: natas4.natas.labs.overthewire.org
Referer: http://natas4.natas.labs.overthewire.org/index.php`
- O site espera que a requisição venha de um referenciador externo (`http://natas5.natas.labs.overthewire.org/`), e não da própria URL.

---

## 🧱 ETAPAS

1. Identificamos que o problema está no cabeçalho `Referer`, que deve ser manipulado.
2. Usamos a ferramenta **`curl`** para enviar uma requisição personalizada com o `Referer` correto.
3. Executamos o seguinte comando no terminal:
```
 curl http://natas4.natas.labs.overthewire.org/ \
   -u natas4:QryZXc2e0zahULdHrtHxzyYkj59kUxLQ \
   -H "Referer: http://natas5.natas.labs.overthewire.org/"
```

4. Ao executar, temos: `Access granted. The password for natas5 is 0n35PkggAPm2zbEpOU802c0x0Msn1ToK`

---

## 🔑 SENHA ENCONTRADA

```
0n35PkggAPm2zbEpOU802c0x0Msn1ToK
```

---

## ✅ CONCLUSÃO

Este nível demonstra como o uso indevido do cabeçalho Referer pode ser contornado com facilidade, o que reforça que cabeçalhos HTTP não devem ser utilizados como mecanismo de segurança.

---

## 🧪 COMANDOS UTILIZADOS

`curl:` ferramenta de linha de comando para enviar requisições HTTP.  
`-u:` define o usuário e senha no formato usuario:senha.  
`-H:` permite adicionar um cabeçalho manual — neste caso, o Referer.  

---

## 🧠 Observações

Confiar no Referer para validar acesso é uma falha comum de segurança. Esse cabeçalho pode ser facilmente manipulado por qualquer usuário com ferramentas simples como curl, Postman ou extensões de navegador.
Em um ambiente real, o controle de acesso deve ser feito com base em autenticação robusta, tokens de sessão ou validação no lado do servidor.

---


<p align="center">
  <a href="../Natas02-03/Readme-BR.md">⬅️ Level 02–03</a> • 
  <a href="../Natas04-05/Readme-BR.md">Level 04–05 ➡️</a>
</p>



