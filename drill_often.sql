SELECT
	device_uid,
	time_received,
	"time",
-- 	value,
	value::json->'len' as length,
	value::json->'speed' as speed,
	value::json->'state' as state,
	(time_received - time) as delta
FROM
    public.data
WHERE
	device_uid = '0035003b3438511438333630'
	and code = 33
    and time_received > '2022-09-09 12:00'
--     and time_received < '2022-09-08 12:00'
ORDER BY time desc
LIMIT 100000