SELECT 
    InvoiceId,
    SUM(Quantity) as Cantidades
FROM invoice_items
WHERE InvoiceId IN 
    (SELECT 
        InvoiceID 
    FROM invoices 
    WHERE 
        BillingCountry = "Spain")
GROUP BY 
    InvoiceId;


SELECT InvoiceID 
FROM invoices 
WHERE BillingCountry = "Spain";