import mysql.connector
from controller import controller

group_number="32" #FILL IN YOUR GROUP NUMBER

mydb = mysql.connector.connect(
  host="127.0.0.1", #"groucho.it.uu.se"
  user="ht22_1_group_"+group_number,
  passwd="pwd_"+group_number,
  database="ht22_1_project_group_"+group_number
)

mycursor = mydb.cursor()

controller(mydb, mycursor)

mydb.close()

