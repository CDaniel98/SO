#!/bin/bash
# Bash Menu Script Example
echo "##################################################################################"
echo " "
echo "Menu Principal"
echo " "
dat="dados.txt"

PS3='Introduza a opção: '
options=("Registar Dados" "Inscrições a Cadeiras" "Alterar/Apagar Dados" "Visualizar Dados" "Relatórios" "Gerir Backups" "Sair do Programa")
select opt in "${options[@]}"
do
    case $opt in
        "Registar Dados")
		      bash "registo.sh"
        ;;
        "Inscrições a Cadeiras")
          bash "inscrever_cadeiras.sh"
        ;;
        "Alterar/Apagar Dados")
          bash "alterar_dados.sh"
        ;;
        "Visualizar Dados")
          echo ""
          echo "DADOS:"
          cat $dat
          bash "main.sh"
        ;;
		    "Relatórios")
          bash "relatorios.sh"
        ;;
        "Gerir Backups")
          bash "backup.sh"
        ;;
        "Sair do Programa")
          break
        ;;

        *) echo "invalid option $REPLY";;
    esac
done
