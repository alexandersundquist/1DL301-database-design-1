def getproducts(mycursor, department_id):
    mycursor.execute("SELECT product_number, product_name, retail_price_no_tax*tax_rate*(1-discount_percent) as retail_price FROM  ht22_1_project_group_32.PRODUCT WHERE department_id="+department_id+";")
    myresult = mycursor.fetchall()
    for x in myresult:
        print(str(x[0])+"\t"+x[1])
    return 
