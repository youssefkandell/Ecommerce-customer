CREATE TABLE ecommerce_data ( 
    Customer_ID             VARCHAR(20), 
    Age                     INT, 
    Gender                  VARCHAR(20), 
    Income_Level            VARCHAR(20), 
    Marital_Status          VARCHAR(20), 
    Education_Level         VARCHAR(30), 
    Occupation              VARCHAR(20), 
    Location                VARCHAR(100),  
    Purchase_Category       VARCHAR(60), 
    Purchase_Amount_Raw     VARCHAR(20),        
    Purchase_Amount         DECIMAL(10,2),      
    Frequency_of_Purchase   INT, 
    Purchase_Channel        VARCHAR(20),  
    Brand_Loyalty           INT,                
    Product_Rating          INT,                
    Research_Hours          DECIMAL(5,2), 
    Social_Media_Influence  VARCHAR(10) NULL,  
    Discount_Sensitivity    VARCHAR(30), 
    Return_Rate             INT,               
    Customer_Satisfaction   INT,               
    Engagement_with_Ads     VARCHAR(10) NULL,   
    Device_Used             VARCHAR(20), 
    Payment_Method          VARCHAR(20), 
    Purchase_Date           DATE,              
    Discount_Used           TINYINT(1), 
    Loyalty_Member          TINYINT(1), 
    Purchase_Intent         VARCHAR(20), 
    Shipping_Preference     VARCHAR(20), 
    Time_to_Decision        INT 
);

DESC ecommerce_data;

CREATE TABLE ecommerce_data ( 
    Customer_ID             VARCHAR(20), 
    Age                     INT, 
    Gender                  VARCHAR(20), 
    Income_Level            VARCHAR(20), 
    Marital_Status          VARCHAR(20), 
    Education_Level         VARCHAR(30), 
    Occupation              VARCHAR(20), 
    Location                VARCHAR(100),  
    Purchase_Category       VARCHAR(60), 
    Purchase_Amount_Raw     VARCHAR(20),        
    Purchase_Amount         DECIMAL(10,2),      
    Frequency_of_Purchase   INT, 
    Purchase_Channel        VARCHAR(20),  
    Brand_Loyalty           INT,                
    Product_Rating          INT,                
    Research_Hours          DECIMAL(5,2), 
    Social_Media_Influence  VARCHAR(10) NULL,  
    Discount_Sensitivity    VARCHAR(30), 
    Return_Rate             INT,               
    Customer_Satisfaction   INT,               
    Engagement_with_Ads     VARCHAR(10) NULL,   
    Device_Used             VARCHAR(20), 
    Payment_Method          VARCHAR(20), 
    Purchase_Date           DATE,              
    Discount_Used           TINYINT(1), 
    Loyalty_Member          TINYINT(1), 
    Purchase_Intent         VARCHAR(20), 
    Shipping_Preference     VARCHAR(20), 
    Time_to_Decision        INT 
);

DESC ecommerce_data;

CREATE TABLE ecommerce_data ( 
    Customer_ID             VARCHAR(20), 
    Age                     INT, 
    Gender                  VARCHAR(20), 
    Income_Level            VARCHAR(20), 
    Marital_Status          VARCHAR(20), 
    Education_Level         VARCHAR(30), 
    Occupation              VARCHAR(20), 
    Location                VARCHAR(100),  
    Purchase_Category       VARCHAR(60), 
    Purchase_Amount_Raw     VARCHAR(20),        
    Purchase_Amount         DECIMAL(10,2),      
    Frequency_of_Purchase   INT, 
    Purchase_Channel        VARCHAR(20),  
    Brand_Loyalty           INT,                
    Product_Rating          INT,                
    Research_Hours          DECIMAL(5,2), 
    Social_Media_Influence  VARCHAR(10) NULL,  
    Discount_Sensitivity    VARCHAR(30), 
    Return_Rate             INT,               
    Customer_Satisfaction   INT,               
    Engagement_with_Ads     VARCHAR(10) NULL,   
    Device_Used             VARCHAR(20), 
    Payment_Method          VARCHAR(20), 
    Purchase_Date           DATE,              
    Discount_Used           TINYINT(1), 
    Loyalty_Member          TINYINT(1), 
    Purchase_Intent         VARCHAR(20), 
    Shipping_Preference     VARCHAR(20), 
    Time_to_Decision        INT 
);

DESC ecommerce_data;

use ecommerce_data;

SELECT COUNT(*) AS total_rows
FROM ecommerce_data;

