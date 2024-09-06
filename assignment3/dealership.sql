-- Table: customer_ppwv_
CREATE TABLE customer_ppwv_ (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

-- Table: sales_person_ppwv
CREATE TABLE sales_person_ppwv (
    sales_rep_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

-- Table: car_ppwv
CREATE TABLE car_ppwv (
    car_serial SERIAL PRIMARY KEY,
    make VARCHAR(100),
    model VARCHAR(100)
);

-- Table: mechanics_ppwv
CREATE TABLE mechanics_ppwv (
    mech_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

-- Table: sales_ppwv
CREATE TABLE sales_ppwv (
    sale_id SERIAL PRIMARY KEY,
    price NUMERIC(7,2),
    customer_id INTEGER REFERENCES customer_ppwv_(customer_id),
    car_serial INTEGER REFERENCES car_ppwv(car_serial),
    sales_rep_id INTEGER REFERENCES sales_person_ppwv(sales_rep_id)
);

-- Table: service_ppwv
CREATE TABLE service_ppwv (
    ticket_id SERIAL PRIMARY KEY,
    service_cost NUMERIC(7,2),
    service_date DATE DEFAULT CURRENT_DATE,
    car_serial INTEGER REFERENCES car_ppwv(car_serial),
    customer_id INTEGER REFERENCES customer_ppwv_(customer_id),
    mech_id INTEGER REFERENCES mechanics_ppwv(mech_id)
);


--Fill tables and check that they're filled
insert into customer_ppwv_ (first_name, last_name)
values('Robert', 'Whit');

insert into sales_person_ppwv (first_name, last_name)
values('Mister', 'Suspicious');

select * from sales_ppwv ;

insert into mechanics_ppwv (first_name, last_name)
values('Tom', 'Tom');


insert into car_ppwv (make, model)
values('Toyota','MEEK');


insert into sales_ppwv (price, customer_id, car_serial , sales_rep_id)
Values(10000, 2, 6, 2); 

insert into service_ppwv (service_cost, car_serial, customer_id, mech_id)
values (700, 7, 2, 2);

select * from sales_person_ppwv

select * from sales_ppwv; 

--Stored functions

--Return double the price of the car
CREATE OR REPLACE FUNCTION double_car_price(sale_id INTEGER)
RETURNS NUMERIC AS $$
DECLARE
    car_price NUMERIC(10,2);
BEGIN
    -- Retrieve car price from sales table
    SELECT s.price INTO car_price
    FROM sales_ppwv s
    WHERE s.sale_id = $1;
    
    -- Return the car price multiplied by two
    RETURN car_price * 2;
END;
$$ LANGUAGE plpgsql;

--Test function
select double_car_price(5);

--Return commission sales person earned
CREATE OR REPLACE FUNCTION commission(sale_id INTEGER)
RETURNS NUMERIC AS $$
DECLARE
    car_price NUMERIC(10,2);
BEGIN
    -- Retrieve car price from sales table
    SELECT s.price INTO car_price
    FROM sales_ppwv s
    WHERE s.sale_id = $1;
    
    -- Return commission sales person made on car sale
    RETURN car_price * 0.075;
END;
$$ LANGUAGE plpgsql;

--Test function
select commission(3)

--Return total sales per sales person (value of products sold, NOT total commission earned)
CREATE OR REPLACE FUNCTION total_sales(sales_rep_id INTEGER)
RETURNS NUMERIC AS $$
DECLARE
    total_sales_value NUMERIC(10,2);
BEGIN
    -- Calculate the total sales made by the sales representative
    SELECT SUM(s.price) INTO total_sales_value
    FROM sales_ppwv s
    WHERE s.sales_rep_id = $1;

    -- Return the total sales value
    RETURN total_sales_value;
END;
$$ LANGUAGE plpgsql;

--Test function
select total_sales(2);