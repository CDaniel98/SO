#!/bin/bash
# Bash Menu Script Example

			echo ""
            echo "Menu Relatórios"
			echo " "

			unis="uni.txt"
			dis="dis.txt"
			dat="dados.txt"
			erasmus="erasmus.txt"

			PS3='Introduza a opção:'
			options_registo=("Listar Universidades" "Listar Disciplinas" "Listar Alunos Erasmus" "Listar Disciplinas com alunos inscritos" "Menu anterior")
			select opt_r in "${options_registo[@]}"
			do
				case $opt_r in
        	"Listar Universidades")
						echo ""
						echo "UNIVERSIDADES:"
						echo ""
						cat $unis
						echo ""
					;;

					"Listar Disciplinas")
						echo ""
						echo "DISCIPLINAS:"
						echo ""
						cat $dis
						echo ""
					;;

					"Listar Alunos Erasmus")
						echo ""
						echo "ALUNOS ERASMUS:"
						echo ""
						cat $erasmus
						echo ""
					;;

					"Listar Disciplinas com alunos inscritos")
						echo ""
						echo "DISCIPLINAS COM ALUNOS INSCRITOS"
						echo ""
						echo "Registo de $opt_r"
						echo ""
					;;

					"Menu anterior")
						bash "main.sh"
					;;

					*) echo "invalid option $REPLY";;
				esac
			done
