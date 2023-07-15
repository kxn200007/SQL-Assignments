
/* Question 1 */
DROP VIEW customer_addresses;

CREATE VIEW customer_addresses AS
    SELECT 
        customers.customer_id,
        customers.email_address,
        customers.first_name,
        customers.last_name,
        a.line1 AS bill_line1,
        a.line2 AS bill_line2,
        a.city AS bill_city,
        a.state AS bill_state,
        a.zip_code AS bill_zip,
        a2.line1 AS ship_line1,
        a2.line2 AS ship_line2,
        a2.city AS ship_city,
        a2.state AS ship_state,
        a2.zip_code AS ship_zip
    FROM
        customers
            LEFT JOIN
        addresses a2 ON customers.shipping_address_id = a2.address_id
            LEFT JOIN
        addresses a ON customers.billing_address_id = a.address_id
    ORDER BY last_name , first_name;

/* Question 2 */    
SELECT 
    customer_id, last_name, first_name, bill_line1
FROM
    customer_addresses;