# Financial-Consumer-Complaints-Analysis-Using-SQL

## By Oyedele Samuel

## Introduction
> This project focuses on analyzing a dataset of financial consumer complaints to uncover insights about customer grievances in the financial sector. By leveraging SQL for data cleaning, transformation, and analysis, this project aims to identify trends in complaints, assess the timeliness of company responses, and provide actionable insights to enhance customer satisfaction and service delivery.

## Objective
> Analyze consumer complaints data to identify trends, assess timely responses by companies, and highlight key areas for improvement in customer service.

## About Data
> Analyze consumer complaints data to identify trends, assess timely responses by companies, and highlight key areas for improvement in customer service.

## Tool Used
> MySQL was used to query this SQL project. The areas of SQL covered in this case study:
- Aggregate Functions
- Window Functions
- Common Table Expressions
- Date Functions

## Data Preparation
> The data import was done using MySQL Workbench. I created a database schema and table for data import in csv file. The table was constraints to its csv file. It consists of 62,516 rows and 12 columns.

## Exploratory Data Analysis

### Complaints Analysis
> Analysis consumer complaints across submission methods, product categories and issues.
-	Total number of complaints
-	Total number of unresolved complaints
-	No of Complaints by Submission Method
-	Top 5 Products with the Most Complaints
-	Top 5 Issues for Each of the Top 5 Products

### Trends Over Time
> Analysis the seasonal patterns of trends of the consumer complaints
- Consumer Complaints by year, day of the week

### Timely Response Analysis
> Analysis the timeliness of responses provided to consumer complaints.
- Total Complaints by Timely Response with Percentage
-	Timely Response by Submission Method
-	Average Timely Response Rate Products
-	Timely Response Over Time
-	Timely Response by Issue

### Comany Resolution Outcome
> Analysis the company responses provided to consumer complaints.
-	Company Responses Count
-	Company Responses by Product

## Summary of Findings
-	There is a total of 62,516 consumer complaints, of which 61,022 have been resolved, while 1,494 remain unresolved.
-	The majority of consumer complaints are submitted via Web and Referral channels.
-	The majority of consumer complaints are related to Check or Savings account services, with the primary issue being difficulties in managing an account. For Credit Card or Prepaid Card services, the most common issue reported is problems with purchases.
-	Credit reporting and money transfer services receive the fastest response times across all products, particularly when submitted through fax, email, or web channels.
-	They have been a consistent yearly increase in complaints from 2020 – 2022 with a significant decline in 2023.
- The company demonstrates excellent customer service efficiency, with a high percentage of complaints (96.06%) receiving a timely response ("Yes"). This highlights the organization's strong commitment to addressing customer concerns promptly.
-	The web channel demonstrates the highest rate of timely responses, while the phone channel has the lowest. This suggests that online customer service is more efficient compared to other communication channels.
-	The majority of resolved complaints are either closed with an explanation or resolved by providing monetary relief to the consumers.
-	Checking or savings accounts and credit card services are the most likely to result in monetary relief for consumers.

## Conclusions
> This analysis highlights key insights into consumer complaint trends and the company's response efficiency. With a total of 62,516 complaints, the company has demonstrated strong performance in resolving 96.06% of complaints within the required time frame, showcasing its commitment to customer service excellence. The web channel is the most efficient for timely responses, while phone complaints require improvement. Loan services, including student loans and mortgages, exhibit the highest customer service standards.







