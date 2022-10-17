SELECT
	device_uid,
	time_received,
	"time",
	value,
-- 	value::json->'code' as code,
-- 	value::json->'value' as param1,
-- 	value::json->'' as state,
	(time_received - time) as delta
FROM
    public.data
WHERE
-- 	device_uid = '0035003b3438511438333630'
	code = 34
--     and time_received > '2022-09-13'
--     and time_received < '2022-09-08 12:00'
ORDER BY time desc
LIMIT 10000