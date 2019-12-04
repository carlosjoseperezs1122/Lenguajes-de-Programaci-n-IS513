%{
#include <stdio.h>
#include <math.h>
%}

tipo_dato		"entero"|"decimal"|"caracter"
numero			{entero}|{decimal}
entero			{digito}+
digito			[0-9]
decimal			({entero}"."{entero})
id			({cadena}|{numero})
cadena			{letra}*
letra			[a-zA-Z]
operador		("+"|"-"|"/"|"*")
numeral			"#"
a_parentesis		"("
c_parentesis		")"
a_llaves		"{"
c_llaves		"}"
menor			"<"
mayor			">"
igual			"="
no_igual		"!="
igual_que		"=="
modulo			"%"
menor_igual		"<="
mayor_igual		">="
negacion		"!"
desplaza_izq		"<<"
desplaza_der		">>"
comillas		"\""
inicio_coment		"//"
punto			"."
comentario		({inicio_coment}({cadena}" "{cadena})*)
cadena_palabras		({comillas}({cadena}" "{cadena})*{comillas})
palabra_reservada	"inicio"|"fin"|"si"|"sino"|"mientras"|"para"|"imprimir"|"entero"|"caracter"|"decimal"
%%

{tipo_dato}+ {printf("tok_Tipo_dato (%s) ", yytext);}

{comentario}+ {printf("tok_Comentario (%s) ", yytext);}

{libreria}+ {printf("tok_Libreria (%s) ", yytext);}

{a_parentesis}+ {printf("tok_Abre_parentesis (%s) ", yytext);}
{c_parentesis}+ {printf("tok_Cierra_parentesis (%s) ", yytext);}

{comillas}+ {printf("tok_Comillas (%s) ", yytext);}

{modulo}+ {printf("tok_Modulo (%s) ", yytext);}

{punto}+ {printf("tok_Punto (%s) ", yytext);}

{a_llaves}+ {printf("tok_Abre_llaves (%s) ", yytext);}
{c_llaves}+ {printf("tok_Cierra_llaves (%s) ", yytext);}

{desplaza_izq}+ {printf("tok_Desplaza_izq (%s) ", yytext);}
{desplaza_der}+ {printf("tok_Desplaza_der (%s) ", yytext);}

{menor}+ {printf("tok_Menor (%s) ", yytext);}
{mayor}+ {printf("tok_Mayor (%s) ", yytext);}

{menor_igual}+ {printf("tok_Menor_igual (%s) ", yytext);}
{mayor_igual}+ {printf("tok_Mayor_igual (%s) ", yytext);}

{igual}+ {printf("tok_Igual (%s) ", yytext);}
{no_igual}+ {printf("tok_No_igual (%s) ", yytext);}

{negacion}+ {printf("tok_Negacion (%s) ", yytext);}

{operador}+ {printf("tok_Operador (%s) ", yytext);}

{numeral}+ {printf("tok_Numeral (%s) ", yytext);}

{palabra_reservada} {printf("tok_Palabra_reservada (%s) ", yytext);}

{fin_linea} {printf("tok_Fin_linea (%s) ", yytext);}

{entero}+ {printf("tok_Entero (%s) ", yytext);}

{decimal}+ {printf("tok_Decimal (%s) ", yytext);}

{id}+ {printf("tok_Id (%s) ", yytext);}

{cadena_palabras}+ printf("tok_Cadena_palabras (%s) ", yytext);

%%
main( int argc,char *argv[]){
	
	if ( argc == 2 ){
		yyin = fopen( argv[1], "r" );
	}
	if ( argc == 3){
		yyin = fopen( argv[1], "r" );
		yyout = fopen( argv[2], "w" );
	}
	else{
		yyin = stdin;
	}
	yylex();
	return 0;	
}
