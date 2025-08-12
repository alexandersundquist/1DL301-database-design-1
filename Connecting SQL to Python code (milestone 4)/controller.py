from editproductdiscount import editproductdiscount
from getchilddepartmentsorproducts import getchilddepartmentsorproducts
from getdiscount import getdiscount 

def controller(mydb, mycursor):
    is_running = True

    while is_running:
        what_to_do = input("What do you want to do? [1=See childdepartments or department products, 2=See discount on selected product, 3=Change discount on selected product, 4=Quit and go home!]")
        if what_to_do == "1":
            department_id = input("Please enter department id: ")
            getchilddepartmentsorproducts(mycursor, department_id)
        elif what_to_do == "2":
            product_id = input("Please enter product id: ")
            getdiscount(mycursor, product_id)
        elif what_to_do == "3":
            new_product_discount = input("Please enter new product discount for product "+product_id+": ")
            editproductdiscount(mydb,mycursor, product_id, new_product_discount)
        elif what_to_do =="4":
            is_running = False
    return