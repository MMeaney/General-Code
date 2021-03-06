USE [EPACentral_Aquarius]

SELECT DISTINCT
	[PrmGrp_Id]
	,[Name]
	,[Description]
	,[IsWiseReportGroup]
	,[Container_Id]
FROM [EPACentral_Aquarius].[dbo].[ParameterGroup]


--BEGIN TRANSACTION
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroup]
--(
--[Name]
--, [Description]
--)
--VALUES
--(
--'DW Pesticide'
--, 'Drinking Water pesticide report parameters'
--)
----COMMIT TRANSACTION
------ROLLBACK TRANSACTION

SELECT DISTINCT
	[PrmGrp_Id]
	, [Prm_Id]
FROM [EPACentral_Aquarius].[dbo].[ParameterGroupMembership]

--BEGIN TRANSACTION
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership]
--(
--	[PrmGrp_Id]
--	, [Prm_Id]
--)
--VALUES
--(
--39,
--2667
--)
----COMMIT TRANSACTION
------ROLLBACK TRANSACTION

--BEGIN TRANSACTION
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 2667)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6310)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 8733)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 8278)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 8279)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6638)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6148)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 2707)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 69)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 481)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6497)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6498)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 482)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 498)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6508)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 512)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6319)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6327)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 522)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 523)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6328)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6333)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6140)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 531)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 2699)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 5936)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6237)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6361)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 549)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 8280)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 8281)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 555)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 2716)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6365)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6157)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6147)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6366)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 2706)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 559)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 8868)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 8869)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 564)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6368)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6370)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 566)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 5990)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6253)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6295)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6233)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 5603)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 2649)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 614)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6403)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 5591)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6221)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6568)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6172)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 275)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 2733)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 2651)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 6297)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 8282)
--INSERT INTO [EPACentral_Aquarius].[dbo].[ParameterGroupMembership] ([PrmGrp_Id] , [Prm_Id]) VALUES(39, 8283)
----COMMIT TRANSACTION
------ROLLBACK TRANSACTION


-- ***********************************
-- *** Determine Pesticide Parameters

SELECT DISTINCT
	PRM.Prm_id
	, PRM.Prm_Code
	, PRM.Prm_Desc
	, THM.Theme_Desc
	, PTY.PrmTyp_Desc
	, UOM.Unit_Name
	, UOM.Unit_Code
	, UOM.EdenUnit

FROM		dbo.Parameter		PRM
LEFT JOIN	dbo.UnitOfMeasure	UOM	ON UOM.Unit_ID	= PRM.Unit_ID
LEFT JOIN	dbo.Theme			THM	ON THM.Theme_id	= PRM.Theme_ID
LEFT JOIN	dbo.ParameterType	PTY ON PTY.PrmTyp_id = PRM.PrmTyp_ID
WHERE	PRM.Theme_ID	IN	('6', '15')
AND		PRM.Prm_Desc	IN
(
'2,4-D',	
'2,6-dichlorobenzamide',	
'asulam',	
'atrazine',	
'bentazone',	
'Bromacil ',	
'clopyralid',	
'cypermethrin',	
'dichlobenil ',	
'dichlorprop',	
'diuron',	
'Fenpropidin',	
'glyphosate',	
'imazapyr',	
'isoproturon',
'linuron',	
'MCPA',	
'mecoprop',	
'metaldehyde',	
'Metoxuron',	
'propyzamide',	
'Prothioconazole',	
'simazine',	
'Terbuthylazine',	
'tert–Amyl Methyl Ether',
'Maneb',
'Zibeb',
'2,4,5-T Acid Herbicide',			--'Acid Herbicides' -- No Match
'2,4-Dichlorophenoxyacetic acid',	-- No Match
'Atrazine-Desethyl',				-- No Match
'BAM',								-- No Match
'Bentazon',							-- No Match
'Desethylatrazine',					-- No Match	
'Lindane',							-- No Match
'MCP',								-- No Match
'S-Metachlor'						-- No Match
)
ORDER BY PRM.Prm_Desc