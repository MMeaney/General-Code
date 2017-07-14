USE [EPACentral_Aquarius]

SELECT DISTINCT
	--ENP.Prm_id
	--, 
	--CASE
	--  WHEN ENP.Prm_Desc	 = 'True Colour'
	--		THEN	'Colour'
	--		ELSE	ENP.Prm_Desc
	--  END
	--  AS 
	  Prm_Desc
	, ENP.Prm_Code
	, UOM.Unit_Code
	--, UOM.Unit_Name
	--, UOM.EdenUnit
	--, PTY.PrmTyp_Desc
	--, ISNULL(PST.PrmSubTyp_Desc, '') AS [PrmSubTyp_Desc]
	--, ISNULL(PGP.Name, '')			 AS [Prm Group Name]
	--, ISNULL(PGP.Description, '')	 AS [Prm Group Desc]
	, THM.Theme_Desc
	--, ENP.Theme_ID
	--, UOM.Unit_ID
		
FROM		dbo.Parameter					ENP 
LEFT JOIN	dbo.UnitOfMeasure				UOM ON UOM.Unit_ID		= ENP.Unit_ID 
LEFT JOIN	dbo.Theme						THM ON THM.Theme_id		= ENP.Theme_ID
LEFT JOIN	dbo.ParameterType				PTY	ON PTY.PrmTyp_id	= ENP.PrmTyp_ID
LEFT JOIN	dbo.ParameterSubType			PST	ON PST.PrmSubTyp_id = ENP.PrmSubTyp_Id
LEFT JOIN	dbo.ParameterGroupMembership	PGM	ON PGM.Prm_Id		= ENP.Prm_id
LEFT JOIN	dbo.ParameterGroup				PGP	ON PGP.PrmGrp_Id	= PGM.PrmGrp_Id

