def getdiscount(mycursor, product_number):
    mycursor.execute("SELECT product_name, discount_percent FROM  ht22_1_project_group_32.PRODUCT WHERE product_number="+product_number+";")
    myresult = mycursor.fetchall()
    if myresult == None:
        return False
    for x in myresult:
        print(str(x[0])+"\t"+str(x[1]))
    return True