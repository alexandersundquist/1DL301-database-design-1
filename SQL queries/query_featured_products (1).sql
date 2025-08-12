SELECT product_name, product_description, stock, retail_price_no_tax,tax_rate,discount_percent, department_id
FROM PRODUCT
WHERE featured = '1';