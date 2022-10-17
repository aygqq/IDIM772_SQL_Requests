SELECT * 
FROM ( 
SELECT
	device_uid,
	split_part(cast(time_received as text), ' ', 1) as rec_date,
	split_part(cast(time_received as text), ' ', 2) as rec_time,
	split_part(cast(time as text), ' ', 1) as fact_date,
	split_part(cast(time as text), ' ', 2) as fact_time,
    value::json->'group' as gr,
	value::json->'code' as code,
	value::json->'value' as val,
-- 	value,
	(time_received - time) as delta
FROM
    public.data
where
    code = 5
	and device_uid = '003900373338510c39303435'
-- 	and time > '2021-11-27' 
--     and time < '2021-11-30'  
ORDER BY
    time desc
LIMIT 100000) as foo
ORDER BY
	fact_date desc, fact_time desc