#!/bin/bash
# Bash Menu Script Example

echo ""
      echo "Menu Relatórios"
echo " "

unis="uni.txt"
dis="dis.txt"
dat="dados.txt"
erasmus="erasmus.txt"
prof="profs.txt"
cad="inscritos.txt"

PS3='Introduza a opção:'
options_registo=("Listar Universidades" "Listar Disciplinas" "Listar Professores" "Listar Alunos Erasmus" "Listar Cadeiras dos Alunos" "Menu Inicial")
select opt_r in "${options_registo[@]}"
do
	case $opt_r in
  	"Listar Universidades")
			echo ""
			echo "UNIVERSIDADES:"
			echo ""
			cat $unis
			echo ""
			bash "relatorios.sh"
		;;

		"Listar Disciplinas")
			echo ""
			echo "DISCIPLINAS:"
			echo ""
			cat $dis
			echo ""
			bash "relatorios.sh"
		;;

		"Listar Professores")
			echo ""
			echo "PROFESSORES:"
			echo ""
			cat $prof
			echo ""
			bash "relatorios.sh"
		;;

		"Listar Alunos Erasmus")
			echo ""
			echo "ALUNOS ERASMUS:"
			echo ""
			cat $erasmus
			echo ""
			bash "relatorios.sh"
		;;

		"Listar Cadeiras dos Alunos")
			echo ""
			echo "CADEIRAS A QUE OS ALUNOS ESTÃO INSCRITOS:"
			echo ""
			cat $cad
			echo ""
			bash "relatorios.sh"
		;;

		"Menu Inicial")
			bash "main.sh"
		;;

		*) echo "invalid option $REPLY";;
	esac
done
