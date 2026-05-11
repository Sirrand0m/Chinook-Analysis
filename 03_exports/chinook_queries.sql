/*
This file contains the key queries used in the Chinook Database exploration project to generate outputs for the Tableau dashboard.
Initial data exploration was done using an interactive visualiser (DB Browser for SQLite).
*/


--Setup
.headers on

--Number of Customers
SELECT count(CustomerId) FROM Customer;

--Number of Invoices
SELECT count(InvoiceId) FROM Invoice;

--Total Revenue
SELECT sum(Total) AS TotalRevenue FROM Invoice;

--Check consistency with InvoiceLine
SELECT sum(UnitPrice * Quantity) AS TotalRevenue FROM InvoiceLine;

--Average Invoice Value
SELECT round(avg(Total),2) AS AverageInvoiceValue FROM Invoice;


--Revenue by Country
.mode csv
.once revenue_by_country.csv

SELECT BillingCountry, SUM(Total) AS Revenue
FROM Invoice
GROUP BY BillingCountry;


--Top 10 Customers by Total Spend
.once top_10_customers_by_spend

SELECT c.CustomerId, c.FirstName || ' ' || c.LastName AS CustomerName, sum(i.Total) AS TotalSpend
FROM Customer c LEFT JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, CustomerName
ORDER BY TotalSpend DESC
LIMIT 10;


--Revenue by Genre
.once revenue_by_genre

SELECT g.Name, round(sum(i.UnitPrice * i.Quantity),2) AS TotalRevenue
FROM InvoiceLine i
LEFT JOIN Track t ON i.TrackId = t.TrackId
LEFT JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY TotalRevenue DESC;


--Revenue by Artist
.once revenue_by_artist

SELECT ar.Name, round(sum(i.UnitPrice * i.Quantity),2) AS TotalRevenue
FROM InvoiceLine i
LEFT JOIN Track t ON i.TrackId = t.TrackId
LEFT JOIN Album al ON t.AlbumId = al.AlbumId
LEFT JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.Name
ORDER BY TotalRevenue DESC;


--Top 10 performing albums
.once top_10_albums_by_revenue

SELECT al.Title as Album, ar.Name as Artist, round(sum(i.UnitPrice * i.Quantity),2) AS TotalRevenue
FROM InvoiceLine i
LEFT JOIN Track t ON i.TrackId = t.TrackId
LEFT JOIN Album al ON t.AlbumId = al.AlbumId
LEFT JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY al.Title
ORDER BY TotalRevenue DESC
LIMIT 10;


--Top 10 performing tracks
.once top_10_tracks_by_revenue

SELECT t.Name as Track, al.Title as Album, ar.Name as Artist, round(sum(i.UnitPrice * i.Quantity),2) AS TotalRevenue
FROM InvoiceLine i
LEFT JOIN Track t ON i.TrackId = t.TrackId
LEFT JOIN Album al ON t.AlbumId = al.AlbumId
LEFT JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY t.Name
ORDER BY TotalRevenue DESC
LIMIT 10;


--Revenue by Year
.once revenue_by_year

SELECT strftime('%Y',InvoiceDate) as Year, sum(Total) as TotalRevenue
FROM Invoice
GROUP BY Year;

--Revenue by Year and Month
.once revenue_by_year_month

SELECT strftime('%Y',InvoiceDate) as Year, strftime('%m',InvoiceDate) as Month, sum(Total) as TotalRevenue
FROM Invoice
GROUP BY Year, Month;

--Revenue by Month only
.once revenue_by_month_only

SELECT strftime('%m',InvoiceDate) as Month, sum(Total) as TotalRevenue
FROM Invoice
GROUP BY Month;



-- Reset output
.output stdout