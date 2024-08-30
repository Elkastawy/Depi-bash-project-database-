#!/bin/bash

#creating directory
create_database() {

  mkdir  database1
  echo "Database 'database1' created."
}

# Creating table
create_table() {
  if [ ! -d "database1" ]; then
    echo "Database 'database1' does not exist."
    return
  fi

 

  touch database1/students
  echo "id,name,grade" > "database1/students"
  echo "Table 'students' created with columns: id,name,grade"
}

# Insert student data into the table
insert_data() {
 data=$1

  echo "$data" >> "database1/students"
  echo "Data inserted into table 'students'."
}









# Adding students
add_student() {
   local id=$1
   local name=$2
   local grade=$3

   echo -e "$id,$name,$grade" >> database1/students
    echo "Student '$name' added to table 'students'."
}



#Removing students

remove_student_byID() {
   local id=$1
   sed -i "/^$id/d" database1/students
   echo "Student with id '$id' removed from table 'students'."
}

remove_student_byname() {
   local name=$1
   sed -i "/$name/d" database1/students
   echo "Student '$name' removed from table 'students'."
}


#edit a student's data by ID
edit_student() {
    local id=$1
    local new_name=$2
    local new_grade=$3

    #new data
    local new_data="$id,$new_name,$new_grade"

    sed -i "/^$id,/c\\$new_data" database1/students

    echo "Student with ID $id updated to: $new_data"
}

create_database 
create_table 
insert_data "1,Ahmed,30"
insert_data "2,Mahmoud,25"
insert_data "3,Omar,35"

# Display table original content
echo "Table content:"
cat database1/students

add_student 4 "Nader" 28
remove_student_byID 2
remove_student_byname "Ahmed"
edit_student 3 "Yasser" 33

# Display table final content
echo "Table final content:"
cat database1/students
