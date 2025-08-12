
def editproductdiscount(mydb,mycursor, product_number, new_discount):
    mycursor.execute("UPDATE ht22_1_project_group_32.PRODUCT SET discount_percent =" +new_discount+ "WHERE product_number =" +product_number+ ";")
    myresult = mycursor.fetchone()
    mydb.commit()
    if myresult == None:
        return False
    for x in myresult:
        print(str(x[0])+"\t"+str(x[1]))
    return True