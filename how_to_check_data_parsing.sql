/* how i check data is parsed into the database after the job downloads */ 


select * from A2_ISO_PRICE_HEADER_RT         /* parse table for real-time market */
where iso = 'miso' and OPERATING_DATE = '2022-09-23'
order by modify_date desc

select * from A2_ISO_PRICE_HEADER_DA        /* parse table for day-ahead market */
where iso = 'miso' and OPERATING_DATE = '2022-09-23'
order by modify_date desc

SELECT * FROM A2_ISO_points               /* checking each record parsed via individual nodes collected from price_detail tables */
where NODE_ID = 500009  

SELECT * FROM A2_ISO_points              /* checking each record for a know iso and participant */ 
where ISO_AREA_ID = 5
and node_name = 'AEP'

