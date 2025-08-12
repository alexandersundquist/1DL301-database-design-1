from getchilddepartments import getchilddepartments
from getproducts import getproducts

def getchilddepartmentsorproducts(my_cursor, department_id):
    return getchilddepartments(my_cursor, department_id) or getproducts(my_cursor, department_id)