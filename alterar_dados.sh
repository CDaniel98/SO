#!/bin/bash
# Bash Menu Script Example

echo ""
echo "Menu Alterar dados"
echo " "
f_alunos="alunos.txt"
f_profs="profs.txt"
f_disc="disc.txt"
f_uni="uni.txt"
f_dados="dados.txt"

PS3='Introduza a opção:'
options_registo=("Universidade" "Professor" "Disciplina" "Estudante"  "Menu anterior")

select opt_r in "${options_registo[@]}"
do
	case $opt_r in
		"Universidade")
			echo "Aletrar $opt_r"
			echo " "
			echo "Insira o nome da Universidade a alterar:"
      cat $f_uni
			read r_uni

			if grep -Fxq $r_uni $f_uni
				then
	        echo "Insira o novo nome"
	        read new
	        sed -i "s/$r_uni/$new/" $f_uni
					echo $r_uni"->"$new
					#Chamada do ficheiro novamente para aparecerem as opções do menu
					bash "registo.sh"
	        echo " "
					break;

				else
	        echo "ERRO: Esta Universidade não se encontra registada! "
			fi;;
			
		 "Professor")
				echo "Aletrar $opt_r"
				echo " "
				echo "Insira o nome do Professor a alterar:"
	      cat $f_profs
				read r_prof

				if grep -Fxq $r_prof $f_profs
					then
            echo "Insira o novo nome"
            read new
            sed -i "s/$r_prof/$new/" $f_profs
						echo $r_prof"->"$new
		                #Se o professor estiver designado a algum aluno altera-se?
						#Chamada do ficheiro novamente para aparecerem as opções do menu
						bash "registo.sh"
		        echo " "
						break;

					else
		      	echo "ERRO: Este docente não se encontra registado! "
				fi;;

		"Disciplina")
			echo "Aletrar $opt_r"
			echo " "
			echo "Insira o nome da Disciplina a alterar:"
      cat $f_disc
			read r_disc

			if grep -Fxq $r_disc $f_disc
				then
	        echo "Insira o novo nome"
	        read new
	        sed -i "s/$r_disc/$new/" $f_disc
					echo $r_disc"->"$new
	                #Se a disciplina estiver designado a algum aluno altera-se?
					#Chamada do ficheiro novamente para aparecerem as opções do menu
					bash "registo.sh"
	        echo " "
					break;

				else
	        echo "ERRO: Esta disciplina não se encontra registada! "
			fi;;

		"Estudante")

			;;

		"Menu anterior")
				bash "main.sh"
		 ;;

	     *) echo "invalid option $REPLY";;
	 esac
 done
