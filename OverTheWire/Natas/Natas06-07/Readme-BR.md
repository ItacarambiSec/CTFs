# 🕵️ Natas - Nível 06–07 (🇧🇷 Português)  
*Data:* 24/05/2025  
*Dificuldade:* Fácil  
*Categoria:* Web

---

## 🎯 OBJETIVO

Acessar `http://natas7.natas.labs.overthewire.org` e obter a senha para avançar ao nível 8.

---

## 🔎 ANÁLISE

- Ao acessarmos a URL com as credenciais obtidas no nível anterior, nos deparamos com uma interface que apresenta **dois links**:

```html
  <a href="index.php?page=home">Home</a>
  <a href="index.php?page=about">About</a>
```
- Além disso, encontramos um comentário HTML interessante no código-fonte:
`<!-- hint: password for webuser natas8 is in /etc/natas_webpass/natas8 -->`
- Isso nos dá uma pista valiosa: o conteúdo da página está sendo incluído dinamicamente com base no parâmetro page passado na URL.
- Isso também indica que o index.php está utilizando esse parâmetro para incluir ou carregar arquivos diretamente no servidor.
Se não houver validação adequada, isso pode permitir a leitura de arquivos arbitrários do sistema — uma falha de inclusão local (LFI).
- Com base nisso, tentamos forçar a leitura direta do arquivo mencionado na dica:
`http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8`
- E bingo! O conteúdo do arquivo é exibido diretamente no navegador, revelando a senha do próximo nível.



---

## 🧱 ETAPAS

1. Acessamos `http://natas7.natas.labs.overthewire.org` com as credenciais corretas.  
2. Inspecionamos o código-fonte da página e observamos dois links baseados no parâmetro page.  
3. Também encontramos um comentário com a localização do arquivo que contém a senha de natas8.  
4. Suspeitamos de vulnerabilidade de inclusão local (LFI) no parâmetro page. 
5. Modificamos a URL para incluir diretamente o caminho do arquivo de senha:
   `http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8`
6. O conteúdo do arquivo foi carregado com sucesso no navegador, revelando a senha do próximo nível.  

---

## 🔑 SENHA ENCONTRADA

```
lW0CNOOkm0oQ4JVBkJ9yuGe1n9rMil45

```

---

## ✅ CONCLUSÃO

Este nível demonstra uma vulnerabilidade crítica: inclusão arbitrária de arquivos via parâmetro GET.
Falhas como essa permitem que usuários leiam arquivos sensíveis do sistema, comprometendo totalmente a aplicação.
É essencial validar e sanitizar qualquer entrada de usuário que seja usada para incluir ou carregar conteúdo.
---

## 🧪 COMANDOS UTILIZADOS


Nenhum comando via terminal foi necessário neste nível.  
Todos os passos foram realizados diretamente no navegador  

---

## 🧠 OBSERVAÇÕES

Em aplicações reais, vulnerabilidades de inclusão de arquivos (LFI/RFI) podem permitir desde leitura de arquivos confidenciais até execução remota de código, dependendo da configuração.
Boas práticas incluem:

- Nunca usar diretamente parâmetros do usuário em funções como include() ou require().  
- Usar whitelists para limitar os arquivos carregáveis.  
- Desativar diretivas perigosas no PHP (allow_url_include, etc.).  

---


<p align="center"> <a href="../Natas05-06/Readme-BR.md">⬅️ Nível Anterior</a> • <a href="../Natas07-08/Readme-BR.md">Próximo Nível ➡️</a> </p> ```
