#!/bin/bash
# Bash Menu Script Example
echo "##################################################################################"
echo ""
echo "Menu Alterar/Apagar dados"
echo " "
f_alunos="alunos.txt"
f_profs="profs.txt"
f_disc="disc.txt"
f_uni="uni.txt"
f_dados="dados.txt"
f_erasmus="erasmus.txt"



PS3='Introduza a opção:'
options_registo_inicial=("Apagar" "Alterar" "Menu Inicial")
select opt_ri in "${options_registo_inicial[@]}"
do
	case $opt_ri in
		"Apagar")
			echo ""
			echo "Menu Apagar dados"
			echo " "
			PS3='Introduza a opção:'
			options_registo=("Universidade" "Professor" "Disciplina" "Estudante" "Menu Anterior")

			select opt_r in "${options_registo[@]}"
			do
				case $opt_r in
					"Universidade")
						echo "Alterar $opt_r"
						echo " "
						echo "Insira o nome da Universidade a apagar:"
						cat $f_uni
						read r_uni

						if grep -Fxq $r_uni $f_uni
							then
								sed -i -e "s/$r_uni//g" $f_uni
								sed -i -e "s/$r_uni//g" $f_dados
								#Chamada do ficheiro novamente para aparecerem as opções do menu
								bash "registo.sh"
								echo " "
								break;

							else
								echo "ERRO: Esta Universidade não se encontra registada! "
						fi
					;;

				 "Professor")
						echo "Alterar $opt_r"
						echo " "
						echo "Insira o nome do Professor a apagar:"
						cat $f_profs
						read r_prof

						if grep -Fxq $r_prof $f_profs
							then
								sed -i -e "s/$r_prof//g" $f_profs
								sed -i -e "s/$r_prof//g" $f_dados
								bash "registo.sh"
								echo " "
								break;

							else
								echo "ERRO: Este docente não se encontra registado! "
						fi
					;;

					"Disciplina")
						echo "Alterar $opt_r"
						echo " "
						echo "Insira o nome da Disciplina a apagar:"
						cat $f_disc
						read r_disc

						if grep -Fxq $r_disc $f_disc
							then
								sed -i -e "s/$r_disc//g" $f_disc
								bash "registo.sh"
								echo " "
								break;

							else
								echo "ERRO: Esta disciplina não se encontra registada! "
						fi
					;;

					"Estudante")
						echo "Alterar $opt_r"
						echo " "
						echo "Insira o nome do Estudante a apagar:"
						cat $f_alunos
						read r_aluno

						if grep $r_aluno $f_alunos
							then
								sed -i "/$r_aluno/d" $f_dados
								sed -i -e "s/$r_aluno//g" $f_erasmus
								sed -i -e "s/$r_aluno//g" $f_alunos
								bash "registo.sh"
								echo " "
								break;

							else
								echo "ERRO: Este estudante não se encontra registado! "
						fi
					;;

					"Menu Anterior")
						bash "alterar_dados.sh"
					;;

						 *) echo "invalid option $REPLY";;
				 esac
			 done
		;;

		"Alterar")
			echo ""
			echo "Menu Alterar dados"
			echo " "
			PS3='Introduza a opção:'
			options_registo=("Universidade" "Professor" "Disciplina" "Estudante"  "Menu Anterior")

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
								sed -i -e "s/$r_uni/$new/g" $f_dados
								echo $r_uni"->"$new
								bash "registo.sh"
				        echo " "
								break;

							else
				        echo "ERRO: Esta Universidade não se encontra registada! "
						fi
					;;

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
								sed -i -e "s/$r_prof/$new/g" $f_dados
								echo $r_prof"->"$new
								bash "registo.sh"
				        echo " "
								break;

							else
				      	echo "ERRO: Este docente não se encontra registado! "
						fi
					;;

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
								bash "registo.sh"
				        echo " "
								break;

							else
				        echo "ERRO: Esta disciplina não se encontra registada! "
						fi
					;;

					"Estudante")
						echo ""
						echo "Menu Alterar dados do Estudante"
						echo " "
						PS3='Introduza a opção:'
						options_registo=("Universidade" "Professor" "Menu Anterior")
						select opt_r in "${options_registo[@]}"
						do
							case $opt_r in
								"Universidade")
								;;

								"Professor")
								;;
							esac
						done
					;;

					"Menu Anterior")
							bash "alterar_dados.sh"
					 ;;

				     *) echo "invalid option $REPLY";;
				 esac
			 done
			;;

			"Menu Inicial")
				bash "main.sh"
			;;
		esac
	done
