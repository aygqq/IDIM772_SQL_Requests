-- SELECT 
-- 	order_num,
-- 	COUNT(order_num)
-- FROM (
	SELECT
	*
FROM
    public.data
where
	device_uid = '002300433438511538333630'
    and time_received > '2022-10-02'
--     and time < '2021-12-04'  
ORDER BY
    time_received desc
LIMIT 10000
-- ) as foo
-- GROUP BY order_num