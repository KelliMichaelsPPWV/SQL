
--TABLE CREATION

-- Customer Table
CREATE TABLE Customer_ppwv (
    customer_id SERIAL PRIMARY KEY,
    first_visit DATE,
    last_visit DATE DEFAULT CURRENT_DATE
);

-- Concessions Table
CREATE TABLE Concessions_ppwv (
    transaction_id SERIAL PRIMARY KEY,
    price NUMERIC(5,2),
    customer_id INTEGER REFERENCES Customer_ppwv(customer_id)
);

-- Movie Table
CREATE TABLE Movie_ppwv (
    movie_id SERIAL PRIMARY KEY,
    release_date DATE,
    rating VARCHAR(10)
);

-- Tickets Table
CREATE TABLE Ticket_ppwv(
    ticket_id SERIAL PRIMARY KEY,
    ticket_price NUMERIC(5,2),
    movie_id INTEGER REFERENCES Movie_ppwv(movie_id),
    customer_id INTEGER REFERENCES Customer_ppwv(customer_id)
);
 -- FILLING TABLES WITH DATA, I JUST ADDED ONE/TWO EXAMPLE PER TABLE

insert into Customer_ppwv (first_visit, last_visit)
values ('2023-01-01', '2023-01-01');

select * from Customer_ppwv;

insert into Concessions_ppwv (price, customer_id)
values (20,2);

select * from Concessions_ppwv ;

insert into Movie_ppwv (release_date, rating)
values ('2023-01-01', 'PG');

select * from Movie_ppwv;

insert into Ticket_ppwv (ticket_price, movie_id, customer_id)
values (15.99, 2, 2);

select * from Ticket_ppwv;
