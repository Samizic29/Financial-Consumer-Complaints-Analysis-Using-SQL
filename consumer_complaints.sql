-- Create a new schema
CREATE SCHEMA `consumer_complaints` ;

-- Create new table
CREATE TABLE consumer_complaints.`complaints` (
complaint_id int not null,
submitted_via varchar(255),
date_submitted date,
date_received date,
state varchar(10),
product varchar(255),
sub_product varchar(255),
issue varchar(255),
sub_issue varchar(255),
company_public_response text,
company_response varchar(255),
timely_response varchar(20),
primary key (complaint_id)
);

-- total rows
SELECT count(*) as row_count
FROM consumer_complaints.complaints;

-- total columns
SELECT count(*) as column_count
FROM information_schema.columns
WHERE table_schema = 'consumer_complaints'
AND table_name = 'complaints';


-- Analysis

-- Complaints Analysis

-- total no of complaints
SELECT count(complaint_id) as total_complaints
FROM consumer_complaints.complaints;

-- -- total no of resolved complaints
SELECT count(complaint_id) as total_unresolved_complaints
FROM consumer_complaints.complaints
WHERE company_response != 'In progress';

-- total no of unresolved complaints
SELECT count(complaint_id) as total_unresolved_complaints
FROM consumer_complaints.complaints
WHERE company_response = 'In progress';

-- No of Complaints by Submission Methods
SELECT submitted_via,
	   count(complaint_id) as total_complaints
FROM consumer_complaints.complaints
GROUP BY 1
ORDER BY 2 DESC;

-- No of Complaints by State (top 5)
SELECT state,
	   count(complaint_id) as total_complaints
FROM consumer_complaints.complaints
GROUP BY 1
ORDER BY 2 DESC
Limit 5;

-- No of Complaints by Product (Top 5)
SELECT product,
	   count(complaint_id) as total_complaints
FROM consumer_complaints.complaints
GROUP BY 1
ORDER BY 2 DESC
Limit 5;

-- Unresolved Complaints by Products
SELECT product,
	   count(complaint_id) as total_unresolved_complaints
FROM consumer_complaints.complaints
WHERE company_response = 'In progress'
GROUP BY 1
ORDER BY 2 DESC;

-- Top Issues for Each of the Top 5 Products

-- Common Table Expression Created
WITH
product_issue AS (
SELECT 
    product,
    issue,
    COUNT(complaint_id) AS total_issues,
    rank() over (partition by product order by product, COUNT(complaint_id) desc) AS rank_issue
FROM 
    consumer_complaints.complaints
GROUP BY 
    product, issue
)

SELECT product, 
	   issue, 
       total_issues
FROM product_issue
WHERE rank_issue = 1
LIMIT 5;

-- Average response times by submission methods
SELECT submitted_via,
	   ROUND(AVG(datediff(date_received, date_submitted)), 2) AS Avg_response_times
FROM consumer_complaints.complaints
GROUP BY 1
ORDER BY 2;

-- Average response times by product
SELECT product,
	   ROUND(AVG(datediff(date_received, date_submitted)), 2) AS avg_response_times
FROM consumer_complaints.complaints
GROUP BY 1
ORDER BY 2;

-- Complaints Trends Over Time

-- Complaints by Year
SELECT year(date_received) as Year,
       count(complaint_id) as total_complaints
FROM consumer_complaints.complaints
GROUP BY 1;

-- Complaints by Day
SELECT dayname(date_received) as month,
       count(complaint_id) as total_complaints
FROM consumer_complaints.complaints
GROUP BY 1
ORDER BY 2 DESC;

-- Timely Response Analysis

-- Total Complaints by Timely Response with Percentage
SELECT 
    timely_response,
    COUNT(complaint_id) AS total_complaints,
    ROUND((COUNT(complaint_id) * 100.0 / 
    (SELECT COUNT(*) 
     FROM consumer_complaints.complaints 
     WHERE company_response != 'In progress' )), 2) AS 'percentage_complaints(%)'
FROM consumer_complaints.complaints
WHERE company_response != 'In progress'
GROUP BY timely_response
ORDER BY total_complaints DESC;

-- Timely Response by Submission Method
SELECT submitted_via,
       timely_response,
	   count(complaint_id) as total_complaints
FROM consumer_complaints.complaints
WHERE company_response != 'In progress'
GROUP BY 1,2
ORDER BY 3 DESC;

-- Average Timely Response Rate by Product
SELECT product,
	   ROUND(SUM(CASE WHEN timely_response = 'Yes' THEN 1 ELSE 0 END) * 100.0 / 
       COUNT(timely_response), 2) AS 'avg_timely_response_rate(%)'
FROM consumer_complaints.complaints
GROUP BY 1
ORDER BY 2 DESC;

-- Timely Response Over Time
SELECT year(date_received),
       timely_response,
	   count(complaint_id) as total_complaints
FROM consumer_complaints.complaints
WHERE timely_response = 'Yes'
GROUP BY 1,2
ORDER BY 1,2;

-- Timely Response by Issue
SELECT issue,
       timely_response,
	   count(complaint_id) as total_complaints
FROM consumer_complaints.complaints
WHERE timely_response = 'Yes'
GROUP BY 1,2
ORDER BY 3 DESC;

-- Company Responses Count
SELECT company_response,
       count(complaint_id) as response_count
FROM consumer_complaints.complaints
GROUP BY 1
ORDER BY 2 DESC;

-- Company Responses by Product
-- CTE
WITH responses as (
SELECT product,
	   company_response,
       count(complaint_id) as response_count,
       rank() over (partition by product order by product, count(complaint_id) desc)  as rank_count
FROM consumer_complaints.complaints
GROUP BY 1,2
)
SELECT product, company_response, response_count
FROM responses
WHERE rank_count IN (1,2,3); 

