-- 1. Total number of users
SELECT COUNT(*) AS total_users FROM Users;

-- 2. Count of users with email provided (non-null)
SELECT COUNT(email) AS users_with_email FROM Users;

-- 3. Total number of orders
SELECT COUNT(*) AS total_orders FROM Orders;

-- 4. Total quantity ordered per product
SELECT product_id, SUM(quantity) AS total_quantity
FROM OrderDetails
GROUP BY product_id;

-- 5. Average price of all products
SELECT AVG(price) AS average_product_price
FROM Products;

-- 6. Total revenue per order (joining OrderDetails and Products)
SELECT od.order_id, SUM(p.price * od.quantity) AS total_revenue
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY od.order_id;

-- 7. Total order amount by each user
SELECT u.name, SUM(o.total_amount) AS total_spent
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
GROUP BY u.user_id;

-- 8. Average total amount per user who placed orders
SELECT user_id, AVG(total_amount) AS avg_spent
FROM Orders
GROUP BY user_id;

-- 9. Products with total quantity ordered > 1 (use HAVING)
SELECT product_id, SUM(quantity) AS total_qty
FROM OrderDetails
GROUP BY product_id
HAVING total_qty > 1;

-- 10. Number of distinct users who placed orders
SELECT COUNT(DISTINCT user_id) AS unique_ordering_users
FROM Orders;

-- 11. Round average product price to 2 decimal places
SELECT ROUND(AVG(price), 2) AS avg_price_rounded
FROM Products;

-- 12. Minimum and Maximum product price by category
SELECT category_id, MIN(price) AS min_price, MAX(price) AS max_price
FROM Products
GROUP BY category_id;