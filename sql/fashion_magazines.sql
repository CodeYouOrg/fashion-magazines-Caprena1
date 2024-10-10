SELECT 
    customers.customer_name AS "Customer", '$' || PRINTF('%.2f', SUM(subscriptions.price_per_month * subscriptions.subscription_length)) AS 'Total Amount Due'
FROM 
    customers
JOIN 
    subscriptions 
ON 
    customers.customer_id = subscriptions.subscription_id
LEFT JOIN 
    orders
ON 
    subscriptions.subscription_id = orders.subscription_id
WHERE 
    subscriptions.description = 'Fashion Magazine'
    AND orders.order_status = 'unpaid'
GROUP BY 
    customers.customer_name
ORDER BY
	customers.customer_name ASC;
	
	
