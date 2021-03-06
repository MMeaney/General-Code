USE [EPACentral_Aquarius]

SELECT DISTINCT
	PRMFROM.Prm_Desc		AS	[AqParam]
	, PRMFROM.Prm_id		AS	[AqPrmID]
	, UOMFROM.EdenUnit		AS	[AqEdenUnit]
	, UOMFROM.Unit_Name		AS	[AqUOM]
	, PRMMAP.Prm_Desc		AS	[MapParam]
	, PRMMAP.ParamMapFromID	AS	[FromID]
	, PRMMAP.ParamMapToID	AS	[ToID]
	, PRMFROM.Prm_Code		AS	[FromCode]
	, PRMTO.Prm_Code		AS	[ToCode]
	, PRMTO.Prm_Desc		AS	[MapToParam]
	, UOMTO.EdenUnit		AS	[MapEdenUnit]
	, UOMTO.Unit_Name		AS	[MapUOM]
	, THMFROM.Theme_Desc	AS	[ThemeFrom]
	--, THMTO.Theme_Desc		AS	[ThemeTo]

FROM		dbo.Parameter			PRMFROM
LEFT JOIN	dbo.ParameterMapping	PRMMAP	ON PRMFROM.Prm_id	= PRMMAP.ParamMapFromID
LEFT JOIN	dbo.Parameter			PRMTO	ON PRMTO.Prm_id		= PRMMAP.ParamMapToID
LEFT JOIN	dbo.UnitOfMeasure		UOMFROM ON UOMFROM.Unit_ID	= PRMFROM.Unit_ID 
LEFT JOIN	dbo.UnitOfMeasure		UOMTO	ON UOMTO.Unit_ID	= PRMFROM.Unit_ID 
LEFT JOIN	dbo.Theme				THMFROM	ON THMFROM.Theme_id	= PRMFROM.Theme_ID 
LEFT JOIN	dbo.Theme				THMTO	ON THMTO.Theme_id	= PRMMAP.Theme_ID

WHERE	PRMFROM.Prm_Code	=	'803'

--WHERE	(
--			PRMFROM.Prm_Desc	LIKE '%Colour%'
--		OR	PRMFROM.Prm_Desc	LIKE '%e%coli%'
--		OR	PRMFROM.Prm_Desc	LIKE '%coliform%'
--		--OR	PRMFROM.Prm_Desc	LIKE '%Sodium%'
--		--OR	PRMFROM.Prm_Desc	LIKE '%Uranium%'
--		)			
--AND		THMFROM.Theme_Desc	LIKE '%Ground%'

--PRMMAP.Prm_Desc	IS NULL

ORDER BY	PRMFROM.Prm_Desc

--SELECT * FROM dbo.Parameter			WHERE Theme_ID = '12' AND Prm_Desc	LIKE '%Calcium%unspecified'
--SELECT * FROM dbo.ParameterMapping	WHERE Prm_Desc	LIKE '%Potassium%'

--WHERE	(PRMFROM.Prm_Desc	= 'Antimony - unspecified'	AND UOMFROM.Unit_Name = 'milligrams per litre')
--OR		(PRMFROM.Prm_Desc	= 'Silica (as SiO2)'		AND	UOMFROM.Unit_Name = 'Microgrammes per Litre')
----AND		UOMFROM.Unit_Name	=  'Microgrammes per Litre'
----AND		THM.Theme_Desc	= 'Waste Water'

--SELECT * FROM ParameterMapping WHERE ParamMapToID = '8874'