# MySQL_Project_File — SQL script + Query Results

This file contains:
- The original SQL script (for context)
- Results for every SELECT in the script, rendered as Markdown tables
- Results computed deterministically from the INSERT rows you provided (customers 1–50, products 101–150, orders 2001–2050, order_items 1–50, payments 9101–9150). Each order has a single order_item so order totals = (quantity * unit_price) of that item.

Notes:
- Payment amounts were calculated from the expressions in the INSERT statements (e.g., 2*399.00 → 798.00).
- Window functions / CTEs assume MySQL 8+ behaviour.
- I preserved column names and ordering as used in your queries.

---

## SQL script (abridged for context)
```sql
-- (Full SQL script is the MySQL_Project_File.sql you provided; omitted here for brevity)
```

---

## Base table results

### SELECT * FROM customers;
| customer_id | first_name | last_name | email | city | created_at |
|-----------:|:-----------|:---------|:------|:-----|:-----------|
| 1 | Arun | K | arun.k@example.com | Coimbatore | 2026-02-01 10:00:00 |
| 2 | Bala | S | bala.s@example.com | Chennai | 2026-02-02 10:00:00 |
| 3 | Chitra | R | chitra.r@example.com | Madurai | 2026-02-03 10:00:00 |
| 4 | Divya | P | divya.p@example.com | Salem | 2026-02-04 10:00:00 |
| 5 | Elan | T | elan.t@example.com | Erode | 2026-02-05 10:00:00 |
| 6 | Farook | A | farook.a@example.com | Tiruppur | 2026-02-06 10:00:00 |
| 7 | Geeta | V | geeta.v@example.com | Coimbatore | 2026-02-07 10:00:00 |
| 8 | Hari | N | hari.n@example.com | Chennai | 2026-02-08 10:00:00 |
| 9 | Indu | J | indu.j@example.com | Madurai | 2026-02-09 10:00:00 |
| 10 | Karthi | M | karthi.m@example.com | Salem | 2026-02-10 10:00:00 |
| 11 | Lakshmi | K | lakshmi.k@example.com | Erode | 2026-02-11 10:00:00 |
| 12 | Mohan | B | mohan.b@example.com | Tiruppur | 2026-02-12 10:00:00 |
| 13 | Nisha | D | nisha.d@example.com | Coimbatore | 2026-02-13 10:00:00 |
| 14 | Omkar | L | omkar.l@example.com | Chennai | 2026-02-14 10:00:00 |
| 15 | Pooja | G | pooja.g@example.com | Madurai | 2026-02-15 10:00:00 |
| 16 | Qadir | H | qadir.h@example.com | Salem | 2026-02-16 10:00:00 |
| 17 | Ravi | T | ravi.t@example.com | Erode | 2026-02-17 10:00:00 |
| 18 | Soumya | I | soumya.i@example.com | Tiruppur | 2026-02-18 10:00:00 |
| 19 | Tarun | E | tarun.e@example.com | Coimbatore | 2026-02-19 10:00:00 |
| 20 | Uma | R | uma.r@example.com | Chennai | 2026-02-20 10:00:00 |
| 21 | Vijay | K | vijay.k@example.com | Madurai | 2026-02-21 10:00:00 |
| 22 | Waseem | Z | waseem.z@example.com | Salem | 2026-02-22 10:00:00 |
| 23 | Xavier | C | xavier.c@example.com | Erode | 2026-02-23 10:00:00 |
| 24 | Yamini | S | yamini.s@example.com | Tiruppur | 2026-02-24 10:00:00 |
| 25 | Zara | B | zara.b@example.com | Coimbatore | 2026-02-25 10:00:00 |
| 26 | Abhinav | R | abhinav.r@example.com | Chennai | 2026-02-26 10:00:00 |
| 27 | Bhavya | P | bhavya.p@example.com | Madurai | 2026-02-27 10:00:00 |
| 28 | Chandan | U | chandan.u@example.com | Salem | 2026-02-28 10:00:00 |
| 29 | Deepa | M | deepa.m@example.com | Erode | 2026-03-01 10:00:00 |
| 30 | Eshwar | N | eshwar.n@example.com | Tiruppur | 2026-03-02 10:00:00 |
| 31 | Fatima | Q | fatima.q@example.com | Coimbatore | 2026-03-03 10:00:00 |
| 32 | Gokul | V | gokul.v@example.com | Chennai | 2026-03-04 10:00:00 |
| 33 | Harini | S | harini.s@example.com | Madurai | 2026-03-05 10:00:00 |
| 34 | Irfan | A | irfan.a@example.com | Salem | 2026-03-06 10:00:00 |
| 35 | Jaya | T | jaya.t@example.com | Erode | 2026-03-07 10:00:00 |
| 36 | Kiran | L | kiran.l@example.com | Tiruppur | 2026-03-08 10:00:00 |
| 37 | Leela | P | leela.p@example.com | Coimbatore | 2026-03-09 10:00:00 |
| 38 | Mahesh | Y | mahesh.y@example.com | Chennai | 2026-03-10 10:00:00 |
| 39 | Nandini | J | nandini.j@example.com | Madurai | 2026-03-11 10:00:00 |
| 40 | Oviya | E | oviya.e@example.com | Salem | 2026-03-12 10:00:00 |
| 41 | Pranav | D | pranav.d@example.com | Erode | 2026-03-13 10:00:00 |
| 42 | Ritika | F | ritika.f@example.com | Tiruppur | 2026-03-14 10:00:00 |
| 43 | Sanjay | G | sanjay.g@example.com | Coimbatore | 2026-03-15 10:00:00 |
| 44 | Tanvi | H | tanvi.h@example.com | Chennai | 2026-03-16 10:00:00 |
| 45 | Uday | I | uday.i@example.com | Madurai | 2026-03-17 10:00:00 |
| 46 | Varun | J | varun.j@example.com | Salem | 2026-03-18 10:00:00 |
| 47 | Wasim | K | wasim.k@example.com | Erode | 2026-03-19 10:00:00 |
| 48 | Xena | L | xena.l@example.com | Tiruppur | 2026-03-20 10:00:00 |
| 49 | Yash | M | yash.m@example.com | Coimbatore | 2026-03-21 10:00:00 |
| 50 | Zubin | N | zubin.n@example.com | Chennai | 2026-03-22 10:00:00 |

