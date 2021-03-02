#!/bin/bash
ARGS=$@

error () {
    echo -e "\033[31mERREUR : $1\033[0m"
}

echo "----- READER -----"
if [ $# -lt 1 ]
then
    echo "Usage : $0 <file> [file] ... [file]"
else
    for arg in $ARGS
    do
        if [ ! -e $arg ]
        then
            error "$arg n'existe pas."
        elif [ ! -f $arg ]
        then
            error "$arg n'est pas un fichier."
        elif [ ! -r $arg ]
        then
            error "vous n'avez pas les permissions pour lire $arg."
        else 
            echo -e "Nom du fichier : $arg\nContenu : `cat $arg`\n" 
        fi
    done
    echo "----- FIN -----"
fi