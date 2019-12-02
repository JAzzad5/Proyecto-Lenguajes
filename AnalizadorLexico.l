%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
FILE *archivosalida;
%}

Numero 			[0-9]+
NumeroDecimal   	[0-9]+"."[0-9]+
Variable		[A-Z]+[a-zA-Z0-9]*
Cadena			[a-zA-Z0-9]+
Literal			["]

%%

"definir"|"leer"|"imprimir"|"cursor"|"repetir"|"mientras"|"hacer"|"hasta"|"repetir"|"si"|"sino"|"finsi" {
            
		printf("<Tkn_%s>",yytext);
		fprintf(archivosalida,"<Tkn_%s>",yytext);
		
            }
"<-"	{
            printf("<Tkn_asignacion>");
		fprintf(archivosalida,"<Tkn_asignacion>");
            }
"<"|">"|"<="|">="|"=="|"!="	{
            printf( "<Tkn_operador_logico>");
	fprintf(archivosalida,"<Tkn_operador_logico>");
}

{Numero}	{
            printf( "<Tkn_entero>");
fprintf(archivosalida,"<Tkn_entero>");
            }

{NumeroDecimal}     {
            printf( "<Tkn_decimal>");
fprintf(archivosalida,"<Tkn_decimal>");
}
{Variable}     {
            printf( "<Tkn_variable>");
fprintf(archivosalida,"<Tkn_variable>");
            }
{Cadena}     {
            printf( "<Tkn_Cadena>");
fprintf(archivosalida,"<Tkn_Cadena>");
            }

{Literal}{Cadena}{Literal}     {
            printf( "<Tkn_Cadena_Literal>");
fprintf(archivosalida,"<Tkn_Cadena_Literal>");
            }

"{"	{printf( "<Tkn_abrir_instruccion>");
fprintf(archivosalida,"<Tkn_abrir_instruccion>");
}

"}"	{printf( "<Tkn_cerrar_instruccion>");
fprintf(archivosalida,"<Tkn_cerrar_instruccion>");
}
"("	{printf( "<Tkn_abrir_condicion>");
fprintf(archivosalida,"<Tkn_abrir_condicion>");
}
")"	{printf( "<Tkn_cerrar_condicion>");
fprintf(archivosalida,"<Tkn_cerrar_condicion>");
}

"+"|"-"|"*"|"/"   {printf( "<Tkn_operador_aritmetico>" );
fprintf(archivosalida,"<Tkn_operador_aritmetico>");}


[ \t\n]+          /* se come los espacios en blanco */

.           printf( "Caracter no reconocido: %s\n", yytext );

%%

int main(int argc[],char *argv[])
{
 yyin=fopen("archivoentrada.txt", "r");
archivosalida = fopen("archivosalida.text","w+");
 yylex();
 return 0;
}