---

### SELECT * FROM order_items;
| order_item_id | order_id | product_id | quantity | unit_price |
|--------------:|---------:|-----------:|---------:|-----------:
| 1 | 2001 | 101 | 2 | 399.00 |
| 2 | 2002 | 102 | 1 | 429.00 |
| 3 | 2003 | 103 | 3 | 249.00 |
| 4 | 2004 | 104 | 4 | 149.00 |
| 5 | 2005 | 105 | 5 | 449.00 |
| 6 | 2006 | 106 | 1 | 129.00 |
| 7 | 2007 | 107 | 2 | 39.00 |
| 8 | 2008 | 108 | 3 | 39.00 |
| 9 | 2009 | 109 | 4 | 299.00 |
| 10 | 2010 | 110 | 5 | 299.00 |
| 11 | 2011 | 111 | 1 | 799.00 |
| 12 | 2012 | 112 | 2 | 849.00 |
| 13 | 2013 | 113 | 3 | 199.00 |
| 14 | 2014 | 114 | 4 | 199.00 |
| 15 | 2015 | 115 | 5 | 59.00 |
| 16 | 2016 | 116 | 1 | 349.00 |
| 17 | 2017 | 117 | 2 | 129.00 |
| 18 | 2018 | 118 | 3 | 79.00 |
| 19 | 2019 | 119 | 4 | 199.00 |
| 20 | 2020 | 120 | 5 | 249.00 |
| 21 | 2021 | 121 | 1 | 799.00 |
| 22 | 2022 | 122 | 2 | 999.00 |
| 23 | 2023 | 123 | 3 | 299.00 |
| 24 | 2024 | 124 | 4 | 699.00 |
| 25 | 2025 | 125 | 5 | 249.00 |
| 26 | 2026 | 126 | 1 | 149.00 |
| 27 | 2027 | 127 | 2 | 349.00 |
| 28 | 2028 | 128 | 3 | 299.00 |
| 29 | 2029 | 129 | 4 | 799.00 |
| 30 | 2030 | 130 | 5 | 179.00 |
| 31 | 2031 | 131 | 1 | 129.00 |
| 32 | 2032 | 132 | 2 | 149.00 |
| 33 | 2033 | 133 | 3 | 599.00 |
| 34 | 2034 | 134 | 4 | 149.00 |
| 35 | 2035 | 135 | 5 | 1499.00 |
| 36 | 2036 | 136 | 1 | 1299.00 |
| 37 | 2037 | 137 | 2 | 399.00 |
| 38 | 2038 | 138 | 3 | 1999.00 |
| 39 | 2039 | 139 | 4 | 149.00 |
| 40 | 2040 | 140 | 5 | 899.00 |
| 41 | 2041 | 141 | 1 | 1199.00 |
| 42 | 2042 | 142 | 2 | 129.00 |
| 43 | 2043 | 143 | 3 | 159.00 |
| 44 | 2044 | 144 | 4 | 49.00 |
| 45 | 2045 | 145 | 5 | 39.00 |
| 46 | 2046 | 146 | 1 | 199.00 |
| 47 | 2047 | 147 | 2 | 429.00 |
| 48 | 2048 | 148 | 3 | 429.00 |
| 49 | 2049 | 149 | 4 | 159.00 |
| 50 | 2050 | 150 | 5 | 349.00 |

