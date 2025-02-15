/*
In the company_dim table, find all company names that include ‘Tech’ immediately followed by any single character. (e.g., "Lego Techs" or "Mario SuperTech.")
Return only the name column and return it in ascending order by the company name.
*/

SELECT 
	name
FROM company_dim
WHERE 
	name LIKE '%Tech_'
ORDER BY 
    name