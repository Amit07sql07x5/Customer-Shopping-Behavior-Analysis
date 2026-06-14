# Customer-Shopping-Behavior-Analysis
# 🛍️ Customer Shopping Behavior Analysis

> End-to-end Data Analytics Portfolio Project using Python, MySQL, and Power BI

![Python](https://img.shields.io/badge/Python-3.14-blue?logo=python)
![MySQL](https://img.shields.io/badge/MySQL-8.0-orange?logo=mysql)
![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 📌 Project Overview

This project performs a complete end-to-end analysis of **3,900 customer shopping records** from a retail dataset. The goal is to uncover key insights about customer segments, purchase behavior, loyalty patterns, and revenue drivers — and present them through an interactive Power BI dashboard.

---

## 🎯 Business Questions Answered

- Which product categories drive the most revenue?
- Do subscribed customers spend more than non-subscribers?
- Which season generates the highest sales?
- How do customer segments differ in spending behavior?
- What is the impact of discounts and promo codes on purchases?
- Which payment methods and shipping types are most popular?

---

## 🗂️ Project Structure

```
Customer-Shopping-Behavior-Analysis/
│
├── 📂 data/
│   ├── customer_shopping_behavior.csv        # Raw dataset
│   └── customer_shopping_cleaned.csv         # Cleaned dataset
│
├── 📂 notebooks/
│   └── Customer_data_preparation.ipynb       # Python data cleaning notebook
│
├── 📂 sql/
│   └── customer_behavior_sql_queries.sql     # 10 business SQL queries
│
├── 📂 powerbi/
│   └── customer_behavior_dashboard.pbix      # Power BI dashboard file
│
├── 📂 presentation/
│   └── Customer_Behavior_Presentation.pptx  # Final presentation slides
│
└── README.md
```

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Python (pandas, numpy)** | Data cleaning & transformation |
| **Jupyter Notebook (VS Code)** | Development environment |
| **MySQL (port 3307)** | Database storage & SQL analysis |
| **SQLAlchemy + PyMySQL** | Python-MySQL connection |
| **Power BI Desktop** | Interactive dashboard & visualization |
| **PowerPoint** | Report & stakeholder presentation |

---

## 📊 Dataset

- **Source:** Customer Shopping Trends Dataset
- **Records:** 3,900 rows
- **Features:** 18 original + 3 engineered = 21 total columns
- **Key columns:** age, gender, category, purchase_amount_usd, season, review_rating, subscription_status, loyalty_segment

---

## 🔄 Project Workflow

```
Raw CSV → Python Cleaning → MySQL Database → SQL Analysis → Power BI Dashboard → Presentation
```

### Phase 1 — Data Preparation (Python)
- Loaded raw CSV with pandas
- Renamed columns to MySQL-compatible snake_case
- Filled 37 missing values in `review_rating` with median
- Converted Yes/No columns to 1/0 for MySQL
- Engineered 3 new columns:
  - `customer_segment` — Young Adult / Adult / Middle Aged / Senior
  - `purchase_value_category` — Low / Medium / High
  - `loyalty_segment` — New / Regular / Loyal Customer

### Phase 2 — SQL Analysis (MySQL)
- Created `customer_behavior` database
- Loaded cleaned data using SQLAlchemy + PyMySQL
- Wrote 10 business queries covering:
  - Revenue by gender, category, season
  - Subscription impact on spending
  - Loyalty segment analysis
  - Discount and promo code effectiveness
  - Top products by rating and revenue

### Phase 3 — Visualization (Power BI)
- Connected Power BI to MySQL (localhost:3307)
- Built interactive dashboard with:
  - 3 KPI cards (Customers, Avg Purchase, Avg Rating)
  - Revenue by Category (bar chart)
  - Revenue by Season (column chart)
  - Subscription Status (donut chart)
  - Gender split (pie chart)
  - Slicers for interactive filtering

### Phase 4 — Report & Presentation
- 8-slide professional presentation
- Key findings and business recommendations
- Designed for stakeholder communication

---

## 📈 Key Findings

| Insight | Finding |
|---------|---------|
| 🏆 Top Category | Clothing — $104,264 (44.7% of revenue) |
| 👥 Top Gender | Male — 67.7% of total revenue |
| 🍂 Top Season | Fall — $60,018 |
| ⭐ Avg Rating | 3.75 out of 5.0 |
| 💳 Top Payment | PayPal, Credit Card, Cash (equal share) |
| 📦 Subscribers | Only 27% — huge growth opportunity |

---

## 💡 Business Recommendations

1. **Boost Clothing & Accessories** — invest in inventory and promotions for top categories
2. **Grow Subscription Base** — only 27% subscribed, introduce loyalty rewards
3. **Target Male Shoppers** — they drive 67.7% of revenue, create personalized campaigns
4. **Leverage Fall Season** — launch premium collections before peak season
5. **Improve Footwear & Outerwear** — currently underperforming at 23.5% combined
6. **Diversify Payment Options** — introduce Buy Now Pay Later options

---

## 🚀 How to Run

### 1. Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/Customer-Shopping-Behavior-Analysis.git
cd Customer-Shopping-Behavior-Analysis
```

### 2. Install Python dependencies
```bash
pip install pandas numpy sqlalchemy pymysql matplotlib
```

### 3. Run the Jupyter Notebook
```bash
# Open VS Code and run notebooks/Customer_data_preparation.ipynb
```

### 4. Set up MySQL
```sql
CREATE DATABASE customer_behavior;
```

### 5. Load data into MySQL
```python
# Update credentials in notebook and run the to_sql() cell
engine = create_engine("mysql+pymysql://root:YOUR_PASSWORD@localhost:3307/customer_behavior")
df.to_sql("customers", con=engine, if_exists="replace", index=False)
```

### 6. Open Power BI Dashboard
- Open `powerbi/customer_behavior_dashboard.pbix`
- Update data source to your MySQL credentials

---

## 👨‍💻 Author

**Amit** — Aspiring Data Analyst
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/Amit07sql07x5)
https://www.linkedin.com/in/amit-choudhary-6a299b247/

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
