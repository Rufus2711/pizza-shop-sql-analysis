\# Data Dictionary (Actual Dataset)



This project uses 4 tables (CSV files).



---



\## 1) orders (from `orders.csv`)

Stores order-level information.



| Column | Description |

|--------|-------------|

| order\_id | Unique identifier for each order |

| date | Order date |

| time | Order time |



---



\## 2) order\_details (from `order\_details.csv`)

Stores line-item details for each order.



| Column | Description |

|--------|-------------|

| order\_details\_id | Unique identifier for each order line |

| order\_id | Links to `orders.order\_id` |

| pizza\_id | Links to `pizzas.pizza\_id` |

| quantity | Number of pizzas ordered in that line item |



---



\## 3) pizzas (from `pizzas.csv`)

Pizza SKU-level table containing size and price.



| Column | Description |

|--------|-------------|

| pizza\_id | Unique pizza SKU |

| pizza\_type\_id | Links to `pizza\_types.pizza\_type\_id` |

| size | Pizza size (S/M/L/XL/XXL etc.) |

| price | Price of the pizza SKU |



---



\## 4) pizza\_types (from `pizza\_types.csv`)

Pizza master table (name/category/ingredients).



| Column | Description |

|--------|-------------|

| pizza\_type\_id | Unique pizza type identifier |

| name | Pizza name |

| category | Pizza category (Classic, Supreme, Veggie, Chicken, etc.) |

| ingredients | Comma-separated ingredient list |



