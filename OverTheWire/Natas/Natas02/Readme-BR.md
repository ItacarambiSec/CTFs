# 🕵️ Natas - Nível 02 (🇧🇷 Português)  
*Data:* 22/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🎯 OBJETIVO

Acessar `http://natas2.natas.labs.overthewire.org`, identificar o local onde a senha está armazenada e usá-la para avançar ao próximo nível.

---

## 🔎 ANÁLISE

- Ao acessar a URL principal, o site exibe apenas a mensagem:  
  **"Não há nada nesta página "**.
- A página não apresenta elementos interativos nem conteúdo visível.
- Com isso, partimos para a inspeção do **código-fonte HTML**.
- No HTML, identificamos alguns scripts e uma imagem referenciada via:  
  `<img src="files/pixel.png">`
- Isso sugere a existência de um diretório acessível chamado `files`.

---

## 🧱 ETAPAS

1. Acessamos manualmente o diretório:  
   `http://natas2.natas.labs.overthewire.org/files/`
2. Dentro dele, estavam presentes dois arquivos:  
   - `pixel.png` (a imagem já referenciada)
   - `users.txt`
3. Ao abrir o `users.txt`, encontramos uma lista de usuários e senhas.
4. Localizamos a senha para o próximo nível associada ao usuário atual (natas3).

---

## 🔑 SENHA ENCONTRADA

```
3gqisGdR0pjm6tpkDKdIWO2hSvchLeYH
```

---

## ✅ CONCLUSÃO

Esse nível ilustra a importância de testar diretórios e caminhos comuns (como `/files/`, `/admin/`, etc.) mesmo que não estejam visíveis na interface principal.  
A exposição de arquivos sensíveis em diretórios acessíveis ao público é uma falha recorrente e perigosa em sistemas web.

---

## 🧪 COMANDOS UTILIZADOS

Nenhum comando via terminal foi necessário. A exploração foi feita diretamente pelo navegador:

- Visualização de código-fonte (Ctrl+U)
- Navegação direta por URL

---

## 🧠 Observações

A exposição de diretórios e arquivos sensíveis (como `users.txt`) é um risco sério.  
Em ambientes reais, isso pode dar acesso a credenciais válidas, rotas de APIs, arquivos de configuração e até backups.  
É crucial configurar corretamente as permissões de acesso e evitar a publicação de arquivos internos no ambiente de produção.

---

<p align="center">
  <a href="../Natas01/Readme-BR.md">⬅️ Anterior</a> • 
  <a href="../Natas03/Readme-BR.md">Proximo ➡️</a>
</p>

