Create Schema diwali_project;

CREATE TABLE sales (
    User_ID INT,
    Cust_name VARCHAR(100),
    Product_ID VARCHAR(50),
    Gender VARCHAR(10),
    Age_Group VARCHAR(20),
    Age INT,
    Marital_Status TINYINT,
    State VARCHAR(50),
    Zone VARCHAR(20),
    Occupation VARCHAR(100),
    Product_Category VARCHAR(100),
    Orders INT,
    Amount DECIMAL(10,2)
);

use diwali_project;

ALTER TABLE sales
modify column User_ID varchar(50);

alter table sales
modify column Amount int;

## CHECKING FOR DUPLICATES##

SELECT User_ID, Product_ID, Gender, Age_Group, Marital_Status,
       State, Occupation, Product_Category, Orders, Amount,
       COUNT(*) AS copies
FROM sales
GROUP BY User_ID, Product_ID, Gender, Age_Group, Marital_Status,
         State, Occupation, Product_Category, Orders, Amount
HAVING COUNT(*) > 1;

## CREATING A CLEAN TABLE WITH NO DUPLICATES##

CREATE TABLE diwali_clean AS
SELECT DISTINCT * FROM sales;

## CHECKING OUTLIERS##

select max(age),min(age)
from diwali_clean;

##CHECKING FOR NULL VALUES##

SELECT 
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(User_ID) AS null_user_id,
    COUNT(*) - COUNT(Cust_name) AS null_cust_name,
    COUNT(*) - COUNT(Product_ID) AS null_product_id,
    COUNT(*) - COUNT(Gender) AS null_gender,
    COUNT(*) - COUNT(Age_Group) AS null_age_group,
    COUNT(*) - COUNT(Marital_Status) AS null_marital_status,
    COUNT(*) - COUNT(State) AS null_state,
    COUNT(*) - COUNT(Zone) AS null_zone,
    COUNT(*) - COUNT(Occupation) AS null_occupation,
    COUNT(*) - COUNT(Product_Category) AS null_product_category,
    COUNT(*) - COUNT(Orders) AS null_orders,
    COUNT(*) - COUNT(Amount) AS null_amount
FROM
    diwali_clean;

select * from diwali_clean;