SELECT
    Customer_ID,
    Purchase_Amount_Raw,
    Purchase_Amount,
    Purchase_Date,
    Research_Hours
FROM ecommerce_data
LIMIT 5;

SELECT * FROM ecommerce_data LIMIT 3;

SHOW COLUMNS FROM ecommerce_data;

DROP TABLE ecommerce_data;

ALTER TABLE Ecommerce_Consumer_Behavior_Analysis_Data 
RENAME TO ecommerce_data;

SHOW COLUMNS FROM ecommerce_data;

ALTER TABLE ecommerce_data 
ADD COLUMN Purchase_Amount_Clean DECIMAL(10,2);

UPDATE ecommerce_data
SET Purchase_Amount_Clean = CAST(
    TRIM(REPLACE(`Purchase_Amount`, '$', ''))
    AS DECIMAL(10,2)
);

ALTER TABLE ecommerce_data 
ADD COLUMN Purchase_Amount_Clean DECIMAL(10,2);

SHOW COLUMNS FROM ecommerce_data;

SET SQL_SAFE_UPDATES = 0;

UPDATE ecommerce_data
SET Purchase_Amount_Clean = CAST(
    TRIM(REPLACE(Purchase_Amount, '$', ''))
    AS DECIMAL(10,2)
);

SELECT 
    MIN(Purchase_Amount_Clean) AS min_amount,
    MAX(Purchase_Amount_Clean) AS max_amount,
    SUM(CASE WHEN Purchase_Amount_Clean IS NULL THEN 1 ELSE 0 END) AS still_null
FROM ecommerce_data;

ALTER TABLE ecommerce_data
ADD COLUMN Purchase_Date DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE ecommerce_data
SET Purchase_Date = STR_TO_DATE(`Time_of_Purchase`, '%m/%d/%Y');

SELECT 
    MIN(Purchase_Date) AS earliest,
    MAX(Purchase_Date) AS latest,
    SUM(CASE WHEN Purchase_Date IS NULL THEN 1 ELSE 0 END) AS null_dates
FROM ecommerce_data;

SET SQL_SAFE_UPDATES = 0;

UPDATE ecommerce_data
SET Social_Media_Influence = 'Unknown'
WHERE Social_Media_Influence IS NULL;

UPDATE ecommerce_data
SET Engagement_with_Ads = 'Unknown'
WHERE Engagement_with_Ads IS NULL;

UPDATE ecommerce_data
SET Purchase_Category = 'Travel & Leisure'
WHERE Purchase_Category IN (
    'Travel & Leisure (Flights',
    'Packages)'
);

SELECT
    COUNT(*)                                                        AS total_rows,
    MIN(Purchase_Amount_Clean)                                      AS min_amount,
    MAX(Purchase_Amount_Clean)                                      AS max_amount,
    MIN(Purchase_Date)                                              AS earliest_date,
    MAX(Purchase_Date)                                              AS latest_date,
    SUM(CASE WHEN Social_Media_Influence = 'Unknown' THEN 1 ELSE 0 END) AS replaced_social,
    SUM(CASE WHEN Engagement_with_Ads    = 'Unknown' THEN 1 ELSE 0 END) AS replaced_ads,
    COUNT(DISTINCT Purchase_Category)                               AS total_categories
FROM ecommerce_data;

SELECT 
    Social_Media_Influence,
    COUNT(*) AS cnt
FROM ecommerce_data
GROUP BY Social_Media_Influence
ORDER BY cnt DESC;
 SET SQL_SAFE_UPDATES = 0;

UPDATE ecommerce_data
SET Social_Media_Influence = 'Unknown'
WHERE Social_Media_Influence = '' OR Social_Media_Influence IS NULL;

UPDATE ecommerce_data
SET Engagement_with_Ads = 'Unknown'
WHERE Engagement_with_Ads = '' OR Engagement_with_Ads IS NULL;

SELECT Social_Media_Influence, COUNT(*) AS cnt
FROM ecommerce_data
GROUP BY Social_Media_Influence;


SET SQL_SAFE_UPDATES = 0;

UPDATE ecommerce_data
SET Social_Media_Influence = 'Unknown'
WHERE Social_Media_Influence = 'None';

UPDATE ecommerce_data
SET Engagement_with_Ads = 'Unknown'
WHERE Engagement_with_Ads = 'None';

