# 🕵️ Natas - Nível 05–06 (🇧🇷 Português)  
*Data:* 24/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🎯 OBJETIVO

Acessar `http://natas6.natas.labs.overthewire.org` e obter a senha para avançar ao nível 7.

---

## 🔎 ANÁLISE

- Ao fazer login, pela primeira vez nos deparamos com um elemento interativo:  
  Um formulário com um campo de entrada que solicita um **valor secreto**.
- A página não oferece pistas diretas, então inspecionamos o código-fonte.
- No HTML, encontramos um trecho em PHP:
```php
  <?
  include "includes/secret.inc";

  if(array_key_exists("submit", $_POST)) {
      if($secret == $_POST['secret']) {
          print "Access granted. The password for natas7 is <censored>";
      } else {
          print "Wrong secret";
      }
  }
  ?>
```
- Esse código indica que o valor enviado será comparado com a variável $secret, definida no arquivo incluído: `includes/secret.inc`
- Como o arquivo está exposto publicamente, tentamos acessá-lo:
`http://natas6.natas.labs.overthewire.org/includes/secret.inc`
- O conteúdo retornado foi:
```
<?
$secret = "FOEIUWGHFEEUHOFUOIU";
?>
```
- Esse claramente é o valor que o formulário espera. Ao enviá-lo, recebemos:
`Access granted. The password for natas7 is bmg8SvU1LizuWjx3y7xkNERkHxGre0GS`

---

## 🧱 ETAPAS

1. Acessamos a URL `http://natas6.natas.labs.overthewire.org` e identificamos um formulário solicitando um “segredo”.  
2. Ao inspecionar o código-fonte da página, encontramos um script PHP que incluía o arquivo includes/secret.inc.  
3. Percebemos que a variável $secret estava definida dentro desse arquivo.  
4. Acessamos diretamente o caminho includes/secret.inc via navegador e obtivemos o valor real da variável: FOEIUWGHFEEUHOFUOIU. 
5. Preenchemos o campo de input com esse valor e enviamos o formulário.  
6. A resposta confirmou: Access granted, junto da senha do próximo nível.  
---

## 🔑 SENHA ENCONTRADA

```
bmg8SvU1LizuWjx3y7xkNERkHxGre0GS
```

---

## ✅ CONCLUSÃO

Este nível mostra como arquivos de inclusão expostos podem comprometer totalmente a segurança da aplicação.
Reforça também a importância de controlar o acesso a diretórios e arquivos sensíveis no servidor.

---

## 🧪 COMANDOS UTILIZADOS


Nenhum comando via terminal foi necessário neste nível.  
Todos os passos foram realizados diretamente no navegador  

---

## 🧠 OBSERVAÇÕES

Em ambientes reais, deixar arquivos como .inc ou .php acessíveis publicamente é um risco grave.
É essencial proteger esses recursos com configurações no servidor (como .htaccess ou regras do NGINX) e nunca depender da obscuridade para ocultar dados sensíveis.

---


<p align="center"> <a href="../Natas04-05/Readme-BR.md">⬅️ Nível Anterior</a> • <a href="../Natas06-07/Readme-BR.md">Próximo Nível ➡️</a> </p> 
