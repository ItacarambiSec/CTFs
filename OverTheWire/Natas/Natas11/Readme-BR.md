# 🕵️ Natas - Nível 11 (🇧🇷 Português)
*Data:* 30/05/2025  
*Dificuldade:* Médio  
*Categoria:* Web  

---

## 🎯 Objetivo

O objetivo deste desafio é explorar a vulnerabilidade de criptografia XOR utilizada na proteção de cookies para obter a senha do próximo nível (Natas12).

---

## 🔎 Análise

- A aplicação web em `http://natas11.natas.labs.overthewire.org/` utiliza cookies para armazenar preferências do usuário, como a opção de mostrar a senha e a cor de fundo.
- O código fonte revela que esses cookies são protegidos através de uma criptografia XOR com uma chave secreta.
- As preferências são armazenadas em formato JSON, depois criptografadas com XOR e, finalmente, codificadas em Base64 antes de serem definidas como valor do cookie "data".
- O script PHP possui uma lógica que verifica se a preferência `showpassword` está definida como "yes". Se estiver, a senha para o próximo nível é exibida na página.
- Através da análise do código fonte e do conhecimento do formato padrão dos dados do cookie, podemos realizar um ataque de texto plano conhecido para descobrir a chave XOR utilizada.

---

## 🧱 Etapas

1.  **Acessar a Aplicação:** Navegar até `http://natas11.natas.labs.overthewire.org/`.
2.  **Analisar o Cookie:** Inspecionar os cookies do navegador e identificar o cookie chamado "data". Copiar o valor deste cookie.
3.  **Decodificar Base64:** Utilizar um decodificador Base64 (como o comando `base64 -d` no Linux ou um decodificador online) para decodificar o valor do cookie "data".
4.  **Ataque de Texto Plano Conhecido:**
    - Identificar o texto plano conhecido (os valores padrão): `{"showpassword":"no","bgcolor":"#ffffff"}`.
    - Realizar a operação XOR byte a byte entre o texto plano conhecido e o texto cifrado (resultado da decodificação Base64) para descobrir a chave XOR. Utilizamos um script Python para automatizar essa etapa.
5.  **Identificar a Chave XOR:** O script revelou que a chave XOR utilizada é `eDWo`.
6.  **Criar Payload Malicioso:** Construir um dicionário Python representando os dados desejados, com a chave `showpassword` definida como `"yes"` e `bgcolor` mantendo um valor hexadecimal válido (por exemplo, `#ffffff`).
7.  **Codificar para JSON:** Converter o dicionário Python para uma string JSON utilizando `json.dumps()`.
8.  **Criptografar com XOR:** Aplicar a operação XOR byte a byte entre a string JSON e a chave XOR (`eDWo`). Implementamos essa lógica em um script Python.
9.  **Codificar para Base64:** Codificar o resultado da etapa anterior em Base64 utilizando `base64.b64encode()`.
10. **Substituir o Cookie:** Utilizar as ferramentas de desenvolvedor do navegador (ou um proxy como Burp Suite) para substituir o valor do cookie "data" pelo valor gerado no passo anterior.
11. **Recarregar a Página:** Recarregar a página para que o servidor leia o cookie modificado.

---

## 🔑 Senha Encontrada

```
yZdkjAYZRd3R7tq7T5kXMjMJlOIkzDeB
```

---

## ✅ Conclusão

A vulnerabilidade de criptografia XOR com uma chave fixa permitiu a realização de um ataque de texto plano conhecido para descobrir a chave utilizada. Com a chave em mãos, foi possível manipular o cookie "data" para alterar a preferência `showpassword` para "yes", resultando na exibição da senha para o próximo nível (Natas12).

---

## 🧪 Comandos Utilizados

```bash

python [natas11_discover_key.py] ()
python [natas11_manipulate_cookie.py] ()
```

---

## 🧠 Observações

- A segurança baseada em criptografia XOR com uma chave estática e facilmente descoberta é frágil e não deve ser utilizada para proteger informações sensíveis.
- A falta de aleatoriedade (como um salt) na criptografia torna o sistema vulnerável a ataques de texto plano conhecido.
- É crucial utilizar algoritmos de criptografia robustos e práticas seguras de gerenciamento de chaves para proteger dados em cookies ou qualquer outra forma de armazenamento.  


---

## 📎 Scripts desenvolvidos

`natas11_discover_key.py`: Script Python utilizado para descobrir a chave XOR através do ataque de texto plano conhecido. 
`natas11_manipulate_cookie.py`: Script Python utilizado para gerar o valor do cookie "data" manipulado com `showpassword` definido como "yes".

---

<p align="center"> <a href="../Natas10/Readme-BR.md">⬅️ Anterior</a> • <a href="../Natas12/Readme-BR.md">Proximo ➡️</a> </p>
