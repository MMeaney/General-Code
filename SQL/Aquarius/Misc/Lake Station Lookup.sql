USE [EPACentral_Aquarius]

SELECT DISTINCT
	LST.Station_ID
	, LST.Station_Code
	, LST.StationFullCode
	, LST.Station_Name
	, LST.Lake_ID
	, LST.StationNumber
	, LST.EdenNationalCode
	, LST.SamTyp_ID
	, LAK.Lake_Name
FROM		LakeStation		LST
INNER JOIN	Lake			LAK		ON LAK.Lake_ID	= LST.Lake_ID
WHERE		LST.Station_Name		LIKE	'%Midlake%'
ORDER BY	3