/* 🟩 Problem 3 - Operations
❓Question:
In the invoices_fact tables subtract the hours_rate from the hours_spent and rename this new column to estimate_budget. 
Return the activity_id column as well. Order by activity_id in ascending order.
*/ 
SELECT 
	hours_spent - hours_rate AS estimate_budget,
    activity_id
FROM
	invoices_fact
ORDER BY 
	activity_id ASC;

-- !!! relation "invoices_fact" does not exist