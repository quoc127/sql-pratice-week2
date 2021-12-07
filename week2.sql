create database FOOD_DB

create table customers(
	CUSTOMERID INT PRIMARY KEY,
	FIRSTNAME VARCHAR(50),
	LASTNAME VARCHAR(50),
	CITY VARCHAR(30),
	STATE VARCHAR(50)
)

insert into customers (CUSTOMERID, FIRSTNAME, LASTNAME, CITY, STATE) values
(10101,'John','Gray','Lynden', 'Washington'),
(10298,'Leroy','Brown','Pinetop', 'Arizona'),
(10299,'Elroy','Keller','Snoqualmie', 'Washington'),
(10315,'Lisa','Jones','Oshkosh', 'Wisconsin'),
(10325,'Ginger','Schultz','Pocatello', 'Idaho'),
(10329,'Kelly','Mendoza','Kailua', 'Hawaii'),
(10330,'Shawn','Dalton','Cannon Beach', 'Oregon'),
(10338,'Michael','Howell','Tillamook', 'Oregon'),
(10339,'Anthony','Sanchez','Winslow', 'Arizona'),
(10408,'Elroy','Cleaver','Globe', 'Arizona'),
(10410,'Mary Ann','Howell','Charleston', 'South Carolina'),
(10413,'Donald','Davids','Gila Bend', 'Arizona'),
(10419,'Linda','Sakahara','Nogales', 'Arizona'),
(10429,'Sarah','Graham','Greensboro', 'North Carolina'),
(10438,'Kevin','Smith','Durango', 'Colorado'),
(10439,'Conrad','Giles','Telluride', 'Colorado'),
(10449,'Isable','Moore','Yuma', 'Arizona');

create table items_ordered(
	CUSTOMERID INT FOREIGN KEY REFERENCES customers(CUSTOMERID),
	ORDER_DATE DATE,
	ITEM VARCHAR (20),
	QUANTITY VARCHAR(10),
	PRICE DECIMAL(6,2)
);

insert into items_ordered(CUSTOMERID, ORDER_DATE, ITEM, QUANTITY, PRICE) values
(10330,'1999-6-30','Pogo stick', 1,28.00),
(10101,'1999-6-30','Raft', 1,58.00),
(10298,'1999-6-01','Skateboard',1,33.00),
(10101,'1999-7-30','Life Vest',4,125.00),
(10299,'1999-7-06','Parachute',1,1250.00),
(10339,'1999-7-27','Umbrella',1,4.50),
(10449,'1999-8-13','Unicycle',1,180.00),
(10439,'1999-8-14','Ski Poles',2,25.50),
(10101,'1999-8-18','Rain Coat',1,18.30),
(10449,'1999-9-01','Snow Shose',1,45.00),
(10439,'1999-9-18','Tent',1,88.00),
(10298,'1999-9-19','Lentern',2,29.00),
(10410,'1999-10-28','Sleeping Bag',1,89.22),
(10438,'1999-11-01','Umbrella',1,6.75),
(10438,'1999-11-02','Pillow',1,8.50),
(10298,'1999-12-01','Helmet',1,22.00),
(10449,'1999-12-15','Bicycle',1,380.50),
(10298,'1999-12-21','Canoe',1,280.00),
(10101,'1999-12-30','Hoola Hoop',3,14.75),
(10330,'2000-1-01','Flashlight',4,28.00),
(10101,'2000-1-02','Lantern',1,16.00),
(10299,'2000-1-18','Inflatable',1,38.00),
(10438,'2000-1-18','Tent',1,79.99),
(10413,'2000-1-19','Lawbchair',4,32.00),
(10410,'2000-1-30','Unicycle',1,192.00),
(10315,'2000-2-2','Compass',1,8.00),
(10449,'2000-3-29','Flashlight',1,4.50),
(10101,'2000-4-08','Sleeping Bag',2,88.70),
(10298,'2000-4-18','Pocket Knife',1,22.38),
(10449,'2000-4-19','Canoe paddle',2,40.00),
(10298,'2000-5-01','Ear Muffs',1,12.50),
(10330,'2000-5-19','Shovel',2,88.70);

