# 🕵️ Natas - Nível 14 (🇧🇷 Português)
*Data:* 09/06/2025  
*Dificuldade:* Fácil  
*Categoria:* Web / SQL Injection 

---

## 🎯 Objetivo

O objetivo deste desafio é explorar uma vulnerabilidade de **SQL Injection** em uma página de login, permitindo o bypass da autenticação para obter a senha do próximo nível (Natas15).  

---

## 🔎 Análise

-   A aplicação web em `http://natas14.natas.labs.overthewire.org/` apresenta uma página de login com campos para `username` e `password`.  
-   Ao analisar o código fonte (`index.php`), identificamos o seguinte trecho crucial:  

    ```php
    <?php
    if(array_key_exists("username", $_REQUEST)) {
        $link = mysqli_connect('localhost', 'natas14', '<censored>');
        mysqli_select_db($link, 'natas14');

        $query = "SELECT * from users where username=\"".$_REQUEST["username"]."\" and password=\"".$_REQUEST["password"]."\"";

        if(array_key_exists("debug", $_GET)) {
            echo "Executing query: $query<br>";
        }

        if(mysqli_num_rows(mysqli_query($link, $query)) > 0) {
            echo "Successful login! The password for natas15 is <censored><br>";
        } else {
            echo "Access denied!<br>";
        }
        mysqli_close($link);
    } else {
    ?>
    ```

-   **Vulnerabilidade de SQL Injection:** Os valores dos parâmetros `username` e `password` (recebidos via `$_REQUEST`, que pode ser GET, POST ou COOKIE) são concatenados diretamente na string da query SQL. Isso representa uma falha grave de segurança, pois não há nenhuma sanitização ou escape de caracteres especiais.  
-   **Funcionalidade de Debug:** A linha `if(array_key_exists("debug", $_GET)) { echo "Executing query: $query<br>"; }` é um recurso de depuração extremamente útil. Se o parâmetro `debug` estiver presente na URL (ex: `?debug=1`), a query SQL completa que será executada é exibida na tela. Isso facilita muito a compreensão e a criação de payloads de injeção.  

---

## 🧱 Etapas

1.  **Acessar a Aplicação:** Navegar até `http://natas14.natas.labs.overthewire.org/`.  
2.  **Analisar o Código Fonte:** Acessar `index-source.php` para entender a lógica do login e identificar a vulnerabilidade.  
3.  **Testar a Funcionalidade de Debug:**  
    -   Inserir `admin` como `username` e `admin` como `password`.  
    -   Acessar a URL com o parâmetro `debug` (ex: `http://natas14.natas.labs.overthewire.org/?debug=1`).  
    -   Observar a query exibida: `Executing query: SELECT * from users where username="admin" and password="admin"`. Isso confirma a estrutura da query e a vulnerabilidade de concatenação.   
4.  **Construir o Payload de SQL Injection:**  
    -   Nosso objetivo é fazer com que a condição `username="..." and password="..."` seja sempre verdadeira, independentemente das credenciais reais.  
    -   Utilizamos o operador lógico `OR` para injetar uma condição que sempre seja `TRUE`.  
    -   Payload para `username`: `" OR "TRUE"` (o primeiro `"` fecha o `username`, o `OR "TRUE"` força a condição verdadeira).
    -   Payload para `password`: Vazio (`""`) ou qualquer valor que não interfere.  
    -   A query resultante será: `SELECT * from users where username="" OR "TRUE" and password=""`. Como `"TRUE"` (ou `1=1`) sempre é verdadeiro, a condição será satisfeita.  
5.  **Executar o Ataque:**  
    -   No campo `username`, inserir: `natas15" OR "TRUE" #` (O `#` é um comentário em SQL, ignorando o resto da query original, incluindo a parte da senha).  
    -   No campo `password`, deixar vazio.  
    -   Submeter o formulário (pode incluir `?debug=1` na URL para ver a query em ação).  
6.  **Obter a Senha:** A aplicação exibirá "Successful login! The password for natas15 is <censored>".  

---

## 🔑 Senha Encontrada  

```
SdqIqBsFcz3yotlNYErZSZwblkm0lrvx
```

---

## ✅ Conclusão  

A vulnerabilidade de SQL Injection foi explorada com sucesso devido à concatenação direta de entrada do usuário em uma query SQL. A presença de um recurso de debug que exibia a query completa foi fundamental para a formulação rápida e precisa do payload de injeção. O ataque permitiu o bypass da autenticação, revelando a senha para o próximo nível. Este caso reforça a importância crítica de nunca confiar em dados de entrada do usuário e sempre usar prepared statements ou parameterized queries para interagir com bancos de dados.  

---

## 🧪 Comandos Utilizados

-   **URL para testar debug com credenciais genéricas:**  
    `http://natas14.natas.labs.overthewire.org/?username=admin&password=admin&debug=1`  
-   **Payload de SQL Injection no campo `username`:**  
    `natas15" OR "TRUE" #`  
-   **Payload no campo `password`:**  
    (Deixar vazio)
-   **Query SQL resultante (exemplo com debug):**  
    `SELECT * from users where username="natas15" OR "TRUE" #" and password=""`  

---

## 🧠 Observações

-   **Prevenção de SQL Injection:** A principal medida de prevenção é o uso de **Prepared Statements** (também conhecidos como queries parametrizadas). Em PHP, isso pode ser feito com `mysqli_prepare()` ou PDO. Eles separam o código SQL dos dados, impedindo que a entrada do usuário altere a estrutura da query.  
-   **Não Confie na Entrada do Usuário:** Toda e qualquer entrada de usuário deve ser tratada como não confiável e validada/sanitizada antes de ser usada em queries de banco de dados, ou qualquer outro contexto sensível.  
-   **Debug em Produção:** Nunca mantenha recursos de depuração que expõem informações sensíveis (como queries SQL ou erros internos) em ambientes de produção. Isso facilita enormemente o trabalho de um atacante.  

---


<p align="center"> <a href="../Natas13/Readme-BR.md">⬅️ Anterior</a> • <a href="../Natas15/Readme-BR.md">Proximo ➡️</a> </p>
