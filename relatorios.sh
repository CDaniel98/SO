#!/bin/bash
# Bash Menu Script Example

			echo ""
            echo "Menu Relatórios"
			echo " "
			PS3='Introduza a opção:'
			options_registo=("Listar Universidades" "Listar Disciplinas" "Listar Alunos Erasmus" "Listar Disciplinas com alunos inscritos" "Menu anterior")
			select opt_r in "${options_registo[@]}"
			do
				case $opt_r in
        	"Listar Universidades")
						echo "Registo de $opt_r";;

					"Listar Disciplinas")
						echo "Registo de $opt_r";;

					"Listar Alunos Erasmus")
						echo "Registo de $opt_r";;

					"Listar Disciplinas com alunos inscritos")
						echo "Registo de $opt_r";;

					"Menu anterior")
						bash "main.sh";;
						
					*) echo "invalid option $REPLY";;
				esac
			done
