SELECT 
	id,
	time_received,
	"time",
	value::json->'spo_num' as spo_num,
	value::json->'idx' as index,
	value::json->'type' as type,
	value::json->'direct' as direct,
	value::json->'cnt_pipes' as pipe_num,
	value::json->'cnt_sub' as sub_num,
	value::json->'len_cmn' as len_total,
	value::json->'len_pipe' as len_pipe,
	value::json->'len_sub' as len_sub,
	value::json->'speed_avg' as speed_avg,
	value::json->'weight' as weight,
	value::json->'coef' as coef
	FROM public.data
WHERE
	device_uid = '0035003b3438511438333630'
	and code = 32
    and time_received > '2022-09-09'
ORDER BY time_received desc