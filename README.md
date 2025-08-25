# Criptografia Simétrica e Assimétrica

**Disciplina:** Auditoria e Segurança de Sistemas – Atividades Complementares  
**Autor:** Daniel  
**Objetivo:** Demonstrar na prática a aplicação de algoritmos de criptografia utilizando **chave simétrica (Cifra de César)** e **chave assimétrica (RSA simplificado)**.

---

## Descrição

Este programa em **Pascalzim** permite que o usuário explore duas técnicas de criptografia:

1. **Criptografia Simétrica (Cifra de César)**
   - O usuário digita um texto.
   - Uma **chave numérica** é usada para cifrar o texto.
   - O programa decifra automaticamente, mostrando que a cifra é reversível.

2. **Criptografia Assimétrica (RSA simplificado)**
   - O usuário digita **uma letra**.
   - O programa aplica a **criptografia RSA** com valores didáticos:
     - `p = 3`, `q = 11` -> `n = 33`, `φ = 20`, `e = 3`, `d = 7`.
   - Exibe:
     - Letra original
     - Código ASCII
     - Letra cifrada (RSA)
     - Letra decifrada

> Observação: O RSA é **simplificado** para fins didáticos, podendo gerar caracteres não imprimíveis. A intenção é mostrar a lógica de criptografia assimétrica.

---

## Como executar

1. Abra o **Pascalzim** ou outro compilador compatível com Pascal.  
2. Crie um arquivo chamado, por exemplo: `Criptografia_Simetrica_Assimetrica.pas`.  
3. Copie o código do programa dentro do arquivo.  
4. Compile e execute.  
5. Siga as instruções na tela:
   - Digite um texto para cifrar com a **Cifra de César**.
   - Digite a chave numérica.
   - Veja o texto cifrado e decifrado.
   - Digite **uma letra** para aplicar o **RSA simplificado**.

---

## Código principal

```pascal
program Criptografia_Simetrica_Assimetrica;
uses crt;

var
   texto, resultado: string;
   chave: integer;
   letra: char;
   ascii, cifrado, decifrado: integer;

// Função de potência (base ^ expoente)
function Potencia(base, expoente: integer): integer;
var
   i, res: integer;
begin
   res := 1;
   for i := 1 to expoente do
      res := res * base;
   Potencia := res;
end;

// Cifra de César (simétrica)
function Cesar(frase: string; chave: integer): string;
var
   i, codigo: integer;
   saida: string;
begin
   saida := '';
   for i := 1 to length(frase) do
   begin
      codigo := ord(frase[i]) + chave;
      saida := saida + chr(codigo);
   end;
   Cesar := saida;
end;

// RSA simplificado (apenas 1 caractere)
procedure RSA(letra: char);
var
   n, e, d: integer;
begin
   n := 33;
   e := 3;
   d := 7;

   ascii := ord(letra);

   cifrado := Potencia(ascii, e) mod n;
   decifrado := Potencia(cifrado, d) mod n;

   writeln('Letra original: ', letra);
   writeln('ASCII: ', ascii);
   writeln('Cifrado (RSA): ', cifrado);
   writeln('Decifrado: ', decifrado, ' → ', chr(decifrado));
end;

begin
   clrscr;
   writeln('==== CRIPTOGRAFIA SIMETRICA (Cifra de Cesar) ====');
   write('Digite um texto: ');
   readln(texto);
   write('Digite a chave numerica: ');
   readln(chave);

   resultado := Cesar(texto, chave);
   writeln('Texto cifrado: ', resultado);

   resultado := Cesar(resultado, -chave);
   writeln('Texto decifrado: ', resultado);

   writeln;
   writeln('==== CRIPTOGRAFIA ASSIMETRICA (RSA SIMPLIFICADO) ====');
   write('Digite apenas 1 letra para aplicar RSA: ');
   readln(letra);

   RSA(letra);

   readln;
end.
---------------------------------------------------------------------------------------------------------------
Exemplo de Execução

==== CRIPTOGRAFIA SIMETRICA (Cifra de Cesar) ====
Digite um texto: POLICIAL
Digite a chave numerica: 3
Texto cifrado: SROLFLFDO
Texto decifrado: POLICIAL

==== CRIPTOGRAFIA ASSIMETRICA (RSA SIMPLIFICADO) ====
Digite apenas 1 letra para aplicar RSA: P
Letra original: P
ASCII: 80
Cifrado (RSA): 8
Decifrado: 17 → (caractere não imprimível)
