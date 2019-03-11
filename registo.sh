#!/bin/bash
# Bash Menu Script Example

echo ""
echo "Menu Registo/Editar"
echo " "
falunos="alunos.txt"
f_profs="profs.txt"
f_disc="disc.txt"
f_uni="uni.txt"
f_dados="dados.txt"

PS3='Introduza a opção:'
options_registo=("Universidade" "Professor" "Estudante" "Disciplina" "Menu anterior")

select opt_r in "${options_registo[@]}"
do
	case $opt_r in
		"Universidade")
			echo "Registo de $opt_r"
			echo " "
			echo "Insira o nome da Universidade:"
			read r_uni

			if grep -Fxq $r_uni $f_uni
			then
				echo "ERRO: Esta Universidade já se encontra registada! "
								
			else
				echo $r_uni >> uni.txt 
				break;

		 ;;
		 
		 "Professor")
			echo "Registo de $opt_r"
			echo " "
			echo "Insira o nome do Professor:"
			read r_prof

			if grep -Fxq $r_prof $f_profs
			then
				echo "ERRO: Este Professor já se encontra registado! "
			else
				 echo $r_prof >> profs.txt
				 brEak;
		 ;;	

		"Discplina")
			echo "Registo de $opt_r"
			echo " "
			echo "Insira o nome da Disciplina:"
			read r_dis

			if grep -Fxq $r_dis $f_profs
			then
				echo "ERRO: Esta Disciplina já se encontra registada! "
			else
				echo $r_dis >> dis.txt
				 break;
			
		 ;;


		"Estudante")
			echo  "Insira o nome do Aluno:"
			read nome

			if grep -Fxq $nome $f_alunos
		 	then
				echo "ERRO: nome já existente"

			else
				echo $nome >> dados.txt
				echo  "Insira a universidade dentro das seguintes:"
				read uni
				cat $f_uni

				if grep -Fxq $uni $f_uni
				then

					echo  "Insira o/a docente responsável:"
					read prof
					cat $f_profs
								
					if grep -Fxq $prof $f_profs
					then
						maxid=$(tail -n 1 $f_alunos | cut -d: -f 1)

						let maxid=$maxid+1

						echo $maxid":"$nome":"$uni":"$prof >> dados.txt
						break;

					else
						 echo "ERRO: Universidade inexistente, registe-a primeiro."	

						else
							echo "ERRO: nome já existente"
			;;

		 "Menu anterior")
			bash "main.sh"
			;;
	     )echo "invalid option $REPLY";;
	 esac
 done
			
			
			
            