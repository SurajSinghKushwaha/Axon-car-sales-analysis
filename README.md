# Axon-car-sales-analysis

# Project Statement
   A small company, Axon, is a retailer specializing in selling classic cars. However, they are facing challenges in managing and analyzing their sales data. The sales team is struggling to make sense of the data, and the lack of a centralized system hampers effective data management and analysis. The management is unable to access accurate and up-to-date sales reports, impacting their decision-making process.
   
  
# 1# Steps and Approaches for Retail Project:
# Analysis of Axon's Retail Sales Data Management
Axon, a retailer specializing in classic cars, is grappling with the challenge of effectively managing and 
analyzing their sales data. The absence of a centralized system has hindered data comprehension, 
leading to a notable impact on decision-making. To address this, the company is considering the 
implementation of a Business Intelligence (BI) solution, with options including Microsoft PowerBI 
and SQL. The primary goal is to design and implement a user-friendly BI solution that enables 
efficient sales data management and analysis.
# Data Extraction and Cleaning:
The provided data was in MySQL format. I initiated the process by importing the 'classicmodels' 
database in MySQL, followed by loading it into Power BI Desktop using the 'Get Data' feature. The 
Power Query Editor was utilized for essential data transformations, including the removal of 
duplicates and the handling of missing values. Subsequently, I eliminated any blank rows and 
columns to streamline the dataset.
# Data Integration and Model Design:
The dataset encompassed tables for customers, products, orders, and more. I seamlessly integrated 
these tables to establish a Snowflakes schema within Power BI. Notably, the 'Orders' table was 
linked to dimension tables like 'Customers', 'Order Details', and others. This schema configuration 
greatly facilitated efficient data analysis.
# Dashboard and Report Creation:
Leveraging the capabilities of Power BI, I crafted interactive dashboards and reports that offered 
visual insights into the sales data. The presentation involved the strategic use of charts, graphs, and 
tables to effectively convey information. Moreover, I employed DAX functions to perform critical 
calculations, including the creation of new measures such as 'Total Amount', 'Order Amount', and 
'Profit Amount'. Additionally, I implemented a data hierarchy comprising year, quarter, month, and 
day for enhanced analysis.
# Testing and Debugging:
Rigorous testing was conducted to ensure the BI solution functioned seamlessly. Any identified 
discrepancies or errors were promptly addressed, thereby ensuring the generation of accurate 
results.
# Deployment and Documentation:
With the BI solution finalized, including the dashboards and reports, I proceeded to deploy it to both 
the sales team and the management. To facilitate user navigation and system utilization, I furnished 
comprehensive documentation that outlined the entire process in detail.
This comprehensive approach not only addressed Axon's immediate needs but also ensured that the 
implemented solution would serve as a valuable asset for the company's ongoing operations.
# 2# Report:
### Data Analysis Project for Retail: Sales Performance Report Using Power bi

The report provides a comprehensive overview of sales performance for the years 2003, 2004, and 
2005. It encompasses key metrics including total order value, total revenue, total profit amount, 
total customers, total products, average delivery days, top countries, most ordered product 
categories, top products, and revenue breakdown by year, quarter, month, and day.
# Key Takeaways:
Strong Overall Sales Performance:
Total revenue for the period amounts to 8.85 million, with a total profit of 3.83 million.
# Top 3 Countries:
The top-performing countries are USA, Spain, and France, collectively contributing to over 70% of 
the total revenue.
# Top 3 Most Ordered Product Categories:
The highest performing product categories are classic cars, vintage cars, and motorcycles, which 
collectively constitute over 80% of total revenue.
# Top 3 Most Ordered Products:
The 1992 Ferrari 348 Spider Red, 1952 Alpine Renault 1300, and 2001 Ferrari Enzo are the most 
ordered products, accounting for over 10% of total revenue.
# Revenue Trends:
Total revenue peaks in the fourth quarter, indicating a strong performance during the holiday 
season.
# 3# Additional Insights:
High-End Retailer:
The total order value of 9.6 million suggests that Axon Retail Insights caters to a high-end market.
With an average delivery time of 4 days, Axon Retail Insights demonstrates quick and efficient 
shipping, even for international orders.

Given that the top 3 product categories drive over 80% of revenue, the company should concentrate 
its marketing efforts on these segments.

With the highest revenue recorded in the fourth quarter, Axon Retail Insights should strategically 
target sales initiatives towards the holiday season.

In conclusion, the sales performance report for Axon Retail Insights showcases a positive trajectory. 
The company's robust revenue and profit figures, along with the stellar performance of ke