SELECT
    COUNT(*)                                                            AS total_rows,
    MIN(Purchase_Amount_Clean)                                          AS min_amount,
    MAX(Purchase_Amount_Clean)                                          AS max_amount,
    MIN(Purchase_Date)                                                  AS earliest_date,
    MAX(Purchase_Date)                                                  AS latest_date,
    SUM(CASE WHEN Social_Media_Influence = 'Unknown' THEN 1 ELSE 0 END) AS replaced_social,
    SUM(CASE WHEN Engagement_with_Ads    = 'Unknown' THEN 1 ELSE 0 END) AS replaced_ads,
    COUNT(DISTINCT Purchase_Category)                                   AS total_categories
FROM ecommerce_data;

SELECT DISTINCT Social_Media_Influence
FROM ecommerce_data
LIMIT 10;

SET SQL_SAFE_UPDATES = 0;

UPDATE ecommerce_data
SET Social_Media_Influence = 'Unknown'
WHERE Social_Media_Influence = 'None';

SELECT Social_Media_Influence, COUNT(*) AS cnt
FROM ecommerce_data
GROUP BY Social_Media_Influence;

CREATE VIEW rfm_base AS
SELECT
    Customer_ID,
    DATEDIFF('2024-12-30', Purchase_Date)                        AS recency_days,
    Frequency_of_Purchase                                         AS frequency,
    ROUND(Purchase_Amount_Clean * Frequency_of_Purchase, 2)      AS monetary
FROM ecommerce_data;

CREATE VIEW rfm_scored AS
SELECT *,
    NTILE(4) OVER (ORDER BY recency_days DESC)  AS r_score,
    NTILE(4) OVER (ORDER BY frequency)           AS f_score,
    NTILE(4) OVER (ORDER BY monetary)            AS m_score
FROM rfm_base;

CREATE VIEW rfm_segments AS
SELECT *,
    CONCAT(r_score, f_score, m_score) AS rfm_code,
    CASE
        WHEN r_score = 4 AND f_score >= 3           THEN 'Champions'
        WHEN r_score >= 3 AND f_score >= 3          THEN 'Loyal Customers'
        WHEN r_score >= 3 AND f_score <= 2          THEN 'Potential Loyalist'
        WHEN r_score = 2 AND f_score >= 3           THEN 'At Risk'
        WHEN r_score <= 2 AND f_score <= 2          THEN 'Lost'
        ELSE                                             'Needs Attention'
    END AS rfm_segment
FROM rfm_scored;

SELECT
    rfm_segment,
    COUNT(*)                     AS customer_count,
    ROUND(AVG(monetary), 2)      AS avg_monetary,
    ROUND(AVG(frequency), 1)     AS avg_frequency,
    ROUND(AVG(recency_days), 0)  AS avg_recency_days,
    ROUND(SUM(monetary), 2)      AS total_value
FROM rfm_segments
GROUP BY rfm_segment
ORDER BY total_value DESC;

SELECT 
    Discount_Used,
    COUNT(*) AS total_orders,
    ROUND(AVG(Purchase_Amount_Clean), 2) AS avg_order_value,
    ROUND(SUM(Purchase_Amount_Clean), 2) AS total_revenue
FROM ecommerce_data
GROUP BY Discount_Used;

SELECT 
    Discount_Used,
    Discount_Sensitivity,
    COUNT(*) AS customers,
    ROUND(AVG(Purchase_Amount_Clean), 2) AS avg_spending
FROM ecommerce_data
GROUP BY Discount_Used, Discount_Sensitivity
ORDER BY avg_spending DESC;

SELECT 
    Purchase_Category,
    COUNT(*) AS total_orders,
    ROUND(SUM(Purchase_Amount_Clean), 2) AS total_revenue,
    ROUND(AVG(Purchase_Amount_Clean), 2) AS avg_order_value
FROM ecommerce_data
GROUP BY Purchase_Category
ORDER BY total_revenue DESC;

SELECT 
    Purchase_Category,
    Discount_Used,
    ROUND(AVG(Purchase_Amount_Clean),2) AS avg_spending,
    COUNT(*) AS orders
FROM ecommerce_data
GROUP BY Purchase_Category, Discount_Used;

CREATE VIEW churn_base AS
SELECT
    Customer_ID,
    
    DATEDIFF('2024-12-31', Purchase_Date) AS recency_days,
    
    Frequency_of_Purchase,
    Customer_Satisfaction,
    
    CASE 
        WHEN Engagement_with_Ads = 'High' THEN 3
        WHEN Engagement_with_Ads = 'Medium' THEN 2
        WHEN Engagement_with_Ads = 'Low' THEN 1
        ELSE 0
    END AS engagement_score

