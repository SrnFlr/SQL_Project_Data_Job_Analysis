/* 🟩 Problem 1 - NULL Values
❓Question:

We’re going to check that all skills that do not have a category assigned to it. Get all skills from the skills_dim table that don’t have a type (aka this type column is null). Return the skill_id and skills.

*/

SELECT 
	skill_id,
	skills
FROM 
	skills_dim
WHERE 
	type IS NULL;