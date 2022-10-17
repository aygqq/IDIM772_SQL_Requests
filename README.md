# Запросы к базе ИДИМ772

## Список SQL запросов
| Файл запроса | Описание |
| --- | --- |
| all_data.sql | Все данные всех типов |
|all_events.sql|Все данные типа событий|
|all_telemetry.sql|Все даные типа телеметрии|
|drill_often.sql|Оперативные данные (длина, скорость, состояние)|
|measures.sql|Измерения (данные по трубам)|
|min_max_time.sql|Не адаптирован под этот проект|
|net_statistics.sql|Статистика передачи пакетов на сервер|
|statistics.sql|Статистика внутри программы Go|

## Как использовать
Каждый запрос содержит фильтр:
```
where
	device_uid = '002300433438511538333630'
    and time_received > '2022-10-02'
```
Для выполнения запроса нужно задать UID устройства из таблицы ниже и дату
| UID устройства | IP-адрес устройства | Комментарий |
| --- | --- | --- |
|0035003b3438511438333630 | 10.66.66.51|стенд|
|003e00483438511438333630 | 10.66.66.53||
|003c00363438510138333630 | 10.66.66.57||
|002300433438511538333630 | 10.66.66.58||
|0035003b3338510739303435 | 10.66.66.59||
|001b00293338510739303435 | 10.66.66.60||