FROM ecommerce_data;

CREATE OR REPLACE VIEW churn_scored AS 
SELECT *, 
       NTILE(5) OVER (ORDER BY recency_days DESC)     AS recency_score,   -- كل ما زاد = خطر
       NTILE(5) OVER (ORDER BY Frequency_of_Purchase) AS frequency_score, -- قليل = خطر
       NTILE(5) OVER (ORDER BY Customer_Satisfaction) AS satisfaction_score 
FROM churn_base;

CREATE VIEW churn_final AS
SELECT *,
    
    (recency_score * 0.4 +
     (6 - frequency_score) * 0.2 +
     (6 - satisfaction_score) * 0.2 +
     (3 - engagement_score) * 0.2) AS churn_risk_score

FROM churn_scored;

SELECT
    Customer_ID,
    churn_risk_score,
    
    CASE 
        WHEN churn_risk_score >= 3.5 THEN 'High Risk'
        WHEN churn_risk_score >= 2.5 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS churn_segment

FROM churn_final;

SELECT
    Customer_ID,
    churn_risk_score,
    
    CASE 
        WHEN churn_risk_score >= 3.5 THEN 'High Risk'
        WHEN churn_risk_score >= 2.5 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS churn_segment

FROM churn_final;

CREATE OR REPLACE VIEW churn_final AS
SELECT *, 
       CASE 
           WHEN (recency_score + frequency_score + satisfaction_score) >= 11 THEN 'At Risk'
           WHEN (recency_score + frequency_score + satisfaction_score) >= 7  THEN 'Potential'
           ELSE 'Loyal'
       END AS churn_segment
FROM churn_scored;

CREATE OR REPLACE VIEW churn_final AS
SELECT *, 
       CASE 
           WHEN (recency_score + frequency_score + satisfaction_score) >= 11 THEN 'At Risk'
           WHEN (recency_score + frequency_score + satisfaction_score) >= 7  THEN 'Potential'
           ELSE 'Loyal'
       END AS churn_segment
FROM churn_scored;

CREATE OR REPLACE VIEW churn_final AS
SELECT *, 
       CASE 
           WHEN (recency_score + frequency_score + satisfaction_score) >= 11 THEN 'At Risk'
           WHEN (recency_score + frequency_score + satisfaction_score) >= 7  THEN 'Potential'
           ELSE 'Loyal'
       END AS churn_segment
FROM churn_scored;

SELECT 
    churn_segment, 
    COUNT(*) AS customers,
    ROUND(SUM(Purchase_Amount_Clean), 2) AS total_revenue
FROM churn_final c
JOIN ecommerce_data e USING (Customer_ID)
GROUP BY churn_segment
ORDER BY total_revenue DESC;

create OR REPLACE VIEW churn_final AS
SELECT *, 
 
       (recency_score + frequency_score + satisfaction_score) AS churn_risk_score,
       
       CASE 
           WHEN (recency_score + frequency_score + satisfaction_score) >= 12 THEN 'High Risk'
           WHEN (recency_score + frequency_score + satisfaction_score) >= 8  THEN 'Medium Risk'
           ELSE 'Low Risk'
       END AS churn_segment
FROM churn_scored;

SELECT 
     c.Customer_ID, 
     c.churn_segment, 
     c.churn_risk_score, 
     e.Purchase_Amount_Clean, 
     e.Frequency_of_Purchase, 
     ROUND(e.Purchase_Amount_Clean * e.Frequency_of_Purchase, 2) AS estimated_clv, 
     e.Purchase_Category, 
     e.Customer_Satisfaction 
FROM churn_final c 
JOIN ecommerce_data e USING (Customer_ID) 
WHERE c.churn_segment = 'High Risk' 
ORDER BY estimated_clv DESC 
LIMIT 20;

SELECT
    r.rfm_segment,
    c.churn_segment,
    COUNT(*)                                    AS customers,
    ROUND(AVG(e.Purchase_Amount_Clean * e.Frequency_of_Purchase), 2) AS avg_clv
FROM rfm_segments r
JOIN churn_final c USING (Customer_ID)
JOIN ecommerce_data e USING (Customer_ID)
GROUP BY r.rfm_segment, c.churn_segment
ORDER BY r.rfm_segment, c.churn_segment;

SHOW FULL TABLES 
WHERE Table_type = 'VIEW';