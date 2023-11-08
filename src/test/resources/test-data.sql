truncate table customer;
insert into "customer"("customer_number", "customer_name", "contact_last_name", "contact_first_name", "phone", "sales_rep_employee_number", "credit_limit", "first_buy_date") values
(99, 'Australian Home', 'Paoule', 'Sart ', '40.11.2555', 1370, '21000.00', 20210) ON CONFLICT ("customer_number") DO NOTHING;
