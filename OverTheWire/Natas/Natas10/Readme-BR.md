# 🕵️ Natas - Nível 10 (🇧🇷 Português)  
*Data: 27/05/2025*  
*Dificuldade: Fácil*   
*Categoria: Web* 

---

## 🎯 Objetivo

O objetivo neste nível é explorar uma vulnerabilidade de injeção de comando no script PHP para obter a senha do próximo nível (`natas11`). O desafio é contornar um filtro de segurança que bloqueia caracteres comuns de concatenação de comandos.

---

## 🔎 Análise

- O aplicativo web do Natas10 possui um campo de entrada "Find words containing:", que utiliza a função `grep` para buscar palavras em um arquivo `dictionary.txt.`  
- Ao analisar o código-fonte PHP, identificamos o seguinte trecho:
```php
if($key != "") {
    if(preg_match('/[;|&]/',$key)) {
        print "Input contains an illegal character!";
    } else {
        passthru("grep -i $key dictionary.txt");
    }
}
```
- Este código aplica um filtro de segurança básico usando `preg_match`. Ele verifica se a entrada ($key) contém os caracteres ponto e vírgula (;) ou pipe (|). Se um desses caracteres for encontrado, o script imprime uma mensagem de erro "Input contains an illegal character!".  
- A função `passthru()` é usada para executar o comando `grep` diretamente no shell do sistema operacional, tornando-o vulnerável a injeção de comando se a entrada não for devidamente sanitizada.  
- Tentativas iniciais de injeção usando `;` (ex: `test; cat /etc/natas_webpass/natas11`) foram bloqueadas pelo filtro, conforme esperado.
- Observamos que as requisições HTTP utilizam URL-Encoding para caracteres especiais (ex: `%3B` para ;, `%2F` para /, `+` ou `%20` para espaço).

---

## 🧱 Etapas

1. Análise do Filtro: Confirmamos que o filtro bloqueia ; e |, impedindo as técnicas de injeção de comando mais diretas.  
2. Identificação de Outros Separadores: Refletimos sobre outros caracteres que o shell do sistema operacional interpreta como separadores de comando, notavelmente o caractere de nova linha `\n`.  
3. Codificação da Nova Linha: Como `\n` não pode ser inserido diretamente na URL, decidimos usar sua representação em URL-Encoding, que é `%0A`.  
4. Formulação do Payload: Construímos o payload injetando \n (como %0A) seguido do comando desejado: `test%0Acat%20/etc/natas_webpass/natas11`.  
5. Execução do Ataque: Inserimos o payload diretamente na URL do Natas10 (ex: `http://natas10.natas.labs.overthewire.org/?needle=test%0Acat%20/etc/natas_webpass/natas11`).
6. Validação da Resposta: O servidor processou a requisição e retornou o resultado do `grep` (listando palavras do dictionary.txt que contêm "test") e, crucialmente, a saída do comando `cat /etc/natas_webpass/natas11`, revelando a senha do próximo nível.  

---

## 🔑 Senha Encontrada

```
UJdqkK1pTu6VLt9UHWAgRZz6sVUZ3lEk
```

---

## ✅ Conclusão

A exploração foi bem-sucedida porque o filtro PHP era uma blacklist incompleta, visando apenas alguns caracteres (; e |) e falhando em considerar outros delimitadores de comando como o caractere de nova linha (\n). O shell do sistema operacional interpreta \n como um separador de comandos, permitindo a execução de um segundo comando injetado, mesmo após a decodificação da URL pelo PHP. Este caso reforça a importância de usar whitelists (permitir apenas o que é explicitamente seguro) e escapar corretamente os argumentos passados para comandos do sistema.  

---

## 🧪 Comandos Utilizados

cat /etc/natas_webpass/natas11: Comando injetado para ler o arquivo da senha. ( Sem URL-encoding)

---

## 🧠 Observações

- O `$_REQUEST` no PHP automaticamente decodifica os parâmetros da URL. Isso significa que `%0A` é transformado em `\n` antes de chegar ao `preg_match` e ao `passthru()`.  
- A fragilidade de filtros baseados em blacklist é evidente aqui; sempre há outros caracteres ou métodos que podem ser usados para contorná-los.  
- A função escapeshellarg() do PHP seria uma medida de segurança mais eficaz, pois escaparia o argumento completo, impedindo que o `\n` fosse interpretado como um separador de comando pelo shell.  

---

<p align="center"> <a href="../Natas09/Readme-BR.md">⬅️ Anterior</a> • <a href="../Natas11/Readme-BR.md">Proximo ➡️</a> </p>
