create database manufacturing;
use manufacturing;
select * from manufacturing;
desc manufacturing;
alter table manufacturing modify column Doc_Date datetime;


-- 1. Total Manufactured Quantity :-

	SELECT SUM(Manufactured_Qty) as Total_Manufactured_Qty
    FROM manufacturing;
    

-- 2. Total Rejected Quantity :-
    
    SELECT SUM(Rejected_Qty) as Total_Rejected_Qty
    FROM manufacturing;
    

-- 3. Total Processed Quantity :-
   
    SELECT SUM(Processed_Qty) as Total_Processed_Qty
    FROM manufacturing;
    

-- 4. Total Wastage Quantity :-
    
    SELECT sum(Rejected_Qty)/(sum(Manufactured_Qty)-sum(Rejected_Qty)) as Total_Wastage_Qty
    FROM manufacturing;
    
    
-- 5. Employee-wise Rejected Quantity :-
   
    SELECT Emp_Name, SUM(Rejected_Qty) as Employee_Rejected_Qty
    FROM manufacturing
    GROUP BY Emp_Name
    ORDER BY SUM(Rejected_Qty) desc;
    

-- 6. Machine-wise Rejected Quantity :-
   
    SELECT Machine_Name, SUM(Rejected_Qty) as Machine_Rejected_Qty
    FROM manufacturing
    GROUP BY Machine_Name
    ORDER BY SUM(Rejected_Qty) desc;
    

-- 7. Production Comparison Trend (Manufactured V/S Rejected over time) :-
    
	SELECT 
		date_format(Doc_Date,"%d - %b - %Y") AS Dates, 
		SUM(Manufactured_Qty) AS Daily_Manufactured_Qty, 
		SUM(Rejected_Qty) AS Daily_Rejected_Qty
	FROM 
		manufacturing
	GROUP BY 
		Dates
	ORDER BY 
		Dates;


-- 8. Manufactured V/S Rejected Quantity :-
    
    SELECT SUM(Manufactured_Qty) as Total_Manufactured_Qty, SUM(Rejected_Qty) as Total_Rejected_Qty
    FROM manufacturing;
    

-- 9. Department-wise Manufactured V/S Rejected Quantity :-
   
    SELECT Department_Name, SUM(Manufactured_Qty) as Department_Manufactured_Qty, SUM(Rejected_Qty) as Department_Rejected_Qty
    FROM manufacturing
    GROUP BY Department_Name;
    

-- 10. Employee-wise Rejected Quantity :-
   
    SELECT Emp_Name, SUM(Rejected_Qty) as Employee_Rejected_Qty
    FROM manufacturing
    GROUP BY Emp_Name
    ORDER BY SUM(Rejected_Qty) desc;
    