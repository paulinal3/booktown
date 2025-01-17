-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * 
FROM subjects
ORDER BY subjects;
-- 2. Find all subjects sorted by location
SELECT *
FROM subjects
ORDER BY location;
-- ### Where
-- 3. Find the book "Little Women"
\d books
SELECT title
FROM books
WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT *
FROM books
WHERE title LIKE '%Python%';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT *
FROM subjects
WHERE location = 'Main St'
ORDER BY subjects;

-- ### Joins
-- 6. Find all books about Computers and list ONLY the book titles
SELECT books.title
FROM books
INNER JOIN subjects
ON books.subject_id = subjects.id
WHERE subject = 'Computers';
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT books.title, authors.last_name, authors.first_name, subjects.subject
FROM books
INNER JOIN authors
ON books.author_id = authors.id
INNER JOIN subjects
ON books.subject_id = subjects.id;
-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT books.title, stock.cost
FROM books
INNER JOIN editions
ON books.id = editions.book_id
INNER JOIN stock
ON editions.isbn = stock.isbn
ORDER BY cost DESC;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT books.title, editions.isbn, publishers.name, stock.cost
FROM books
INNER JOIN editions
ON books.id = editions.book_id
INNER JOIN publishers
ON editions.publisher_id = publishers.id  
INNER JOIN stock
ON editions.isbn = stock.isbn
WHERE title = 'Dune';
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title        
FROM customers
INNER JOIN shipments
ON customers.id = shipments.customer_id
INNER JOIN editions
ON shipments.isbn = editions.isbn
INNER JOIN books
ON editions.book_id = books.id
ORDER BY ship_date;

-- ### Grouping and Counting
-- 11. Get the COUNT of all books
SELECT SUM(stock)
FROM stock;
-- 12. Get the COUNT of all Locations
SELECT COUNT(location)
FROM subjects
-- 13. Get the COUNT of each unique location in the subjects 
-- table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(location), subjects.location
FROM subjects
GROUP BY location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, books.title, COUNT(editions)
FROM editions
INNER JOIN books
ON editions.book_id = books.id
GROUP BY id;