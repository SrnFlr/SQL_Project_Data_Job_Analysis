/* 🟩Problem 2 - Operations
❓Question:

In the invoices_fact table divide the hours_spent by the hours_rate and rename this column to efficiency_ratio. 
Return the activity_id as well. Order by activity_id in ascending order.

*/ 
SELECT 
	hours_spent / hours_rate AS efficiency_ratio,
    activity_id
FROM
	invoices_fact
ORDER BY 
	activity_id ASC;

-- !!! relation "invoices_fact" does not exist