USE database_womensmell;

-- View for the head and totals of the Invoice
CREATE VIEW invoice_head_totals_view AS
-- HEAD --
SELECT I.invoice_id AS 'INVOICE NUMBER',
I.due_date AS 'DATE OF ISSUE',
	-- BILLED TO
CONCAT(CU.client_name, ' ', CU.client_surname) AS 'Client Name',
CA.client_address AS 'Street Address',
CA.client_city AS 'City', CA.client_country AS 'Country',
CA.client_postalcode AS 'Postal Code',
	-- COMPANY
C.company_name AS 'Company Name',
CONCAT(C.company_address, ', ', C.company_postalcode, ' ', C.company_city,', ', C.company_country) AS 'Company Address',
C.company_phone AS 'Company Phone',
C.company_email AS 'Company E-mail',
C.company_website AS 'Company Website',
	-- TERMS
DATE(DATE_ADD(I.due_date, INTERVAL 3 DAY)) AS 'TERMS',
-- INVOICE TOTAL --
I.subtotal AS SUBTOTAL,
D.discount_value AS 'DISCOUNT RATE (%)',
ROUND(I.subtotal * (D.discount_value / 100), 2) AS DISCOUNT,
I.tax_rate AS 'TAX RATE (%)',
ROUND((I.subtotal * (1 - (D.discount_value / 100))) * (I.tax_rate / 100), 2) AS TAX,
ROUND((I.subtotal - (I.subtotal * (D.discount_value / 100))) + ((I.subtotal * (1 - (D.discount_value / 100))) * (I.tax_rate / 100)), 2) AS TOTAL
FROM Orders AS O
JOIN Invoice AS I
ON O.order_id = I.order_id
LEFT JOIN Discount AS D 
ON O.discount_id = D.discount_id
LEFT JOIN Client_User AS CU
ON CU.client_id = O.client_id
LEFT JOIN Client_Address AS CA
ON CU.client_id = CA.client_id
JOIN Company AS C;

-- View for the details of the Invoice
CREATE VIEW invoice_details_view AS
SELECT I.invoice_id AS 'INVOICE NUMBER',
F.fragrance_name AS 'FRAGRANCE NAME',
P.product_price AS 'UNIT COST',
OP.quantity AS QUANTITY,
ROUND(P.product_price * OP.quantity, 2) AS AMOUNT
FROM ((((Invoice AS I
JOIN Orders AS O ON I.order_id = O.order_id)
JOIN Order_Product AS OP ON O.order_id = OP.order_id)
JOIN Product AS P ON OP.product_id = P.product_id)
JOIN Fragrance AS F ON P.fragrance_id = F.fragrance_id)
ORDER BY I.invoice_id;

/*** TEST VIEWS ***/
-- Observe views
SELECT * FROM invoice_head_totals_view;
SELECT * FROM invoice_details_view;