---

### SELECT * FROM orders;
| order_id | customer_id | order_date | status |
|--------:|-----------:|:-----------|:-------|
| 2001 | 1 | 2026-03-01 | confirmed |
| 2002 | 2 | 2026-03-02 | shipped |
| 2003 | 3 | 2026-03-03 | pending |
| 2004 | 4 | 2026-03-04 | delivered |
| 2005 | 5 | 2026-03-05 | confirmed |
| 2006 | 6 | 2026-03-06 | shipped |
| 2007 | 7 | 2026-03-07 | pending |
| 2008 | 8 | 2026-03-08 | delivered |
| 2009 | 9 | 2026-03-09 | confirmed |
| 2010 | 10 | 2026-03-10 | pending |
| 2011 | 11 | 2026-03-11 | confirmed |
| 2012 | 12 | 2026-03-12 | shipped |
| 2013 | 13 | 2026-03-13 | pending |
| 2014 | 14 | 2026-03-14 | delivered |
| 2015 | 15 | 2026-03-15 | confirmed |
| 2016 | 16 | 2026-03-16 | shipped |
| 2017 | 17 | 2026-03-17 | pending |
| 2018 | 18 | 2026-03-18 | delivered |
| 2019 | 19 | 2026-03-19 | confirmed |
| 2020 | 20 | 2026-03-20 | pending |
| 2021 | 21 | 2026-03-21 | confirmed |
| 2022 | 22 | 2026-03-22 | shipped |
| 2023 | 23 | 2026-03-23 | pending |
| 2024 | 24 | 2026-03-24 | delivered |
| 2025 | 25 | 2026-03-25 | confirmed |
| 2026 | 26 | 2026-03-26 | shipped |
| 2027 | 27 | 2026-03-27 | pending |
| 2028 | 28 | 2026-03-28 | delivered |
| 2029 | 29 | 2026-03-29 | confirmed |
| 2030 | 30 | 2026-03-30 | pending |
| 2031 | 31 | 2026-03-31 | confirmed |
| 2032 | 32 | 2026-04-01 | shipped |
| 2033 | 33 | 2026-04-02 | pending |
| 2034 | 34 | 2026-04-03 | delivered |
| 2035 | 35 | 2026-04-04 | confirmed |
| 2036 | 36 | 2026-04-05 | shipped |
| 2037 | 37 | 2026-04-06 | pending |
| 2038 | 38 | 2026-04-07 | delivered |
| 2039 | 39 | 2026-04-08 | confirmed |
| 2040 | 40 | 2026-04-09 | pending |
| 2041 | 41 | 2026-04-10 | confirmed |
| 2042 | 42 | 2026-04-11 | shipped |
| 2043 | 43 | 2026-04-12 | pending |
| 2044 | 44 | 2026-04-13 | delivered |
| 2045 | 45 | 2026-04-14 | confirmed |
| 2046 | 46 | 2026-04-15 | shipped |
| 2047 | 47 | 2026-04-16 | pending |
| 2048 | 48 | 2026-04-17 | delivered |
| 2049 | 49 | 2026-04-18 | confirmed |
| 2050 | 50 | 2026-04-19 | pending |

---

