select product_name
from PRODUCT
where product_number =
	(select product_id
    from PRODUCT_KEYWORDS
    where keyword =
		(select keyword
        from PRODUCT_KEYWORDS
        where product_id = "38"))