-- Who is the most senior employee based on job title --
select *
from employee
order by levels desc
limit 1;

-- Which country have the most invoices --
select count(*) as Total_invoices, billing_country 
from invoice
group by billing_country
order by Total_invoices desc
limit 1;

-- What are top 3 values of total invoice --
select total
from invoice
order by total desc
limit 3;

-- Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the
-- most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city 
-- name & sum of all invoice totals --

select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc
limit 1;

-- Who is the best customer? The customer who has spent the most money will be declared 
-- as the best customer.
select c.customer_id, c.first_name, c.last_name, sum(i.total) as total_amount
from customer c 
left join invoice i
on c.customer_id = i.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_amount desc
limit 1;

-- Write query to return the email, first name, last name & genre of all Rock music listners. Return you list order alphatically 
-- by email starting with A

select distinct email, first_name, last_name
from customer c
join invoice i on c.customer_id = i.customer_id	
join invoice_line l on i.invoice_id = l.invoice_id
where track_id in (
select track_id from track t
join genre g on t.genre_id = g.genre_id
where g.name like 'Rock'
) 
order by email;

-- Let's invite the artist who have written the most rock music in our dataset. Write a query that returns the --
-- Artist name and total track count of the top 10 rock bands--

select a.artist_id, count(a.artist_id) as number_of_songs
from track t
join album2 a1 on a1. album_id = t.album_id
join artist a on a.artist_id = a1.artist_id
join genre g on g.genre_id = t.genre_id
where g.name like 'Rock'
group by a.artist_id
order by number_of_songs desc
limit 10;

-- Return all the track that have a song length longer than the average song length
-- Return the name and milisecond for each track, order by the song with the longest song length listed first

select name, milliseconds
from track
where milliseconds > (
select avg(milliseconds) as avg_track_length
from track)
order by milliseconds desc;


