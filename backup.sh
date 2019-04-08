#!/bin/bash
# Bash Menu Script Example

echo "##################################################################################"
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
             ls
             read file


            cp $file backups/$novo_nome
            bash "backup.sh"
		    ;;
        "Restaurar uma cópia de segurança")
             echo "Indique  nome do ficheiro a restaurar"
             read res

            # bash "back
            cp backups/$file $file
            bash "backup.sh"
            ;;
        "Apagar uma cópia de segurança")
            echo "Selecione o ficheiro a apagar"
             ls backups/
             read file1
             rm -f backups/$file1
             bash "backup.sh"

            ;;

        "Voltar atrás")
            bash "main.sh"
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