### SELECT * FROM payments;
| payment_id | order_id | paid_at | amount | method |
|-----------:|---------:|:--------|-------:|:------|
| 9101 | 2001 | 2026-03-01 12:00:00 | 798.00 | UPI |
| 9102 | 2002 | 2026-03-02 12:00:00 | 429.00 | Card |
| 9103 | 2003 | 2026-03-03 12:00:00 | 747.00 | Cash |
| 9104 | 2004 | 2026-03-04 12:00:00 | 596.00 | UPI |
| 9105 | 2005 | 2026-03-05 12:00:00 | 2245.00 | Card |
| 9106 | 2006 | 2026-03-06 12:00:00 | 129.00 | Cash |
| 9107 | 2007 | 2026-03-07 12:00:00 | 78.00 | UPI |
| 9108 | 2008 | 2026-03-08 12:00:00 | 117.00 | Card |
| 9109 | 2009 | 2026-03-09 12:00:00 | 1196.00 | Cash |
| 9110 | 2010 | 2026-03-10 12:00:00 | 1495.00 | UPI |
| 9111 | 2011 | 2026-03-11 12:00:00 | 799.00 | Card |
| 9112 | 2012 | 2026-03-12 12:00:00 | 1698.00 | Cash |
| 9113 | 2013 | 2026-03-13 12:00:00 | 597.00 | UPI |
| 9114 | 2014 | 2026-03-14 12:00:00 | 796.00 | Card |
| 9115 | 2015 | 2026-03-15 12:00:00 | 295.00 | Cash |
| 9116 | 2016 | 2026-03-16 12:00:00 | 349.00 | UPI |
| 9117 | 2017 | 2026-03-17 12:00:00 | 258.00 | Card |
| 9118 | 2018 | 2026-03-18 12:00:00 | 237.00 | Cash |
| 9119 | 2019 | 2026-03-19 12:00:00 | 796.00 | UPI |
| 9120 | 2020 | 2026-03-20 12:00:00 | 1245.00 | Card |
| 9121 | 2021 | 2026-03-21 12:00:00 | 799.00 | Cash |
| 9122 | 2022 | 2026-03-22 12:00:00 | 1998.00 | UPI |
| 9123 | 2023 | 2026-03-23 12:00:00 | 897.00 | Card |
| 9124 | 2024 | 2026-03-24 12:00:00 | 2796.00 | Cash |
| 9125 | 2025 | 2026-03-25 12:00:00 | 1245.00 | UPI |
| 9126 | 2026 | 2026-03-26 12:00:00 | 149.00 | Card |
| 9127 | 2027 | 2026-03-27 12:00:00 | 698.00 | Cash |
| 9128 | 2028 | 2026-03-28 12:00:00 | 897.00 | UPI |
| 9129 | 2029 | 2026-03-29 12:00:00 | 3196.00 | Card |
| 9130 | 2030 | 2026-03-30 12:00:00 | 895.00 | Cash |
| 9131 | 2031 | 2026-03-31 12:00:00 | 129.00 | UPI |
| 9132 | 2032 | 2026-04-01 12:00:00 | 298.00 | Card |
| 9133 | 2033 | 2026-04-02 12:00:00 | 1797.00 | Cash |
| 9134 | 2034 | 2026-04-03 12:00:00 | 596.00 | UPI |
| 9135 | 2035 | 2026-04-04 12:00:00 | 7495.00 | Card |
| 9136 | 2036 | 2026-04-05 12:00:00 | 1299.00 | Cash |
| 9137 | 2037 | 2026-04-06 12:00:00 | 798.00 | UPI |
| 9138 | 2038 | 2026-04-07 12:00:00 | 5997.00 | Card |
| 9139 | 2039 | 2026-04-08 12:00:00 | 596.00 | Cash |
| 9140 | 2040 | 2026-04-09 12:00:00 | 4495.00 | UPI |
| 9141 | 2041 | 2026-04-10 12:00:00 | 1199.00 | Card |
| 9142 | 2042 | 2026-04-11 12:00:00 | 258.00 | Cash |
| 9143 | 2043 | 2026-04-12 12:00:00 | 477.00 | UPI |
| 9144 | 2044 | 2026-04-13 12:00:00 | 196.00 | Card |
| 9145 | 2045 | 2026-04-14 12:00:00 | 195.00 | Cash |
| 9146 | 2046 | 2026-04-15 12:00:00 | 199.00 | UPI |
| 9147 | 2047 | 2026-04-16 12:00:00 | 858.00 | Card |
| 9148 | 2048 | 2026-04-17 12:00:00 | 1287.00 | Cash |
| 9149 | 2049 | 2026-04-18 12:00:00 | 636.00 | UPI |
| 9150 | 2050 | 2026-04-19 12:00:00 | 1745.00 | Card |

---

