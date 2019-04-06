#!/bin/bash
# Bash Menu Script Example

echo " "
echo "Backups"
echo " "

PS3='Introduza a opção: '
options=("Criar uma cópia de segurança" "Restaurar uma cópia de segurança" "Apagar uma cópia de segurança" "Voltar atrás")
select opt in "${options[@]}"
do
    case $opt in
        "Criar uma cópia de segurança")
            echo "Selecione o ficheiro a copiar"

		   
		    ;;
        "Restaurar uma cópia de segurança")
           
            ;;
        "Apagar uma cópia de segurança")
            echo "you chose choice $REPLY which is $opt"
			
            ;;
		
        "Voltar atrás")
            bash "main.sh"
            ;;
        *) echo "invalid option $REPLY";;
    esac
done