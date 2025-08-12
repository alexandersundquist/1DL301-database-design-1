CREATE TABLE USER(
personal_number			CHAR(10)			NOT NULL,
first_name				VARCHAR(255)		NOT NULL,
last_name				VARCHAR(255)		NOT NULL,
email_adress			VARCHAR(255) 		NOT NULL,
pass_word 				VARCHAR(255)		NOT NULL,
phone_number			VARCHAR(20)			NOT NULL,
country				VARCHAR(255)		NOT NULL,
city					VARCHAR(255)		NOT NULL,
zip_code				VARCHAR(255)		NOT NULL,
address				VARCHAR(255)		NOT NULL,
newsletter_permission		BOOL 				NOT NULL,
PRIMARY KEY(personal_number),
UNIQUE (email_adress)
);

CREATE TABLE USER_ORDER(
order_number			INT(11)			NOT NULL,
order_status			SET("pending","confirmed", "shipped", "delivered")								NOT NULL,
last_change_date			DATE				,
payment_reference			CHAR(12)			NOT NULL,
tracking_number			VARCHAR(255)		,
user_id				CHAR(10)			NOT NULL,
PRIMARY KEY(order_number),
	FOREIGN KEY(user_id) REFERENCES USER(personal_number),
UNIQUE(payment_reference, tracking_number)
);

CREATE TABLE DEPARTMENT(
	department_number		INT(11)				NOT NULL,
department_name		VARCHAR(255)			NOT NULL,
department_description	VARCHAR(1511)			NOT NULL,
parent_id			INT(11)				,
PRIMARY KEY(department_number),
FOREIGN KEY(parent_id) REFERENCES DEPARTMENT(department_number)
);


CREATE TABLE PRODUCT(
	product_number			CHAR(12)			NOT NULL,	
	product_description		VARCHAR(1511)		,
retail_price_no_tax		FLOAT(64)			NOT NULL,
tax_rate				FLOAT(64)			NOT NULL,
stock					INT(255)			NOT NULL,
product_name			VARCHAR(255)		NOT NULL,
	featured				BOOL				NOT NULL,
discount_percent			FLOAT(64)			NOT NULL,
department_id			INT(11)			NOT NULL,	
PRIMARY KEY(product_number),
FOREIGN KEY(department_id) REFERENCES DEPARTMENT(department_number)
);

CREATE TABLE REVIEWS(
	user_id				CHAR(10)			NOT NULL,
product_id				CHAR(12)			NOT NULL,
review_text				VARCHAR(1511)		,
rating				TINYINT			NOT NULL
						CHECK(
                            		rating > 0
                            		AND rating <=5),
PRIMARY KEY(user_id, product_id),
FOREIGN KEY(user_id) REFERENCES USER(personal_number),
FOREIGN KEY(product_id) REFERENCES PRODUCT(product_number)
);

CREATE TABLE HOLDS(
	order_id				INT(11)			NOT NULL,
product_id				CHAR(12)			NOT NULL,
order_qty				INT(255)			NOT NULL,
order_price				FLOAT(64)			NOT NULL,
PRIMARY KEY(order_id, product_id),
FOREIGN KEY(order_id) REFERENCES USER_ORDER(order_number),
FOREIGN KEY(product_id) REFERENCES PRODUCT(product_number)
);

CREATE TABLE PRODUCT_KEYWORDS(
product_id 			CHAR(12)			NOT NULL,
keyword				VARCHAR(255)		NOT NULL,
PRIMARY KEY(product_id, keyword),
FOREIGN KEY(product_id) REFERENCES PRODUCT(product_number)
);
