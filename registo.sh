#!/bin/bash
# Bash Menu Script Example

			echo ""
            echo "Menu Registo/Editar"
			echo " "
			PS3='Introduza a opção:'
			options_registo=("Universidade" "Professor" "Estudante" "Disciplina" "Menu anterior")
			select opt_r in "${options_registo[@]}"
			do
				case $opt_r in
					"Universidade")
						echo "Registo de $opt_r"
						;;
					"Professor")
						echo "Registo de $opt_r"
						;;
					"Discplina")
						echo "Registo de $opt_r"
						;;
					"Menu anterior")
						bash "main.sh"
						;;
					*) echo "invalid option $REPLY";;
				esac
			done
			
			
			
            