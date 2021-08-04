-- https://stackoverflow.com/questions/60068829/how-to-find-most-frequent-pair-in-sql


-- sample table .
/*
This table contains users' music streaming activity on a given day. I want to find out which pair of artists was the most 
frequently played one on a specific day. The answer should be (Pink Floyd, Queen) because 3 users listened to both artists on 
the same day. How can I achieve this?
*/
create table users
(
  person_id       int,
  artist_name     varchar(255),
  date_played     date
);

insert into users
  (person_id, artist_name, date_played)
values
  (1, 'Pink Floyd', '2020-10-01'),
  (1, 'Led Zeppelin', '2020-10-01'),
  (1, 'Queen', '2020-10-01'),
  (1, 'Pink Floyd', '2020-10-01'),
  (2, 'Journey', '2020-10-01'),
  (2, 'Pink Floyd', '2020-10-01'),
  (2, 'Queen', '2020-10-01'),
  (2, 'Pink Floyd', '2020-10-01'),
  (3, 'Pink Floyd', '2020-10-01'),
  (3, 'Aerosmith', '2020-10-01'),
  (3, 'Queen', '2020-10-01'),
  (4, 'Pink Floyd', '2020-10-01'),
  (4, 'Led Zeppelin', '2020-10-01');





-- we need to do a self join to get the answer
-- since my test environment doesn't allow CTE, so i use subquery below.
-- firstly, we need to remove those duplicates in the initial table so that we don't double count

select 
a1,
a2,
count(*) as cnt
from
(
  select 
         a.artist_name as a1,
         b.artist_name as a2
    from (select distinct person_id, artist_name from users) a
    join (select distinct person_id, artist_name from users) b on a.person_id = b.person_id and a.artist_name > b.artist_name
--    group by 1,2
  )
  cte
 group by 1,2
 order by cnt desc



--- similar qustion. Find the people who participated in meetings most often
-- https://stackoverflow.com/questions/66650310/sql-to-find-two-people-who-participated-in-the-most-meetings-together
-- https://dbfiddle.uk/?rdbms=sqlserver_2019&fiddle=49e1d294be2e324fde95c50c316385cb

-- count unique combinations and sort
select pe1.name as Person1,
       pe2.name as Person2,
       count(1) as SharedMeetings
from participant pa1
join participant pa2
  on  pa2.idMeeting = pa1.idMeeting
  and pa2.idPerson > pa1.idPerson
join person pe1
  on pe1.id = pa1.idPerson
join person pe2
  on pe2.id = pa2.idPerson
group by pe1.name,
         pe2.name
order by SharedMeetings desc,
         pe1.name,
         pe2.name;



