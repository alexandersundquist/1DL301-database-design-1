
# byt ut 634 i department_id i where mot det department man vill få upp produkterna för

SELECT P.product_number ,P.product_name, P.product_description, P.retail_price_no_tax*P.tax_rate as retail_price, avg(R.rating) as average_rating
FROM ht22_1_project_group_32.PRODUCT as P, ht22_1_project_group_32.REVIEWS as R
where department_id=634 and P.product_number=R.product_id
group by P.product_number


