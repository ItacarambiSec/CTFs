# 🕵️ Natas - Nível 09 (🇧🇷 Português)  
*Data: 27/05/2025*  
*Dificuldade: Fácil*   
*Categoria: Web* 

---

## 🎯 Objetivo

O objetivo deste desafio é identificar e explorar uma vulnerabilidade de injeção de comando em uma aplicação web, a fim de obter a senha para o próximo nível (Natas10).

---

## 🔎 Análise

- A aplicação web em `http://natas9.natas.labs.overthewire.org/` possui um campo de busca que, aparentemente, procura palavras em um arquivo de dicionário `(dictionary.txt).`   
- Ao analisar o código-fonte, um script PHP revela o uso da função `passthru()` para executar o comando grep -i $key dictionary.txt.   
```php
<?
$key = "";

if(array_key_exists("needle", $_REQUEST)) {
    $key = $_REQUEST["needle"];
}

if($key != "") {
    passthru("grep -i $key dictionary.txt");
}
?>
```

- A variável `$key` recebe diretamente o valor do parâmetro `needle` enviado via requisição ($_REQUEST["needle"]), sem nenhum tratamento de entrada.  
- A função `passthru()` executa comandos do sistema e exibe a saída bruta no navegador, tornando-a perigosa se a entrada do usuário não for sanitizada.  
- A falta de sanitização da entrada do usuário para o parâmetro `needlev torna o script vulnerável a injeção de comando, permitindo a execução de comandos arbitrários no servidor.   

---

## 🧱 Etapas

1. Acessar a Aplicação: Navegar até `http://natas9.natas.labs.overthewire.org/`.  
2. Identificar o Campo de Busca: Localizar o input "Find words containing:" e o botão de busca.   
3. Analisar o Comportamento: Testar a busca com um termo comum como "teste" e observar a saída.   
4. Inspecionar o Código-Fonte: Visualizar o código-fonte da página para encontrar o script PHP e identificar a função `passthru()` e o tratamento da entrada.   
5. Testar a Injeção de Comando: Inserir `teste; pwd` no campo de busca para verificar a execução de comandos arbitrários e confirmar a vulnerabilidade.
6. Obter a Senha: Utilizar a injeção de comando para ler o arquivo de senha do Natas10, inserindo `teste; cat /etc/natas_webpass/natas10` no campo de busca.   

---

## 🔑 Senha Encontrada

```
ZE1ck82lmdGIoErlhQgWND6j2Wzz6b6t
```

---

## ✅ Conclusão

A vulnerabilidade de injeção de comando foi explorada com sucesso, permitindo a execução de comandos do sistema operacional diretamente pelo campo de busca da aplicação. Isso possibilitou a leitura do arquivo de senha `/etc/natas_webpass/natas9`, obtendo a credencial para o próximo nível. A ausência de validação e sanitização da entrada do usuário para o parâmetro `needle` foi a principal causa dessa falha crítica de segurança.  

---

## 🧪 Comandos Utilizados

`teste; pwd`  
`teste; cat /etc/natas_webpass/natas10`

---

## 🧠 Observações

Este nível ilustra a importância crítica da validação e sanitização de todas as entradas do usuário em aplicações web. A função `passthru()` e outras funções de execução de comandos externos devem ser usadas com extrema cautela, garantindo que nenhum caractere especial ou metacaractere do shell possa ser inserido pelos usuários, a fim de evitar ataques de injeção de comando. A utilização de listas brancas (whitelisting) para entradas ou o uso de funções que escapam ou citam argumentos de forma segura (como `escapeshellarg()` ou `escapeshellcmd()` no PHP) são práticas essenciais para mitigar esse tipo de vulnerabilidade.

---

<p align="center"> <a href="../Natas08/Readme-BR.md">⬅️ Anterior</a> • <a href="../Natas10/Readme-BR.md">Proximo ➡️</a> </p>
