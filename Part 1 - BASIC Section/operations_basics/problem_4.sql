/* 🟩 Problem 4 - Operations
❓Question:
In the invoices_fact table multiply the hours_spent by hours_rate and then add a fixed fee of $10. 
Rename this new column to adjusted_cost. Also return the activity_id. Order by activity_id in ascending order.
*/ 
SELECT
    activity_id,
	( hours_spent * hours_rate ) + 10 AS adjusted_cost
FROM
	invoices_fact
ORDER BY 
	activity_id ASC;

-- !!! relation "invoices_fact" does not exist