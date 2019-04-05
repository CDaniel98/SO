#!/bin/bash
# Bash Menu Script Example

echo " "
echo "Menu Principal"
echo " "
dat="dados.txt"

PS3='Introduza a opção: '
options=("Registo/Editar" "Alterar Dados" "Visualizar Dados" "Relatórios" "Sair do Programa")
select opt in "${options[@]}"
do
    case $opt in
        "Registo/Editar")
		      bash "registo.sh";;

        "Alterar Dados")
          bash "alterar_dados.sh";;

        "Visualizar Dados")
          echo $opt ":"echo
          echo
          cat $dat;; #não sei se isto chega mas acho que sim

		    "Relatórios")
          bash "relatorios.sh";;

        "Sair do Programa")
          break;;

        *) echo "invalid option $REPLY";;
    esac
done