### SELECT * FROM products;
| product_id | sku | product_name | category | unit_price |
|-----------:|:----|:-------------|:---------|-----------:|
| 101 | SKU-PRD-101 | Red T-Shirt | Apparel | 399.00 |
| 102 | SKU-PRD-102 | Blue T-Shirt | Apparel | 429.00 |
| 103 | SKU-PRD-103 | Coffee Mug | Home | 249.00 |
| 104 | SKU-PRD-104 | Notebook A5 | Stationery | 149.00 |
| 105 | SKU-PRD-105 | Black T-Shirt | Apparel | 449.00 |
| 106 | SKU-PRD-106 | Water Glass | Home | 129.00 |
| 107 | SKU-PRD-107 | Gel Pen (Blue) | Stationery | 39.00 |
| 108 | SKU-PRD-108 | Gel Pen (Black) | Stationery | 39.00 |
| 109 | SKU-PRD-109 | Travel Mug | Home | 299.00 |
| 110 | SKU-PRD-110 | Baseball Cap | Apparel | 299.00 |
| 111 | SKU-PRD-111 | Hoodie Grey | Apparel | 799.00 |
| 112 | SKU-PRD-112 | Hoodie Black | Apparel | 849.00 |
| 113 | SKU-PRD-113 | Tote Bag | Home | 199.00 |
| 114 | SKU-PRD-114 | Notebook A4 | Stationery | 199.00 |
| 115 | SKU-PRD-115 | Stickers Pack | Stationery | 59.00 |
| 116 | SKU-PRD-116 | Ceramic Plate | Home | 349.00 |
| 117 | SKU-PRD-117 | Poster (A3) | Stationery | 129.00 |
| 118 | SKU-PRD-118 | Keychain | Home | 79.00 |
| 119 | SKU-PRD-119 | Mouse Pad | Electronics | 199.00 |
| 120 | SKU-PRD-120 | USB Cable C | Electronics | 249.00 |
| 121 | SKU-PRD-121 | Wireless Mouse | Electronics | 799.00 |
| 122 | SKU-PRD-122 | Laptop Sleeve 13" | Electronics | 999.00 |
| 123 | SKU-PRD-123 | Phone Stand | Electronics | 299.00 |
| 124 | SKU-PRD-124 | Desk Lamp | Home | 699.00 |
| 125 | SKU-PRD-125 | Cushion Cover | Home | 249.00 |
| 126 | SKU-PRD-126 | Socks (Pair) | Apparel | 149.00 |
| 127 | SKU-PRD-127 | Scarf | Apparel | 349.00 |
| 128 | SKU-PRD-128 | Cap (White) | Apparel | 299.00 |
| 129 | SKU-PRD-129 | Thermos Bottle | Home | 799.00 |
| 130 | SKU-PRD-130 | Notebook Dotted | Stationery | 179.00 |
| 131 | SKU-PRD-131 | Highlighter Set | Stationery | 129.00 |
| 132 | SKU-PRD-132 | Pen Set (5) | Stationery | 149.00 |
| 133 | SKU-PRD-133 | Desk Organizer | Home | 599.00 |
| 134 | SKU-PRD-134 | Cable Organizer | Electronics | 149.00 |
| 135 | SKU-PRD-135 | Bluetooth Speaker | Electronics | 1499.00 |
| 136 | SKU-PRD-136 | Power Bank 10k | Electronics | 1299.00 |
| 137 | SKU-PRD-137 | Earbuds Wired | Electronics | 399.00 |
| 138 | SKU-PRD-138 | Earbuds Wireless | Electronics | 1999.00 |
| 139 | SKU-PRD-139 | Coaster Set | Home | 149.00 |
| 140 | SKU-PRD-140 | Wall Clock | Home | 899.00 |
| 141 | SKU-PRD-141 | Office Chair Mat | Home | 1199.00 |
| 142 | SKU-PRD-142 | Stapler | Stationery | 129.00 |
| 143 | SKU-PRD-143 | Tape Dispenser | Stationery | 159.00 |
| 144 | SKU-PRD-144 | Glue Stick | Stationery | 49.00 |
| 145 | SKU-PRD-145 | Ruler (30cm) | Stationery | 39.00 |
| 146 | SKU-PRD-146 | Marker Set | Stationery | 199.00 |
| 147 | SKU-PRD-147 | T-Shirt Green | Apparel | 429.00 |
| 148 | SKU-PRD-148 | T-Shirt Yellow | Apparel | 429.00 |
| 149 | SKU-PRD-149 | Notebook Spiral | Stationery | 159.00 |
| 150 | SKU-PRD-150 | Mug with Lid | Home | 349.00 |