#! /usr/bin/bash
echo you are now inside $selectedDb database

select option in createTable show_tables dropTable selectData insertData updateData deleteData exit
do 
case $option in

"exit")
    break
;;

"createTable")
    while true
    do
        read -p "Enter table name: " tableName

        if [[ $tableName == +([a-zA-Z0-9_-]) ]]; then
            break
        else
            echo "Invalid name! Use only letters, numbers, _ and -."
        fi
    done
    
    if [ -f "$tableName" ]; then
        echo "Table already exists."
    else
        touch "$tableName" ".$tableName"
        . ../../create_table.sh
    fi
;;

"show_tables")
;;

"dropTable")
;;

"selectData")
;;

"insertData")
;;

"updateData")
;;

"deleteData")
;;

*)
    echo "Invalid option please select a valid option"
esac
REPLY=
done 