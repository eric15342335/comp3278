CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
	name varchar(30)
);

CREATE TABLE card(
	card_id INT PRIMARY KEY,
	balance INT
);

CREATE TABLE owner(
	customer_id INT,
	card_id INT,
	PRIMARY KEY (customer_id, card_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (card_id) REFERENCES card(card_id)
);

CREATE TABLE station(
	station_id INT PRIMARY KEY,
	name varchar(30)
);

CREATE TABLE latest_usage(
	customer_id INT,
	card_id INT,
	station_id INT,
	latest_expense INT,
	latest_date DATE,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (card_id) REFERENCES card(card_id),
	FOREIGN KEY (station_id) REFERENCES station(station_id)
);

INSERT INTO customer VALUES 
(1, 'Alan'),
(2, 'Bob'),
(3, 'Cindy'),
(4, 'David');

INSERT INTO card VALUES
(1, -10),
(2, -4),
(3, 30),
(4, -2),
(5, -1),
(6, 10);

INSERT INTO owner VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 6),
(4, 5);

INSERT INTO station VALUES
(1, 'Wan Chai'),
(2, 'Central'),
(3, 'Admiralty');

INSERT INTO latest_usage VALUES
(1, 1, 2, 12, '2025-02-25'),
(1, 2, 2, 8, '2025-02-25'),
(2, 3, 3 ,4, '2025-02-26'),
(2, 4, 3, 6, '2025-02-24'),
(3, 6, 3, 4, '2025-02-24'),
(4, 5, 2, 12, '2025-02-24'),
(4, 5, 1, 10, '2025-02-24'),
(4, 5, 1, 12, '2025-02-24');