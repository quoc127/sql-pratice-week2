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

-- Quang Thế: câu 1 đến câu 5
select * from customers -- Hiển thị dữ liệu ở bảng customers
select * from items_ordered -- hiển thị dữ liệu ở bảng items_ordered

-- câu 1: From the items_ordered table, select a list of all items purchased for customerid 10449. Display the customerid, item, and price for this customer.
SELECT customerid, item, price FROM items_ordered 
WHERE customerid = 10449;
-- lấy 3 trường customerid, item, price từ bằng items_ordered, trường customerid nào có 10449 sẽ hiển thị ra 


--câu 2: Select all columns from the items_ordered table for whoever purchased a Tent.
SELECT * FROM items_ordered
WHERE item = 'tent';
-- truy vấn tới bảng items_ordered, ở trường item nếu có tên là 'tent' sẽ được hiển thị ra


--câu 3: Select the customerid, order_date, and item values from the items_ordered table for any items in the item column that start with the letter "S".
SELECT customerid, order_date, item
FROM items_ordered
WHERE item LIKE 'S%'
-- lấy 3 trường customerid, order_date, item từ bảng items_ordered, trường item nếu có tên bắt đầu bằng chữ 'S' đầu tiên sẽ hiển thị ra


-- câu 4: Select the distinct items in the items_ordered table. In other words, display a listing of each of the unique items from the items_ordered table.
SELECT distinct item
FROM items_ordered;
-- Hiển thị trường item có các danh mục riêng và không trùng lặp từ bảng items_ordered


-- câu 5 : Select the maximum price of any item ordered in the items_ordered table. Hint: Select the maximum price only.
SELECT MAX(price)
FROM items_ordered;
-- hiển thị giá trị cao nhất từ bảng items_ordered


--Huy: câu 6 - câu 10

--Câu 6
SELECT AVG(price) AS AveragePriceOfDecemberPerchases
--select avg(price) để chọn giá trị trung bình trong cột price
from items_ordered where ORDER_DATE LIKE '%12%'
--from chọn từ bảng items-ordered, WHERE để chỉ cột order_date có giá trị trong chuỗi là 12


-- Câu 7
SELECT COUNT(*) FROM items_ordered
--select count(*) để đếm tất cả có bao nhiêu giá trị trong bảng items_ordered


-- Câu 8
SELECT MIN(Price) FROM items_ordered Where ITEM = 'Tent'
--select min(price) sẽ chọn giá trị thấp nhất from từ bảng items_ordered có tên ITEM là Tent


-- Câu 9
SELECT COUNT(STATE) AS PEOPLE, STATE FROM customers GROUP BY STATE
-- select count(state) để liệt kê các giá trị state, chọn cột STATE từ bảng customers, group by state để tổng hợp có bao nhiêu giá trị tương đương với mỗi cột STATE


-- Câu 10
SELECT ITEM, MAX(Price) AS Highest_Price, MIN(Price) AS Lowest_Price
FROM items_ordered GROUP BY ITEM
-- select item, max(price), min(price) để truy vấn cột item, số tiền lớn nhất, số tiền nhỏ nhất từ bảng item_ordered, group by để nhóm lại tương đương với 2 cột highest_price và lowest_price

-- Quốc từ câu 11 - 21
-- câu 11
select CUSTOMERID, count(CUSTOMERID) as sumORDER from items_ordered /* hiển thị CUSTOMERID, count(CUSTOMERID) từ bảng items_ordered */
group by CUSTOMERID /* sắp xếp theo CUSTOMERID*/

-- câu 12
select  STATE, count(CUSTOMERID) as NumberCUSTOMER from customers /* hiển thị STATE, count(CUSTOMERID) từ bảng customers */
group by STATE /* sắp xếp theo STATE*/
having count(CUSTOMERID) > 1  /* lấy những giá trị có count(CUSTOMERID) > 1 */

-- câu 13
select ITEM, max(PRICE) as max, min(PRICE) as min from items_ordered /* hiển thị ITEM, max(PRICE), min(PRICE) từ bảng items_ordered */
group by ITEM /* sắp xếp theo ITEM */
having max(PRICE) > 190.00 /* lấy những giá trị có max(PRICE) > 190.00*/

-- câu 14
select CUSTOMERID, count(CUSTOMERID) as sumORDER from items_ordered /* hiển thị CUSTOMERID, count(CUSTOMERID) từ bảng items_ordered */
group by CUSTOMERID /* sắp xếp theo CUSTOMERID */
having count(CUSTOMERID) > 1 /* lấy những giá trị có count(CUSTOMERID) > 1 */

-- câu 15 
select FIRSTNAME, LASTNAME, CITY from customers /*hiển thị FIRSTNAME, LASTNAME, CITY từ bảng customers */
order by LASTNAME asc /*sắp xếp theo chiều tăng dần của LASTNAME*/

-- câu 16
select FIRSTNAME, LASTNAME, CITY from customers /*hiển thị FIRSTNAME, LASTNAME, CITY từ bảng customers */
order by LASTNAME desc /*sắp xếp theo chiều giảm dần của LASTNAME*/

select CUSTOMERID, ITEM, PRICE from items_ordered /* hiển thị trường CUSTOMERID, ITEM, PRICE từ bảng items_ordered */
where CUSTOMERID = 10449 order by PRICE asc /* điều kiện CUSTOMERID = 10449 */


-- câu 17
select ITEM, PRICE from items_ordered /*hiển thị ITEM, PRICE từ bảng items_ordered */
order by PRICE asc /*sắp xếp theo chiều tăng dần của PRICE*/

-- câu 18
SELECT customers.CUSTOMERID, items_ordered.ORDER_DATE, items_ordered.ITEM FROM customers /*hiển thị CUSTOMERID, ORDER_DATE, ITEM từ bảng customers*/
FULL OUTER JOIN items_ordered /* kết hợp với bảng items_ordered */
ON customers.CUSTOMERID = items_ordered.CUSTOMERID /* kiểm tra customers.CUSTOMERID = items_ordered.CUSTOMERID */
WHERE not items_ordered.ITEM = 'Snow Shose' or not items_ordered.ITEM = 'Ear Muffs'; /* điều kiện items_ordered.ITEM khổng phải là 'Snow Shose' hoặc 'Ear Muffs' */

-- câu 19
select ITEM, PRICE from items_ordered /* hiển thị ITEM, PRICE từ bảng items_ordered */
where ITEM like'[SPD]%' /*điều kiện ITEM bắt đầu bằng các chữ cái S, P, D */

-- câu 20
select ORDER_DATE, ITEM, PRICE from items_ordered /* hiển thị ORDER_DATE, ITEM, PRICE từ bảng items_ordered */
where PRICE between 10.00 and 80.00 /* điều kiện PRICE nằm giữa 10.00 và 80.00*/

-- câu 21
select FIRSTNAME, CITY, STATE from customers /* hiển thị FIRSTNAME, CITY, STATE từ bảng customers */
where STATE = 'Arizona' or STATE = 'Washington' or STATE = 'Oklahoma' or STATE = 'Colorado' or STATE = 'Hawaii'
/* điều kiện STATE là Arizona hoặc Washington hoặc Oklahoma hoặc Colorado hoặc Hawaii */