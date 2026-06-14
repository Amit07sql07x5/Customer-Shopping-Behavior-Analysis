-- ============================================================
-- Customer Shopping Behavior Analysis — SQL Queries
-- Database: customer_behavior
-- Table: customers
-- Tool: MySQL 8.0
-- ============================================================

USE customer_behavior;

-- ─────────────────────────────────────────────────────────────
-- Q1. Total Revenue by Gender
-- ─────────────────────────────────────────────────────────────
SELECT 
    gender, 
    COUNT(*) AS total_customers,
    SUM(purchase_amount_usd) AS total_revenue,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_purchase
FROM customers
GROUP BY gender
ORDER BY total_revenue DESC;

-- ─────────────────────────────────────────────────────────────
-- Q2. Customers Who Used Discount But Spent Above Average
-- ─────────────────────────────────────────────────────────────
SELECT 
    customer_id, 
    purchase_amount_usd,
    discount_applied
FROM customers
WHERE discount_applied = 'Yes' 
AND purchase_amount_usd >= (SELECT AVG(purchase_amount_usd) FROM customers)
ORDER BY purchase_amount_usd DESC;

-- ─────────────────────────────────────────────────────────────
-- Q3. Top 5 Products by Average Review Rating
-- ─────────────────────────────────────────────────────────────
SELECT 
    item_purchased, 
    ROUND(AVG(review_rating), 2) AS avg_rating,
    COUNT(*) AS total_purchases
FROM customers
GROUP BY item_purchased
ORDER BY avg_rating DESC
LIMIT 5;

-- ─────────────────────────────────────────────────────────────
-- Q4. Average Purchase — Standard vs Express Shipping
-- ─────────────────────────────────────────────────────────────
SELECT 
    shipping_type, 
    COUNT(*) AS total_orders,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_purchase
FROM customers
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type;

-- ─────────────────────────────────────────────────────────────
-- Q5. Do Subscribed Customers Spend More?
-- ─────────────────────────────────────────────────────────────
SELECT 
    subscription_status,
    COUNT(customer_id) AS total_customers,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_spend,
    ROUND(SUM(purchase_amount_usd), 2) AS total_revenue
FROM customers
GROUP BY subscription_status
ORDER BY total_revenue DESC;

-- ─────────────────────────────────────────────────────────────
-- Q6. Top 5 Products with Highest Discount Rate
-- ─────────────────────────────────────────────────────────────
SELECT 
    item_purchased,
    COUNT(*) AS total_sales,
    SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) AS discounted_sales,
    ROUND(100.0 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS discount_rate_pct
FROM customers
GROUP BY item_purchased
ORDER BY discount_rate_pct DESC
LIMIT 5;

-- ─────────────────────────────────────────────────────────────
-- Q7. Which Season Generates the Most Revenue?
-- ─────────────────────────────────────────────────────────────
SELECT 
    season,
    COUNT(*) AS total_orders,
    ROUND(SUM(purchase_amount_usd), 2) AS total_revenue,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_order_value
FROM customers
GROUP BY season
ORDER BY total_revenue DESC;

-- ─────────────────────────────────────────────────────────────
-- Q8. Most Popular Payment Method by Category
-- ─────────────────────────────────────────────────────────────
SELECT 
    category, 
    payment_method, 
    COUNT(*) AS total_transactions
FROM customers
GROUP BY category, payment_method
ORDER BY category, total_transactions DESC;

-- ─────────────────────────────────────────────────────────────
-- Q9. Repeat Buyers — Are They More Likely to Subscribe?
-- ─────────────────────────────────────────────────────────────
SELECT 
    subscription_status,
    COUNT(*) AS total_customers,
    ROUND(AVG(previous_purchases), 1) AS avg_previous_purchases,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_spend
FROM customers
WHERE previous_purchases > 5
GROUP BY subscription_status;

-- ─────────────────────────────────────────────────────────────
-- Q10. Revenue by Customer Segment and Category
-- ─────────────────────────────────────────────────────────────
SELECT 
    customer_segment, 
    category,
    COUNT(*) AS total_orders,
    ROUND(SUM(purchase_amount_usd), 2) AS total_revenue,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_order_value
FROM customers
GROUP BY customer_segment, category
ORDER BY customer_segment, total_revenue DESC;
