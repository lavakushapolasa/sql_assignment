SELECT 
    Routes.Vehicle_id,
    Orders.Product_Name,
    SUM(Orders.Quantity) AS Total_Quantity
FROM 
    Routes
JOIN 
    Vehicles ON Routes.Vehicle_id = Vehicles.Vehicle_id
JOIN 
    Customers ON Routes.Route_id = Customers.Route_id
JOIN 
    Orders ON Customers.Customer_id = Orders.Customer_id
WHERE 
    Orders.Order_status = 'confirmed'
    AND Orders.Delivery_date BETWEEN 'start_date' AND 'end_date'
GROUP BY 
    Routes.Vehicle_id, Orders.Product_Name
ORDER BY 
    Routes.Vehicle_id, Orders.Product_Name;
    