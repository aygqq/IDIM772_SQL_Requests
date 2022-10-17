SELECT * 
FROM ( 
SELECT
	device_uid,
	split_part(cast(time_received as text), ' ', 1) as rec_date,
	split_part(cast(time_received as text), ' ', 2) as rec_time,
	split_part(cast(time as text), ' ', 1) as fact_date,
	split_part(cast(time as text), ' ', 2) as fact_time,
    (value::json->'group')::text::int as gr,
	(value::json->'code')::text::int as code,
	(value::json->'value')::text::int as val,
-- 	value,
	(time_received - time) as delta
FROM
    public.data
where
    code = 5
	and device_uid = '0035003b3438511438333630'
    and time_received > '2022-09-09'
ORDER BY
    time desc
LIMIT 100000) as foo
WHERE
	gr = 19
-- 	and (code = 1 or code = 2 or code = 3 or code = 4) --Send, recv, unknown, err from M4
	and (code = 5 or code = 6 or code = 7 or code = 8) --COM, timer, parse, data
ORDER BY
	fact_date desc, fact_time desc, foo.code