--WHERE	ENP.Prm_Desc like '%Coliform Bacteria (Total%'
WHERE	ENP.Prm_Code	=	'938'
/*
ENP.Prm_Desc	IN
(
'1,2-Dichloroethane',
'2,4-D',
'2,6-Dichlorobenzamide',
'4-Nonylphenol',
'Alachlor',
'AMPA',
'Anthracene',
'Arsenic - filtered',
'Arsenic - unfiltered',
'Arsenic - unspecified',
'Atrazine',
'Benzene',
'Benzo(a)pyrene',
'Benzo(b)fluoranthene',
'Benzo(g,h,i)perylene',
'Benzo(k)fluoranthene',
'C10-C13 Chloroalkanes',
'Cadmium - filtered',
'Cadmium - unfiltered',
'Cadmium - unspecified',
'Cadmium and Thallium',
'Chlorfenvinphos',
'Chlorobenzene',
'Chloroform',
'Chlorpyriphos Ethyl',
'Chlorpyriphos Methyl',
'Chromium - filtered',
'Chromium - unfiltered',
'Chromium - unspecified',
'Chromium VI - filtered',
'Chromium VI - unfiltered',
'Chromium VI - unspecified',
'Copper - filtered',
'Copper - unfiltered',
'Copper - unspecified',
'Cyanide (unspecified)',
'Di(2-ethylhexyl) phthalate (DEHP)',
'Diazinon',
'Dichlobenil',
'Dimethoate',
'Diuron',
'Endosulfan (Total)',
'Endosulfan 1 / alpha',
'Endosulfan 2 / beta',
'Fluoranthene',
'Fluoride',
'Glyphosate',
'Hexachlorobenzene',
'Hexachlorobutadiene',
'Hexachlorocyclopentadiene',
'Indeno(1,2,3-c,d)pyrene',
'Isoproturon',
'Lead - filtered',
'Lead - unfiltered',
'Lead - unspecified',
'Linuron',
'Mancozeb',
'MCPA',
'Mecoprop',
'Mercury - filtered',
'Mercury - unfiltered',
'Mercury - unspecified',
'Methylene Chloride / Dichloromethane',
'Naphthalene',
'Nickel - filtered',
'Nickel - unfiltered',
'Nickel - unspecified',
'Nonylphenols (Sum)',
'Octylphenols (Sum)',
'para-tert-Octylphenol',
'Pentachlorobenzene',
'Pentachlorophenol',
'Phenols (Total)',
'Polyaromatic Hydrocarbons (PAH) -Sum',
'Simazine',
'Sum 1_IWW: PBDE 28+47+99+100+153+154',
'Toluene',
'Tributyltin',
'Tributyltin',
'Trichlorobenzene (all isomers)',
'Trifluralin',
'Xylenes (Total)',
'Zinc - filtered',
'Zinc - unfiltered',
'Zinc - unspecified'
)

--LIKE '%Petroleum%'
--OR		ENP.Prm_Desc	LIKE '%Zineb%'
--OR		ENP.Prm_Desc	LIKE '%TOC (as FID)%'
--WHERE	PRM.Theme_ID	IN		('0', '1')
--AND
--(
--		ENP.Prm_Desc	LIKE '%BOD%'
--	OR	ENP.Prm_Desc	=	 'Dissolved Oxygen'
--	OR	ENP.Prm_Desc	LIKE '%Ammonia%'
--	OR	ENP.Prm_Desc	LIKE '%nitrogen%'
--	OR	ENP.Prm_Desc	LIKE '%Ortho%phosphate%'
--	OR	ENP.Prm_Desc	LIKE '%susp%'
--)
--AND		EdenUnit = 'MEASUREMENT_UNIT_61'

ORDER BY Prm_Desc--, Prm_Code, THM.Theme_Desc, UOM.Unit_Name


--SELECT * FROM UnitOfMeasure WHERE EdenUnit = 'MEASUREMENT_UNIT_61'
--SELECT * FROM UnitOfMeasure WHERE EdenUnit = 'MEASUREMENT_UNIT_35'
--SELECT * FROM Parameter WHERE Prm_Desc LIKE	'%Hydrogen Fluoride%'
--SELECT * FROM Theme


--AND		PRM.Prm_Desc	IN
--(
--'2,4-D',	
--'2,4,5-T Acid Herbicide',			-- No Match
--'2,4-Dichlorophenoxyacetic acid',	-- No Match
--'2,6-dichlorobenzamide',	
--'asulam',	
--'atrazine',	
--'Atrazine-Desethyl ',				-- No Match
--'BAM',								-- No Match
--'Bentazon',							-- No Match
--'bentazone',	
--'Bromacil ',	
--'clopyralid',	
--'cypermethrin',	
--'Desethylatrazine',					-- No Match
--'dichlobenil ',	
--'dichlorprop',	
--'diuron',	
--'Fenpropidin',	
--'glyphosate',	
--'imazapyr',	
--'isoproturon',	
--'Lindane',							-- No Match
--'linuron',	
--'MCP',								-- No Match
--'MCPA',	
--'mecoprop',	
--'metaldehyde',	
--'Metoxuron',	
--'propyzamide',	
--'Prothioconazole',	
--'simazine',	
--'S-Metachlor ',						-- No Match
--'Terbuthylazine',	
--'tert–Amyl Methyl Ether'
--)
--ORDER BY PRM.Theme_ID, PRM.Prm_Desc


--*/


/*

-- *********************************
-- *** Update "UnitOfMeasure" table

--INSERT INTO UnitOfMeasure 
--(
--	Unit_Code
--	, Unit_Name
--	, EdenUnit
--	, DeletedStatus
--)
--VALUES 
--(
--	'mS/cm'
--	, 'Milli siemens per centimetre'
--	, 'MEASUREMENT_UNIT_207'
--	, '0'
--);


SELECT * FROM UnitOfMeasure
WHERE	Unit_Name	LIKE	'%SIEM%'
OR		EdenUnit	LIKE	'%207%'
ORDER BY EdenUnit
--*/


/*
-- ************
-- *** Sandbox

--WHERE		PRM.Prm_Desc IN 
--('Formaldehyde', 'Organic substances Class I', 'Organic substances Class II', 'Toluene di-isocyanate')


, THM.Theme_Code
, THM.EdenEntityType

PRM.Prm_Desc	LIKE '%Tetrachloroethene%TRI%'
AND		PAR.Theme_ID = '0'
--PRM.Prm_Desc	LIKE '%Tin - filtered%'
--PRM.Prm_Desc	LIKE '%Trihalomethane%'
--PRM.Prm_Desc	LIKE '%Vanadium - filtered%'
--*/