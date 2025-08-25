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
   writeln('Decifrado: ', decifrado, ' -> ', chr(decifrado));
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