select * 
from full_nollywood_movie 

--earliest upload

select title ,
	min(publishdate) date,
	view_count ,
	like_count 
from full_nollywood_movie
group by title , view_count ,like_count 
order by date
limit 1

--latest upload

select title ,
	max(publishdate) date,
	view_count ,
	like_count 
from full_nollywood_movie
group by title , view_count ,like_count 
order by date
limit 1

-- total likes per year
-- top 10 year


select 
	extract (YEAR from CAST(publishdate AS DATE)) dates,
	sum(like_count) total_like
from full_nollywood_movie 
group by extract (YEAR from CAST(publishdate AS DATE))
order by total_like desc 


select 
	extract (YEAR from CAST(publishdate AS DATE)) dates,
	sum(view_count) totol_view
from full_nollywood_movie 
group by extract (YEAR from CAST(publishdate AS DATE))
order by totol_view  desc



--movie with highest views 

select 
	title,
	max(view_count) maximum_views,
	publishdate
from full_nollywood_movie
group by title,publishdate
order by maximum_views desc
limit 1

--movie with the lowest views 

select 
	title,
	min(view_count) maximum_views,
	publishdate
from full_nollywood_movie
group by title,publishdate
order by maximum_views 
limit 1

--the first channel to upload video

select 
	channel_title,
	publishdate
from full_nollywood_movie
order by publishdate 
limit 1

-- list of the top ten channels that upload the most content.

select 	
	channel_title,
	count(channel_title) upload_count
from full_nollywood_movie
group by channel_title 
order by upload_count desc
limit 10

-- channels that upload the most content between 2012 to 2013

SELECT channel_title, COUNT(*) AS num_videos
FROM full_nollywood_movie
WHERE publishdate ::DATE BETWEEN '2012-01-01' AND '2013-12-31'
GROUP BY channel_title 
ORDER BY num_videos DESC
LIMIT 1;

-- top 10 channels that upload the most content between 2022 to 2023

SELECT channel_title, COUNT(*) AS num_videos
FROM full_nollywood_movie
WHERE publishdate ::DATE BETWEEN '2022-01-01' AND '2023-12-31'
GROUP BY channel_title 
ORDER BY num_videos desc

--total channel

select 
	count(distinct channel_title) 
from full_nollywood_movie fnm 

--is there any video with zero like
--total movies with zero like

select
	count(title)
from	
	(select 
	 publishdate,
	 title,
	 like_count
	from full_nollywood_movie
	where like_count = '0')js1

 -- same like count	
select 
 like_count,
 count(like_count) counts
from full_nollywood_movie
group by like_count
order by counts desc