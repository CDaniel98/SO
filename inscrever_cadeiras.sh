#!/bin/bash
# Bash Menu Script Example

echo ""
echo "Menu Inscrever a Cadeiras"
echo " "


f_alunos="alunos.txt"
f_profs="profs.txt"
f_dis="dis.txt"
f_uni="uni.txt"
f_dados="dados.txt"
f_insc="inscritos.txt"

PS3='Introduza a opção:'
options_registo=("Increver a Cadeiras" "Desinscrever a Cadeiras" "Menu Inicial")
select opt_r in "${options_registo[@]}"
do
	case $opt_r in
    "Increver a Cadeiras")
      echo ""
      echo "INSCREVER A CADEIRAS:"
      echo ""
      echo "Selecione o nome do aluno:"
      cat $f_insc
      read r_aluno

      if grep -Fxq $r_aluno $f_alunos
        then
          echo "Insira o nome da cadeira a que se pretende inscrever:"
          cat $f_dis
          read cadeira

          if grep -Fxq $cadeira $f_dis
            then
              sed -i "s/$r_aluno/&:$cadeira/" $f_insc
              bash "inscrever_cadeiras.sh"
            else
              echo "ERRO: Esta disciplina não se encontra registada! "
          fi
        else
          echo "ERRO: Este aluno não se encontra registado! "
      fi
    ;;

    "Desinscrever a Cadeiras")
      echo ""
      echo "DESINSCREVER A CADEIRAS:"
      echo ""
      echo "Selecione o nome do aluno:"
      cat $f_insc
      read r_aluno

      if grep -Fxq $r_aluno $f_alunos
        then
          sed -i "s/$r_aluno.*/$r_aluno:/" $f_insc
          bash "inscrever_cadeiras.sh"
        else
          echo "ERRO: Este aluno não se encontra registado! "
      fi
    ;;

		"Menu Inicial")
			bash "main.sh"
		;;

    *) echo "invalid option $REPLY";;
  esac
done
