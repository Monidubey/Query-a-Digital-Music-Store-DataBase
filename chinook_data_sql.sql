SELECT Count(name) 
FROM   track 
WHERE  composer = 'U2'; 

SELECT Max(total) 
FROM   invoice 
WHERE  billingcountry = 'Spain'; 

SELECT title 
FROM   employee 
WHERE  lastname = 'Johnson'; 

SELECT billingcountry, 
       Count(billingcountry) AS invoices 
FROM   invoice 
GROUP  BY 1 
ORDER  BY 2 DESC; 

SELECT billingcity, 
       Sum(total) AS invoice_sum 
FROM   invoice 
GROUP  BY 1 
ORDER  BY 2 DESC 
LIMIT  1; 

SELECT i.customerid, 
       c.firstname, 
       c.lastname, 
       Sum(Il.unitprice) 
FROM   invoice i 
       JOIN invoiceline Il 
         ON i.invoiceid = Il.invoiceid 
       JOIN customer c 
         ON c.customerid = i.customerid 
GROUP  BY 1 
ORDER  BY 4 DESC 
LIMIT  1; 

SELECT DISTINCT c.email, 
                c.firstname, 
                c.lastname, 
                g.name 
FROM   customer c 
       JOIN invoice i 
         ON c.customerid = i.customerid 
       JOIN invoiceline il 
         ON i.invoiceid = il.invoiceid 
       JOIN track t 
         ON il.trackid = t.trackid 
       JOIN genre g 
         ON g.genreid = t.genreid 
WHERE  g.name = 'Rock' 
ORDER  BY 1; 

SELECT al.artistid, 
       a.name, 
       Count(al.title) AS song 
FROM   album al 
       JOIN artist a 
         ON a.artistid = al.artistid 
       JOIN track t 
         ON al.albumid = t.albumid 
       JOIN genre g 
         ON g.genreid = t.genreid 
WHERE  g.name = 'Rock' 
GROUP  BY 1 
ORDER  BY 3 DESC 
LIMIT  10; 

SELECT a.name, 
       Count(il.trackid) * il.unitprice AS Amountspent 
FROM   artist a 
       JOIN album al 
         ON a.artistid = al.artistid 
       JOIN track t 
         ON al.albumid = t.albumid 
       JOIN genre g 
         ON g.genreid = t.genreid 
       JOIN invoiceline il 
         ON t.trackid = il.trackid 
       JOIN invoice i 
         ON i.invoiceid = il.invoiceid 
GROUP  BY 1 
ORDER  BY 2 DESC 
LIMIT  2; 