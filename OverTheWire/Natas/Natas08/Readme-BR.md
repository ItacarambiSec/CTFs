# 🕵️ Natas - Nível 08 (🇧🇷 Português)  
*Data:* 24/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🎯 Objetivo

Acessar `http://natas8.natas.labs.overthewire.org`, identificar e decodificar a string secreta correta, e obter a senha para avançar ao nível 9.

---

## 🔎 Análise

- Ao acessarmos o site, temos novamente um campo de input interativo que espera um **segredo**.
- Inspecionando o código-fonte da página, encontramos um link chamativo:  
 `<a href="index-source.html">`
- Acessando esse arquivo, obtemos o código-fonte PHP utilizado pelo backend. Lá, encontramos uma variável codificada:   
 `$encodedSecret = "3d3d516343746d4d6d6c315669563362";`
- E uma função de codificação personalizada:
```
function encodeSecret($secret) {
    return bin2hex(strrev(base64_encode($secret)));
}
```
  
-
-

---

## 🧱 Etapas

1.
2.
3.
4.
5.

---

## 🔑 Senha Encontrada

```


```

---

## ✅ Conclusão



---

## 🧪 Comandos Utilizados



---

## 🧠 Observações



---

## 📎 Scripts desenvolvidos



---

<p align="center"> <a href="../Natas07/Readme-BR.md">⬅️ Anterior</a> • <a href="../Natas09/Readme-BR.md">Proximo ➡️</a> </p>
