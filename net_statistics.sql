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
	value::json->'value' as val_json,
	(value::json->'value')::text::int as val,
-- 	value,
	(time_received - time) as delta
FROM
    public.data
where
    code = 5
	and device_uid = '002300433438511538333630'
    and time_received > '2022-10-03'
ORDER BY
    time desc
LIMIT 100000) as foo
WHERE
	gr = 17
	and (code = 1 or code = 2) 	--Send, send err
-- 	and (code = 3 or code = 4) 	--Conn, conn err
-- 	and (code = 5) 				--Queue
ORDER BY
	fact_date desc, fact_time desc, foo.code