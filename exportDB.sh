#!/bin/sh

####################################
#
# Exporting Entire MySQL Database from DB to .sql file
#
# Tested on Ubuntu 16.04 LTS based Operating System
####################################


# Read username
while [[ -z "$uname" ]]
do
  read -p "Enter MySQL Database username: " uname
done

# Read name of Database
while [[ -z "$dbname" ]]
do
  read -p "Enter name of MySQL Database you wish to Export: " dbname
done

# Read path to create sql file
while [[ -z "$path" ]]
do
  read -p "Enter path to store exported Database file: " path
done

# Read filename to be created
while [[ -z "$fname" ]]
do
  read -p "Enter name of file: " fname
done


{ # try

    # Use all three variables and export Database
    echo "Preparing to export..."
    command_to_execute="mysqldump -u '$uname' -p --opt '$dbname' > '$path'/'$fname'.sql"

    # Execute Command
    echo "Exporting Database..."
    eval "$command_to_execute"

} || { # catch
    echo "Error exporting Database... Please try again..."
}

echo "End of program..."
exit