#include <ctype.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>


//using namespace std;

int main(){
    FILE *file;
	char *fichero = "programa.txt"; //declarar la dirección o nombre del archivo a leer
	char c; // char que contendrá cada caracter leído del archivo
	char estado = 'A'; //Bandera para indicar el estado en el que se encuentra nuestro automata programable
	char *pal_reser[]={"inicio","fin","mientras", "para","si", "sino","entero", "caracter", "decimal", "imprimir"};//arreglo que contiene todas las palabras reservadas permitidas
	char *verificador = ""; //Variable para almacenar la última palabra leída y poder decidir si se trata de una palabra reservada o un identificador
	bool palabra_detec = false;
	file = fopen(fichero,"r");
	int cont;
	//ifstream file(fichero.c_str(), ios:: in ); //Abriendo el archivo
	if (file == NULL) //Si no se encuentra el archivo
        printf("\nEl fichero no existe!! \n\n");

	else{ //Si encuentra el archivo
             while((c = fgetc(file)) != EOF){
                  printf("%c",c);

		//while (!file.eof())
		 //Ejecutará el siguiente bloque hasta que llegue al final del archivo
			//c = file.get(); //Obteniendo caracter del archivo.
			//cout << letra;
			if(verificador == "=" && c!= '='){
				printf("<tkn_asignacion> ");
				estado='A';
				verificador="";
			}
			if((verificador=="<"&&(c!='>' || c!='=')) || (verificador==">" && c!='=')){
				printf("<tkn_comparador>");
				estado='A';
				verificador="";
			}
			if(verificador==">" && c == '>'){
				printf("<tkn_simbolo>");
				estado='A';
				verificador="";
				continue;
			}
			if(verificador=="\"" && c=='"'){
				printf("<tkn_cadena>");
				estado='A';
				verificador="";
				continue;
			}
			if(estado=='F' && !(isdigit(c)) && c!='.'){
				printf("<tkn_entero>");
				estado='A';
				verificador="";
			}
			if(estado=='G' && ((c)<='0' || (c)>='9')){
				printf("<tkn_decimal>");
				estado='A';
				verificador="";
			}
			if((estado=='H') && !(isalpha(c)) && !(isdigit(c))){
				for(int cont=0; cont < 12; cont++){
					if(pal_reser[cont] == verificador){
						palabra_detec=true;
						break;
					}
				}
				if(palabra_detec){
					if(verificador=="entero" || verificador=="decimal" || verificador=="cadena"){
						strcpy("tipo_" ,verificador );
					//	verificador="tipo_"+verificador;
					}
					printf("<tkn_%s>",verificador);
				}else{
					printf("<tkn_identificador>");
				}
				palabra_detec=false;
				if(verificador=="fin"){
					printf("\n\n");
					break;
				}
				estado='A';
				verificador="";
			}
			switch(estado){
			case 'A':
				if(c == '='){
					estado = 'B';
					verificador = verificador + c;
				}else if (c == '+' || c == '-' || c == '*' || c == '/'){
					estado = 'C';
					printf("<tkn_aritmetico>");
					estado = 'A';
				}else if(c == '<' || c == '>'){
					estado= 'E';
					verificador = verificador + c;
				}else if (c==';'){
					estado = 'I';
					printf("<tkn_punto_coma>");
					estado = 'A';
				}else if (c=='{' || c=='}'){
					estado='L';
					printf("<tkn_llave>");
					estado='A';
				}else if (c=='(' || c==')'){
					estado='M';
					printf("<tkn_parentesis>");
					estado='A';
				}else if(c=='"'){
					estado = 'J';
					verificador = verificador + c;
				}else if(isdigit(c)){
					estado = 'F';
					verificador=verificador+c;
				}else if(isalpha(c)){
					estado = 'H';
					verificador=verificador+c;
				}else if(c=='\t' || c==' ' || c=='\n'){
					estado = 'Q';
					printf("%c",c);
					estado = 'A';
				}
				else{
					printf("<tkn_simbolo>");
				}
				break;
			case 'B':
				printf("<tkn_comparacion>");
				estado = 'A';
				verificador="";
				break;
			case 'C':
				break;
			case 'E':
				estado = 'N';
				estado = 'A';
				printf("<tkn_comparacion>");
				verificador="";
				break;
			case 'F':
				if(c=='.'){
					estado='G';
					verificador=verificador+c;
				}
				break;
			case 'G':
				verificador=verificador+c;
				break;
			case 'H':
				verificador=verificador+c;
				break;
			default:
				break;
			}

		}
	}
	fclose(file);
	system("pause");
}

