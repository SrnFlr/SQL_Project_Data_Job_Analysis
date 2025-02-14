-- 🟩 Problem 1 - Operations - ❓Question:
-- In the invoices_fact table add the hours_spent to the hours_rate and rename this new column to added_value. 
-- Order by activity_id in ascending order. 
-- (This is calculating the total pay based on a particular activity_id.) 

SELECT 
	activity_id,
    hours_spent + hours_rate AS added_value	
FROM 
    invoices_fact
ORDER BY 
    activity_id;

-- !!! relation "invoices_fact" does not exist


