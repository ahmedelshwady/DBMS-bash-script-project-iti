#! /usr/bin/bash
shopt -s extglob


while true
do
    read -p "How many columns do you want to add to the table? " col_numb

    if [[ $col_numb == +([0-9]) && $col_numb -gt 0 ]]; then
        break
    fi

    echo "Invalid number of columns!"
done

pk_flag=0

for (( i=1; i<=col_numb; i++ ))
do
    while true
        do
        read -p "Enter column $i name: " col_name

        if [[ $col_name == +([a-zA-Z0-9_-]) ]]; then
            break
        else
            echo "Invalid name! Use only letters, numbers, _ and -."
        fi
    done
    read -p "Enter column $i data type (int/string): " col_type

    if [[ $col_type != "int" && $col_type != "string" ]]; then
        echo "Invalid data type!"
        ((i--))
        continue
    fi

    if [[ $pk_flag -eq 0 ]]; then
        read -p "do you want this column to be the primary key? (y/n): " pk_choice
        if [[ $pk_choice == "y" ]]; then
            pk_flag=1
            echo "$col_name:$col_type:PK" >> ".$tableName"
        elif [[ $pk_choice == "n" ]]; then
            echo "$col_name:$col_type" >> ".$tableName"
        else
            echo "Invalid choice!"
            ((i--))
            continue
        fi
    else
        echo "$col_name:$col_type" >> ".$tableName"
    fi
done
echo "Table $tableName created successfully."
