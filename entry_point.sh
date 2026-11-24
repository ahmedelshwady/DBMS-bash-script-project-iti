#! /usr/bin/bash

# createDB selectDB renameDB DropDB
# createTB selectTB insertTB DropTB 

if [ -e ~/iti/'bash scripting'/project ]
then
cd ~/iti/'bash scripting'/project
echo "DBMS is ready"

else
mkdir ~/iti/'bash scripting'/project
cd ~/iti/'bash scripting'/project
echo "DBMS is ready"
fi


select option in createDB SelectDB dropDB renameDB exit
do
case $option in 
"exit")
break
;;

"createDB")
read -p "Please Enter Database name: " dbName
if [ -e $dbName ]
then
echo "database is already exist"
else
mkdir $dbName
echo "Database is created successfully"
fi
;;

"SelectDB")
read -p "Please Enter Database name: " selectedDb
if [[ -e $selectedDb && -r $selectedDb ]]
then
cd $selectedDb
echo "$selectedDb Database is selected"

else
echo "Database is not exist"
fi
;;

"dropDB")
read -p "Please Enter Database name: " dropDb
if [[ -e $dropDb && -w $dropDb ]]
then
rm -rf $dropDb
echo "$dropDb Database is dropped successfully"
else 
echo "Database is not exist or you can't drop it"
fi
;;

"renameDB")
read -p "Please Enter Database name: " oldDb
if [[ -e $oldDb && -w $oldDb ]]
then
read -p "Please Enter new Database name: " newDb
mv $oldDb $newDb
echo "$oldDb Database is renamed to $newDb successfully"
else
echo "Database is not exist or you can't rename it"
fi
;;
esac
REPLY=
done
