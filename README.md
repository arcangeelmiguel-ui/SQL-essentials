# SQL Essentials – 10 Challenges | Publications Database

**Praxisorientiertes SQL-Training basierend auf der `publications` Datenbank (Microsoft Pubs Sample).**
Dieses Repository dokumentiert meinen Lernfortschritt von den SQL-Grundlagen bis zu fortgeschrittenen Abfragen – strukturiert, getestet und bereit für den Einsatz im Controlling & Data Analytics.

> **Ziel:** Sauberer, lesbarer und performanter SQL-Code für den beruflichen Einsatz.

---

### 🛠 Tech Stack
- **DBMS:** MySQL / SQL Server kompatibel
- **Datenbank:** `publications`
- **Tools:** MySQL Workbench, Git

### 📚 Inhalte & Lernziele

| Challenge | Thema | Kern-Konzepte |
| :--- | :--- | :--- |
| **01** | Grundlagen | `SELECT`, `WHERE`, `ORDER BY`, `DISTINCT` |
| **02** | Filtering & Sorting | `AND`, `OR`, `ORDER BY DESC`, `LIMIT` |
| **03** | Aggregationen | `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()` |
| **04** | Pattern Matching | `LIKE`, `%`, `_`, `IN`, `BETWEEN` |
| **05** | Grouping | `GROUP BY`, `HAVING`, `ORDER BY Aggregat` |
| **06** | JOINS | `INNER JOIN`, `LEFT JOIN`, `AS` (Alias) |
| **07** | CASE | `CASE WHEN THEN ELSE END`, Kategorisierung |
| **08** | Subqueries | `Subqueries in WHERE`, `NOT IN`, korrelierte Subqueries |
| **09** | String & Date Functions | `LENGTH()`, `CONCAT()`, `UPPER()`, `DATEDIFF()`, `DATE_FORMAT()` |
| **10** | Business Cases | Revenue-Berechnung, `MAX-MIN`, Modulo `%` |

### 💡 Highlights

**Challenge 6 – JOIN Logik (entscheidend für Interviews):**
```sql
-- Alle Stores anzeigen, auch ohne Discount -> LEFT JOIN
SELECT s.stor_name, s.stor_id, d.discount
FROM stores AS s
LEFT JOIN discounts AS d ON s.stor_id = d.stor_id;

-- Nur Stores mit Discount -> INNER JOIN
SELECT s.stor_name, d.discount
FROM stores AS s
INNER JOIN discounts AS d ON s.stor_id = d.stor_id;
```

**Challenge 7 – CASE für Controlling:**
```sql
SELECT *,
  CASE
    WHEN qty >= 50 THEN 'high sales'
    WHEN qty >= 20 THEN 'medium sales'
    ELSE 'low sales'
  END AS sales_category
FROM sales;
```

### 🚀 Nutzung

```sql
USE publications;

-- Beispiel: Top 3 Stores nach Sales
SELECT stor_id, COUNT(*) AS total_sales
FROM sales
GROUP BY stor_id
ORDER BY total_sales DESC
LIMIT 3;
```

### 👤 Autor
**Miguel** – Junior Controller & Data Analyst | Dresden, Sachsen

Fokus: SQL, Excel, Controlling, Datenanalyse für die produzierende Industrie.

---
*Alle Lösungen sind eigenständig erarbeitet und im Stil `clean & readable` dokumentiert.*
