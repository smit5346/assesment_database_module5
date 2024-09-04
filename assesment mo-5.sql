create schema assesment;

CREATE TABLE country ( id INT PRIMARY KEY, country_name VARCHAR(50), country_name_eng VARCHAR(50),country_code VARCHAR(3));

INSERT INTO country VALUES(1, 'Deutschland', 'Germany', 'DEU');
INSERT INTO country vALUES(2, 'Srbija', 'Serbia', 'SRB');
INSERT INTO country VALUES(3, 'Hrvatska', 'Croatia', 'HRV');
INSERT INTO country VALUES(4, 'United States of America', 'United States of America', 'USA');
INSERT INTO country VALUES(5, 'Polska', 'Poland', 'POL');
INSERT INTO country VALUES(6, 'España', 'Spain', 'ESP');
INSERT INTO country VALUES(7, 'Rossiya', 'Russia', 'RUS');

CREATE TABLE city (id INT PRIMARY KEY,city_name VARCHAR(50),lat float,longg float,country_id INT,FOREIGN KEY (country_id) REFERENCES country(id));

INSERT INTO city VALUES(1, 'Berlin', 52.520008, 13.404954, 1);
INSERT INTO city VALUES(2, 'Belgrade', 44.787197, 20.457273, 2);
INSERT INTO city VALUES(3, 'Zagreb', 45.815399, 15.966568, 3);
INSERT INTO city VALUES(4, 'New York', 40.730610, -73.935242, 4);
INSERT INTO city VALUES(5, 'Los Angeles', 34.052235, -118.243683, 4);
INSERT INTO city VALUES(6, 'Warsaw', 52.237049, 21.017532, 5);

CREATE TABLE customer ( id INT PRIMARY KEY,customer_name VARCHAR(50),city_id INT,customer_address VARCHAR(100),next_call_date DATE,ts_inserted TIMESTAMP,FOREIGN KEY (city_id) REFERENCES city(id));

INSERT INTO customer VALUES(1, 'Jewelry Store', 4, 'Long Street 120', '2020-01-21', '2020-01-09 14:01:20.000');
INSERT INTO customer VALUES(2, 'Bakery', 1, 'Kurfürstendamm 25', '2020-02-21', '2020-01-09 17:52:15.000');
INSERT INTO customer VALUES(3, 'Café', 4, 'Tauentzienstraße 44', '2020-01-21', '2020-01-10 08:02:49.000');
INSERT INTO customer VALUES(4, 'Restaurant', 3, 'Ulica lipa 15', '2020-01-21', '2020-01-10 09:20:21.000');

/*Task : 1 (join multiple tables using left join) 
List all Countries and customers related to these countries. For each country displaying its name in English, the name of the city customer is located in as well as the name of the customer.  Return even countries without related cities and customers*/

SELECT country.country_name_eng AS country_name,city.city_name,customer.customer_name FROM country LEFT JOIN city ON country.id = city.country_id LEFT JOIN  customer ON city.id = customer.city_id;

/*(join multiple tables using both left and inner join) Return the list of all countries that have pairs(exclude countries which are not referenced by any city). For such pairs return all customers. Return even pairs of not having a single customer*/
SELECT country.country_name_eng AS country_name,city.city_name,customer.customer_name FROM country INNER JOIN city ON country.id = city.country_id LEFT JOIN customer ON city.id = customer.city_id;


