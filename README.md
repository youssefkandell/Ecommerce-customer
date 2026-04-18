🛒 E-Commerce Consumer Behavior Analysis
MySQL · Power BI · DAX
End-to-end analysis of 1,000 e-commerce customers to identify high-value segments, churn risk, and revenue-protecting actions.

Dataset
1,000 rows · 29 columns · Full year 2024
Covers: purchase behavior, satisfaction, channel preference, discount sensitivity, loyalty status, and more.

What Was Done
1. Data Cleaning (MySQL)

Stripped $ from Purchase_Amount and cast to DECIMAL
Converted date strings to proper DATE type using STR_TO_DATE
Standardized NULL / None / empty values to 'Unknown'

2. RFM Segmentation
Scored every customer on Recency, Frequency, and Monetary value using NTILE(4) window functions, then assigned to six segments: Champions, Loyal Customers, Potential Loyalists, At Risk, Needs Attention, and Lost.
3. Churn Risk Model
Built a composite churn score from three signals (recency + frequency + satisfaction) using NTILE(5), classifying customers as High / Medium / Low Risk.
4. Power BI Dashboard (4 pages)
Business overview · Customer segments · Category & discount analysis · Strategic recommendations

Key Findings

172 customers (17.2%) are High Churn Risk — several of them are top-tier Champions
20 high-CLV customers (avg CLV $2,927) at immediate risk → ~$58K revenue exposure
237 Potential Loyalists one step from Loyal → highest ROI retention target
Discounts increase volume but reduce AOV — best targeted at "Somewhat Sensitive" customers only


Files
FileDescriptionEcommerce_customer1.sqlFull SQL: schema, cleaning, RFM & Churn viewsEcommerce_Dashboard.pbixPower BI dashboard (4 pages)Dashboard_Preview.pdfPDF export of all dashboard pages
