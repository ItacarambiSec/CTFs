# 🕵️ Natas - Nível 08 (🇧🇷 Português)  
*Data:* 24/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🎯 Objetivo

Acessar `http://natas8.natas.labs.overthewire.org`, identificar e decodificar a string secreta correta, e obter a senha para avançar ao nível 9.

---

## 🔎 Análise

- Ao acessarmos o site, temos um campo de input interativo que espera um **segredo**.
- Inspecionando o código-fonte da página, encontramos um link chamativo:
```html
  <a href="index-source.html">
```
- Acessando esse arquivo, obtemos o código-fonte PHP utilizado pelo backend. Lá, encontramos uma variável codificada:   
 `$encodedSecret = "3d3d516343746d4d6d6c315669563362";`
- E uma função de codificação personalizada:
```php
function encodeSecret($secret) {
    return bin2hex(strrev(base64_encode($secret))); }
```
- Isso indica que a verificação é feita comparando a versão codificada do valor inserido com $encodedSecret. 

---

## 🧱 Etapas

1. Acessamos o link index-source.html e analisamos o código PHP.   
2. Identificamos que o valor esperado é a saída da função encodeSecret().   
3. **Com base na lógica da função (base64 → reverse → bin2hex), criamos um script auxiliar para realizar o processo reverso. **
4. O script secret_tool.php foi desenvolvido e disponibilizado neste repositório:   
`/Projects/By_CTFs/OverTheWire/Natas/secret_tool.php`
5. Executamos o comando:
```bash
php secret_tool.php decode 3d3d516343746d4d6d6c315669563362
```
6. O resultado foi:
```bash
oubWYf2kBq
```
7. Ao inserimos esse valor no campo de input da página e clicarmos em "Submit", a resposta foi:   
`Access granted. The password for natas9 is ZE1ck82lmdGIoErlhQgWND6j2Wzz6b6t`

---

## 🔑 Senha Encontrada

```
ZE1ck82lmdGIoErlhQgWND6j2Wzz6b6t
```

---

## ✅ Conclusão

Este nível exige que compreendamos e revertamos uma função de codificação personalizada.
Em testes de segurança reais, esse tipo de desafio é comum ao se deparar com rotinas proprietárias de ofuscação ou transformação de dados.
Reverter esse processo com um script auxiliar demonstrou ser a abordagem mais eficiente.

---

## 🧪 Comandos Utilizados

php secret_tool.php decode 3d3d516343746d4d6d6c315669563362

---

## 🧠 Observações

Mesmo quando senhas não estão explícitas, é possível encontrá-las através da engenharia reversa de lógica de validação.
Este nível destaca a importância de entender transformações como Base64, reversão de strings e codificações hexadecimais, além de reforçar o valor de scripts reutilizáveis durante desafios de exploração.

---

## 📎 Scripts desenvolvidos

Para resolver esse nível, foi criado um script auxiliar:

📄 /Projects/By_CTFs/OverTheWire/Natas/secret_tool.php

Esse utilitário pode ser reaproveitado em outros níveis que utilizem codificações semelhantes.

---

<p align="center"> <a href="../Natas07/Readme-BR.md">⬅️ Nível Anterior</a> • <a href="../Natas09/Readme-BR.md">Próximo Nível ➡️</a> </p>
