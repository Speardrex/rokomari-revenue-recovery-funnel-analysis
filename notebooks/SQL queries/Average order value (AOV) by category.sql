SELECT 
  category, AVG(aov) as Average_order_value 
FROM dashboard
GROUP BY category


