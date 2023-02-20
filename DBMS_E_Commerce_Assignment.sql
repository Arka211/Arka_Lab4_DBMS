/* creating database "e_commerce" */
create database e_commerce;
use e_commerce;

/* creating table "supplier" */
CREATE TABLE IF NOT EXISTS supplier(
	SUPP_ID INT PRIMARY KEY AUTO_INCREMENT,
	SUPP_Name VARCHAR(50) NOT NULL,
	SUPP_CITY VARCHAR(50),
	SUPP_PHONE VARCHAR(10) NOT NULL
	);
    
    /* creating table "customer" */
     CREATE TABLE if NOT EXISTS customer(
 	CUS_ID INT AUTO_INCREMENT ,
 	CUS_NAME VARCHAR(20) NOT NULL,
 	CUS_PHONE VARCHAR(10) NULL,
 	CUS_CITY VARCHAR(30) NOT NULL,
 	CUS_GENDER CHAR,
 	PRIMARY KEY(CUS_ID) 
 );
 
 /* creating table "category" */
 CREATE TABLE if NOT EXISTS category(
	CAT_ID INT AUTO_INCREMENT ,
	CAT_NAME VARCHAR(20) NOT NULL,
	PRIMARY KEY (CAT_ID) 
	);
    
    /* creating table "product" */
 CREATE TABLE if NOT EXISTS product(
	PRO_ID INT AUTO_INCREMENT,
	PRO_NAME VARCHAR(20) NOT NULL DEFAULT('Dummy'),
	PRO_DESC VARCHAR(60),
	CAT_ID INT,
	PRIMARY KEY (PRO_ID),
	FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
    );
    
    /* creating table "supplier_pricing" */
    CREATE TABLE if NOT EXISTS supplier_pricing(
	PRICING_ID INT AUTO_INCREMENT,
	PRO_ID INT,
	SUPP_ID INT,
	SUPP_PRICE INT DEFAULT 0,
	PRIMARY KEY(PRICING_ID),
	FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
	FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

/* creating table "order" */
CREATE TABLE if NOT EXISTS `order` (
	ORD_ID INT  AUTO_INCREMENT ,
	ORD_AMOUNT INT NOT NULL,
	ORD_DATE DATE NOT NULL ,
	CUS_ID INT  ,
	PRICING_ID INT  ,
	PRIMARY KEY(ORD_ID),
	FOREIGN KEY(CUS_ID) REFERENCES customer(CUS_ID),
	FOREIGN KEY(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

/* creating table "rating" */
CREATE TABLE if NOT EXISTS rating(
	RAT_ID INT NOT NULL AUTO_INCREMENT ,
	ORD_ID INT NOT NULL,	 
	RAT_RATSTARS INT NOT NULL , 
	PRIMARY KEY(RAT_ID),
	FOREIGN KEY(ORD_ID) REFERENCES `order` (ORD_ID)
);

/* inserting values in table "supplier" */
INSERT INTO supplier(SUPP_NAME,SUPP_CITY,SUPP_PHONE)
VALUES
	("Rajesh Retails","Delhi",'1234567890'),
	("Appario Ltd.","Mumbai",'2589631470'),
	("Knome products","Banglore",'9785462315'),
	("Bansal Retails","Kochi",'8975463285'),
	("Mittal Ltd.","Lucknow",'7898456532');
    
    /* inserting values in table "customer" */
    INSERT INTO customer(CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) VALUES
("AAKASH",'9999999999',"DELHI",'M'),
("AMAN",'9785463215',"NOIDA",'M'),
("NEHA",'9999999999',"MUMBAI",'F'),
("MEGHA",'9994562399',"KOLKATA",'F'),
("PULKIT",'7895999999',"LUCKNOW",'M');
    
    /* inserting values in table "category" */
INSERT INTO category(CAT_NAME) VALUES("BOOKS");
INSERT INTO category(CAT_NAME) VALUES("GAMES");
INSERT INTO category(CAT_NAME) VALUES("GROCERIES");
INSERT INTO category(CAT_NAME) VALUES ("ELECTRONICS");
INSERT INTO category(CAT_NAME) VALUES("CLOTHES");
    
    /* inserting values in table "product" */
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",(SELECT CAT_ID FROM category WHERE CAT_NAME='GAMES'));
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);
    
    /* inserting values in table "supplier_pricing" */
INSERT INTO supplier_pricing(PRO_ID,SUPP_ID,SUPP_PRICE) 
VALUES(3,5,30000), 
(1,2,1500),
 (3,5,30000), 
 (5,1,3000), 
 (2,3,2500),
 (4,1,1000), 
 (12,2,780),
 (12,4,789), 
 (3,1,31000), 
 (1,5,1450),
 (4,2,999), 
 (7,3,549), 
 (7,4,529), 
 (6,2,105), 
 (6,1,99),
 (2,5,2999), 
 (5,2,2999);
    
    /* inserting values in table "order" */
INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-01-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);
    
    /* inserting values in table "rating" */
INSERT INTO rating(ORD_ID,RAT_RATSTARS) 
VALUES
(101,4),
(102,3), 
(103,1), 
(104,2), 
(105,4), 
(106,3), 
(107,4), 
(108,4), 
(109,3), 
(110,5), 
(111,3), 
(112,4), 
(113,2), 
(114,1), 
(115,1), 
(116,0);


/*
Q3
# Display the total number of customers based on gender who have placed orders of worth at least Rs.3000
*/

SELECT * FROM `order`;
SELECT * FROM customer;

SELECT * FROM `order`
INNER JOIN customer
ON `order`.CUS_ID = customer.CUS_ID HAVING  `order`.ORD_AMOUNT>=3000;
 
 /*# JOIN BOTH THE TABLES*/
 (SELECT  `order`.*, customer.CUS_NAME,customer.CUS_GENDER   from `order` 
	INNER JOIN  customer WHERE  `order`.CUS_ID =customer.CUS_ID HAVING  `order`.ORD_AMOUNT>=3000) order by CUS_GENDER;
 
 
 /*Q4
# Display all the orders along with product name ordered by a customer having Customer_Id=2
*/

SELECT * FROM `order`;
SELECT * FROM product;
SELECT * FROM supplier_pricing;
SELECT * FROM customer;

SELECT cus_name, pro_name,ord_id,ord_date
FROM product AS p, supplier_pricing AS sp,
`order` AS ORD, customer AS cus
WHERE 
cus.CUS_ID = 2 AND
cus.CUS_ID = ORD.CUS_ID AND
p.PRO_ID = sp.PRO_ID AND
ORD.PRICING_ID = sp.PRICING_ID;
 
  /*Q5
# Display the Supplier details of who is supplying more than one product.
*/
SELECT * FROM supplier;
SELECT * FROM product;
SELECT * FROM supplier_pricing;
SELECT sup.SUPP_ID, SUPP_NAME,SUPP_CITY,SUPP_PHONE FROM supplier AS sup
INNER JOIN
(SELECT * FROM supplier_pricing GROUP BY SUPP_ID HAVING COUNT(SUPP_ID)>1) AS sp
ON
sup.SUPP_ID = SP.SUPP_ID;

  /*Q6
Find the least expensive product from each category and print the table with category id, name, and price of the product
select table supplier_pricing for display price of each product.
*/
SELECT * FROM supplier_pricing;
# ========================================================================================================
# select relevant column and min price
SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID;
# ========================================================================================================
 SELECT * FROM product
 INNER JOIN
	 (SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID) 
 AS t2
 WHERE t2.PRO_ID = product.PRO_ID;
 # ========================================================================================================
 SELECT product.CAT_ID,product.PRO_NAME, t2.* FROM product
 INNER JOIN
	 (SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID) 
 AS t2
 WHERE t2.PRO_ID = product.PRO_ID;
 # ========================================================================================================
SELECT * FROM category
INNER JOIN
	(
		 SELECT product.CAT_ID,product.PRO_NAME, t2.* FROM product
		 INNER JOIN(SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID) 
 			AS t2  WHERE t2.PRO_ID = product.PRO_ID
	) AS t3	WHERE t3.CAT_ID = category.CAT_ID;
# ========================================================================================================
SELECT category.CAT_ID,category.CAT_NAME, t3.PRO_NAME, MIN(t3.MIN_PRICE) AS Min_Price FROM category
INNER JOIN
	(
		 SELECT product.CAT_ID,product.PRO_NAME, t2.* FROM product
		 INNER JOIN(SELECT PRO_ID,MIN(SUPP_PRICE) AS MIN_PRICE FROM supplier_pricing GROUP BY PRO_ID) 
 			AS t2  WHERE t2.PRO_ID = product.PRO_ID
	) AS t3	WHERE t3.CAT_ID = category.CAT_ID 
 group by t3.CAT_ID;
 
 
   /*Q7
   Display the Id and Name of the Product ordered after “2021-10-05”.
   */
SELECT * FROM `order`;
# ======================================
 SELECT * FROM `order` WHERE  ORD_DATE>'2021-10-05';
 SELECT * FROM supplier_pricing;
 SELECT * FROM product;
# ======================================
SELECT * FROM `order` AS ord
INNER JOIN  supplier_pricing AS sp
ON sp.PRICING_ID  = ORD. PRICING_ID;
# ======================================
SELECT * FROM `order` AS ord
INNER JOIN  supplier_pricing AS sp
ON sp.PRICING_ID  = ORD. PRICING_ID
INNER JOIN product AS  prod
ON prod.PRO_ID = sp.PRO_ID;
# ======================================
SELECT prod.PRO_ID,prod.PRO_NAME, ord.ORD_DATE FROM `order` AS ord
INNER JOIN  supplier_pricing AS sp
ON sp.PRICING_ID  = ORD. PRICING_ID
INNER JOIN product AS prod
ON prod.PRO_ID = sp.PRO_ID;
# ======================================
SELECT prod.PRO_ID,prod.PRO_NAME FROM `order` AS ord
INNER JOIN  supplier_pricing AS sp
ON sp.PRICING_ID  = ORD. PRICING_ID
INNER JOIN product AS prod
ON prod.PRO_ID = sp.PRO_ID WHERE ORD.ORD_DATE>'2021-10-05';

/*Q8
   Display customer name and gender whose names start or end with character 'A'.
   */
   SELECT * FROM customer AS c;

# Exact Match
SELECT * FROM customer AS c WHERE c.CUS_NAME = 'MEGHA';

# Partial Match
# Names starting with A or names ending with c.
 
SELECT * FROM customer AS c WHERE (c.CUS_NAME LIKE  'A%' OR c.CUS_NAME LIKE  '%A');
# Name starting with A and ending with N
SELECT * FROM customer AS c WHERE c.CUS_NAME LIKE  'A%N';

/*Q9
   Display customer name and gender whose names start or end with character 'A'.
   */
   select report.supp_id,report.supp_name,report.Average,
CASE
	WHEN report.Average =5 THEN 'Excellent Service'
    	WHEN report.Average >4 THEN 'Good Service'
    	WHEN report.Average >2 THEN 'Average Service'
    	ELSE 'Poor Service'
END AS Type_of_Service from 

(select final.supp_id, supplier.supp_name, final.Average from 
		(
			select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from 
			(	
				select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing 
				inner join 
					(
						select `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from `order` 
						inner join rating on rating.`ord_id` = `order`.ord_id 
					) as test on test.pricing_id = supplier_pricing.pricing_id
			) as test2 group by supplier_pricing.supp_id
		) as final 
		inner join 
		supplier where final.supp_id = supplier.supp_id) AS report;
 
 
 
 
 
 
 