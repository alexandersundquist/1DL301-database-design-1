def getchilddepartments(mycursor, parent_id):
    mycursor.execute("SELECT department_name, department_number FROM  ht22_1_project_group_32.DEPARTMENT WHERE parent_id="+parent_id+";")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(str(x[0])+"\t"+str(x[1]))
    row = mycursor.fetchone()
    if row == None:
        return False
    return True

