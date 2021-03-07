SELECT

     COUNT(pep.P_Purchase_ID) Types,
     pep.Order_Date,
     prd.Product,
     pup.Quantity,
     SUM(Quantity * Cost) Total

FROM

     People_Purchases AS pep

INNER JOIN Purchases_Products AS pup

     ON pep.P_Purchase_ID = pup.P_Purchase_ID

INNER JOIN Products AS prd

     ON prd.Product_ID = pup.Product_ID

WHERE

    prd.Cost < 50
    AND
    pup.Quantity < 5
    AND
    pep.Order_Date = 2045
     
GROUP BY

    pep.Order_Date,
    prd.Product,
    pup.Quantity

HAVING

    SUM(Quantity * Cost) < 120

ORDER BY

    pep.Order_Date,
    prd.Product;

