USE [EPACentral_Aquarius]

SELECT 
	--PRM.Prm_id
	--, PRM.Prm_Code 
	PRM.Prm_Desc
	--, PRM.Prm_DetDesc
	--, PRM.Hchk_id
	, THM.Theme_Desc
	, UNT.Unit_Code
	, UNT.Unit_Name
FROM		Parameter		PRM
INNER JOIN	Theme			THM	ON THM.Theme_id = PRM.Theme_ID
INNER JOIN	UnitOfMeasure	UNT	ON UNT.Unit_ID	= PRM.Unit_ID
WHERE

PRM.Prm_Desc =		'Conductivity @25°C' --[µS/cm	Micro siemens per centimetre]
--PRM.Prm_Desc LIKE	'%Leachate%'		-- 0 result(s) for 'Leachate level [m	Metres]
--PRM.Prm_Desc LIKE	'%Strontium%'		-- 0 result(s) for 'Strontium (unfiltered)' [µg/l	Microgrammes per Litre]
--PRM.Prm_Desc LIKE	'%Volatile%'		-- 0 result(s) for 'Semi-Volatiles (Total)' [µg/l	Microgrammes per Litre]
--PRM.Prm_Desc LIKE	'%Total volume%'	-- 0 result(s) for 'Total Volume' [m3	Cubic metres]
--PRM.Prm_Desc =	'Ethanol'			-- 0 result(s) for 'Ethanol' [mg/l	milligrams per litre]
--PRM.Prm_Desc LIKE	'%Ethyl%'			-- 0 result(s) for 'Ethyl Acetate' [mg/l	milligrams per litre]

--AND		PRM.Prm_id IN (
--502,
--2807,
--3182)
ORDER BY 3

SELECT * FROM UnitOfMeasure ORDER BY 2
SELECT DISTINCT Theme_Desc FROM Theme

/*
SELECT DISTINCT [AQParameter_Code]
	,[AQOriginalUnit]
	,[DWParameter_Code]
	,[AQMappedUnit]
	,[ConversionFactor]
	,[Comment]
FROM	[EPACentral_Aquarius].[dbo].[DWParameterMap]
WHERE	[DWParameter_Code] = '43'
*/