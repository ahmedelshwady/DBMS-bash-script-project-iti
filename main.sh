#! /usr/bin/bash
shopt -s extglob

# createDB selectDB renameDB DropDB
# createTB selectTB insertTB DropTB 

if [ -e /home/shawdaz/iti/bash_script/project ]
then
cd /home/shawdaz/iti/bash_script/project
echo "DBMS is ready"

else
mkdir /home/shawdaz/iti/bash_script/project
cd /home/shawdaz/iti/bash_script/project
echo "DBMS is ready"
fi

if [ ! -e /home/shawdaz/iti/bash_script/project/databases ]
then
mkdir /home/shawdaz/iti/bash_script/project/databases
fi

select option in createDB show_databases selectDB dropDB renameDB exit
do
case $option in 

"exit")
    break
;;
"createDB")
    while true
    do
        read -p "Please Enter Database name: " dbName

        if [[ $dbName == +([a-zA-Z0-9_-]) ]]; then
            break
        else
            echo "Invalid name! Use only letters, numbers, _ and -."
        fi
    done

    if [ -e ./databases/$dbName ]
    then
        echo "database is already exist"
    else
        mkdir ./databases/$dbName
        echo "Database is created successfully"
    fi
;;
"selectDB")
    read -p "Please Enter Database name: " selectedDb
    if [[ -e ./databases/$selectedDb && -r ./databases/$selectedDb ]]
    then
        cd ./databases/$selectedDb
        echo "$selectedDb Database is selected"
        . ../../dml.sh
    else
        echo "Database is not exist"
    fi
;;
"show_databases")
    if [[ -d ./databases && -r ./databases && -x ./databases ]]
    then
        if [[ $(ls ./databases/) == "" ]]
        then
            echo "No databases found."
        else
            echo "Databases are:"
            ls ./databases/
        fi
    else
        echo "You don't have permission to read databases."
    fi
;;
"dropDB")
    read -p "Please Enter Database name: " dropDb
    if [[ -e ./databases/$dropDb && -w ./databases/$dropDb ]]
    then
        rm -rf ./databases/$dropDb
        echo "$dropDb Database is dropped successfully"
    else 
        echo "Database is not exist or you can't drop it"
    fi
;;
"renameDB")
    read -p "Please Enter Database name: " oldDb
    if [[ -e ./databases/$oldDb && -w ./databases/$oldDb ]]
    then
        while true
        do
            read -p "Please Enter new Database name: " newDb

            if [[ $newDb == +([a-zA-Z0-9_-]) ]]; then
                break
            else
                echo "Invalid name! Use only letters, numbers, _ and -."
            fi
        done
    mv ./databases/$oldDb ./databases/$newDb
    echo "$oldDb Database is renamed to $newDb successfully"
    else
    echo "Database is not exist or you can't rename it"
    fi
;;
*)
    echo "Invalid option please select a valid option"
;;

esac
REPLY=
done
