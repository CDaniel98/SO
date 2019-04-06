#!/bin/bash
# Bash Menu Script Example

echo ""
echo "Menu Registo/Editar"
echo " "
f_alunos="alunos.txt"
f_profs="profs.txt"
f_dis="dis.txt"
f_uni="uni.txt"
f_dados="dados.txt"

PS3='Introduza a opção:'
options_registo=("Universidade" "Professor" "Disciplina" "Estudante"  "Menu anterior")

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
					echo $r_uni" registada com sucesso! "
					#Chamada do ficheiro novamente para aparecerem as bash "backup.sh" opções do menu, apagar em caso de erro
					bash "registo.sh"
					break;
			fi;;

		"Professor")
			echo "Registo de $opt_r"
			echo " "
			echo "Insira o nome do Professor:"
			read r_prof

			if grep -Fxq $r_prof $f_profs #se já existi no file não deixa registar
				then
					echo "ERRO: Este Professor já se encontra registado! "
				else
					 echo $r_prof >> profs.txt
					 echo $r_prof" registada/o com sucesso! "
					 #Chamada do ficheiro novamente para aparecerem as opções do menu, apagar em caso de erro
					 bash "registo.sh"
			fi;;

		"Disciplina")
			echo "Registo de $opt_r"
			echo " "
			echo "Insira o nome da Disciplina:"
			read r_dis

			if grep -Fxq $r_dis $f_dis
				then
					echo "ERRO: Esta Disciplina já se encontra registada! "
				else
					echo $r_dis >> dis.txt
					echo $r_dis" registada com sucesso! "
					#Chamada do ficheiro novamente para aparecerem as opções do menu, apagar em caso de erro
					bash "registo.sh"
			fi;;

		"Estudante")
			echo  "Insira o nome do Aluno:"
			read nome

			if grep -Fxq $nome $f_alunos
			 	then
					echo "ERRO: nome já existente"
				else
					#echo $nome >> alunos.txt   não se pode fazer assim, se meteres uma uni inexistente ele regista o aluno em aluno.txt e depois não dá para regsitar numa uni existente

					echo  "Insira a universidade dentro das seguintes:"
					cat $f_uni
					read uni

					if grep -Fxq $uni $f_uni
						then
							echo  "Insira o/a docente responsável:"
							cat $f_profs
							read prof

							if grep -Fxq $prof $f_profs
								then

									echo "O aluno é de Erasmus? (sim/nao)"
									read erasmus

									if [ $erasmus = "sim" ]
										then
											echo $nome >> erasmus.txt
									fi

									maxid=$(tail -n1 dados.txt | cut -d: -f 1) #agora já soma 1 ao id anterior

									let maxid=$maxid+1

									echo $nome >> alunos.txt
									echo $maxid":"$nome":"$uni":"$prof >> dados.txt
									echo $maxid":"$nome":"$uni":"$prof" -> Dados guardados"
									#Chamada do ficheiro novamente para aparecerem as opções do menu, apagar em caso de erro
							    bash "registo.sh"

								else
									 echo "ERRO: docente inexistente, registe-o primeiro."
							fi

						else
							echo "ERRO: Universidade inexistente, registe-a primeiro."
					fi
			fi;;

		"Menu anterior")
			bash "main.sh";;

	    *) echo "invalid option $REPLY";;
	 esac
 done
