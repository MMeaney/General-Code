USE [EPACentral_Aquarius]

SELECT * FROM RiverStation STA
WHERE	STA.EdenNationalCode IN
(
'RS18A020590',
'RS18B060090',
'RS18B060210',
'RS18C020210',
'RS18C020320',
'RS18D010590',
'RS18E220740',
'RS18E220970',
'RS18F050140',
'RS18F050320',
'RS19G010260',
'RS19G010310',
'RS20T290990'
)

--DELETE FROM MonitoredLocation
--WHERE fkRiverStation_ID IN
--(
--32433
--,32429
--,32430
--,32431
--,32432
--,32434
--,32426
--,32427
--,32425
--,32428
--,32435
--,32436
--,32437
--)


--DELETE FROM RiverStation WHERE Station_ID IN
--(
--32433
--,32429
--,32430
--,32431
--,32432
--,32434
--,32426
--,32427
--,32425
--,32428
--,32435
--,32436
--,32437
--)