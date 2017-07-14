-- **************************************************
-- *** Update station / monitored entity details
-- **************************************************

USE [EPACentral_Aquarius]


USE [EPACentral_Aquarius]

SELECT DISTINCT
	STA.Station_Name
	, STA.EdenNationalCode
	, MON.MonEnt_Code
	, BOD.River_Code
	, BOD.EdenMonitoredEntity
	, BOD.River_Name
	, ORG.Org_Code
	, ORG.Org_Name
	, STA.MainRBD_ID	 AS	[StationRBDId]
	, RBDSTA.Rbd_Name	 AS	[StationRBDName]
	, RBDSTA.EdenRbdCode AS	[StationRBDCode]
	, BOD.MainRBD_ID	 AS	[EntityRBDId]
	, RBDBOD.Rbd_Name	 AS	[EntityRBDName]
	, RBDBOD.EdenRbdCode AS	[EntityRBDCode]
	, STA.StationXCoord
	, STA.StationYCoord
	--, STA.Org_ID
	--, STA.Station_ID
	, RTY.RetTyp_Desc
FROM		dbo.RiverStation		STA
LEFT JOIN	dbo.MonitoredLocation	MLC		ON STA.Station_ID	= MLC.fkRiverStation_ID
LEFT JOIN	dbo.MonitoredEntity		MON		ON MON.MonEnt_ID	= MLC.MonitoredEntity_ID
LEFT JOIN	dbo.River				BOD		ON BOD.River_ID		= MON.fkRiver_ID
LEFT JOIN	dbo.Organisations		ORG		ON ORG.Org_ID		= MLC.Org_ID
LEFT JOIN	dbo.Theme				THM		ON THM.Theme_ID		= MON.Theme_ID
LEFT JOIN	dbo.ReturnTypes			RTY		ON RTY.Theme_ID		= MON.Theme_ID
LEFT JOIN	dbo.RBD					RBDSTA	ON RBDSTA.Rbd_ID	= STA.MainRBD_ID
LEFT JOIN	dbo.RBD					RBDBOD	ON RBDBOD.Rbd_ID	= BOD.MainRBD_ID
WHERE	STA.EdenNationalCode IN
(
'RS30A030350',
'RS34F250890',
'RS35C460640'
)
ORDER BY  ORG.Org_Code, STA.EdenNationalCode


---- ***************************************************
---- *** Update River Station Organisation 2016/02/02
---- *** RS36C030280 (Station_ID = '32279')
---- *** Update to Cavan County Council (Org_id = '11')
---- *** From Longford County Council (Org_id = '35')

--USE [EPACentral_Aquarius]

--UPDATE	dbo.RiverStation
--SET		Org_id		= '11'
--WHERE	Station_ID	= '32279'


-- *************************************
-- *** Update River RBD 2016/01/27
-- *** Update to RIVERBASINDISTRICT_5 (Western RBD):
-- *** (MainRBD_ID = '0')
--WHERE River.River_ID IN (35217, 35218) -- ('35C46' CORGLASS, '34F25' FARRANNOO)

--SELECT	MainRBD_ID, * FROM River
--WHERE	River.River_ID IN (35217, 35218)--River.River_Code IN ('35C46', '34F25')

--SELECT * FROM RBD ORDER BY EdenRbdCode

--USE [EPACentral_Aquarius]
--UPDATE	dbo.River
--SET		MainRBD_ID	= '0'
--WHERE	River.River_ID = 35217

--UPDATE	dbo.River
--SET		MainRBD_ID	= '0'
--WHERE	River.River_ID = 35218


/*
-- *************************************
-- *** Update Lakes RBD 2016/01/27
-- *** Update to RIVERBASINDISTRICT_7:
-- *** (MainRBD_ID = '4')
--WHERE Lake.Lake_ID IN (26, 49) -- ('NW_36_385', 'NW_36_657') ('Cullinaghan', 'Oughter South')

SELECT MainRBD_ID, * FROM Lake
WHERE Lake.Lake_ID IN (26, 49)

SELECT * FROM RBD ORDER BY EdenRbdCode

--USE [EPACentral_Aquarius]
--UPDATE	dbo.Lake
--SET		MainRBD_ID	= '4'
--WHERE	Lake_ID		= 26

--UPDATE	dbo.Lake
--SET		MainRBD_ID	= '4'
--WHERE	Lake_ID		= 49


-- *************************************
-- *** Update Station RBD 2016/01/27
-- *** Update to RIVERBASINDISTRICT_7:
-- *** (MainRBD_ID = '4')

--'LS360012319200010',
--'LS360012332300040',
--'LS360012332300050',
--'LS360012332300060',
--'LS360012332300070',
--'LS360012332300080',
--'LS360012332300090',
--'LS360012332300100',
--'LS360012332300020',
--'LS360012332300030'

SELECT * FROM RBD ORDER BY EdenRbdCode

--USE [EPACentral_Aquarius]

--UPDATE	dbo.LakeStation
--SET		MainRBD_ID			= '4'
--WHERE	EdenNationalCode	= 'LS360012319200010'

--UPDATE	dbo.LakeStation
--SET		MainRBD_ID			= '4'
--WHERE	EdenNationalCode	= 'LS360012332300040'

--UPDATE	dbo.LakeStation
--SET		MainRBD_ID			= '4'
--WHERE	EdenNationalCode	= 'LS360012332300050'

--UPDATE	dbo.LakeStation
--SET		MainRBD_ID			= '4'
--WHERE	EdenNationalCode	= 'LS360012332300060'

--UPDATE	dbo.LakeStation
--SET		MainRBD_ID			= '4'
--WHERE	EdenNationalCode	= 'LS360012332300070'

--UPDATE	dbo.LakeStation
--SET		MainRBD_ID			= '4'
--WHERE	EdenNationalCode	= 'LS360012332300080'

--UPDATE	dbo.LakeStation
--SET		MainRBD_ID			= '4'
--WHERE	EdenNationalCode	= 'LS360012332300090'

--UPDATE	dbo.LakeStation
--SET		MainRBD_ID			= '4'
--WHERE	EdenNationalCode	= 'LS360012332300100'

--UPDATE	dbo.LakeStation
--SET		MainRBD_ID			= '4'
--WHERE	EdenNationalCode	= 'LS360012332300020'

--UPDATE	dbo.LakeStation
--SET		MainRBD_ID			= '4'
--WHERE	EdenNationalCode	= 'LS360012332300030'


-- *************************************
-- *** Update Station codes

--Existing code		Change to
--LS070015911700010	LS070015911706310
--LS070015911700020	LS070015911706320
--LS070015911700030	LS070015911706330
--LS070015911700040	LS070015911706340
--LS070015911703100	LS070015911706350
--LS260155a03220010	LS260155a03226310
--LS260155a03223100	LS260155a03226320


--UPDATE dbo.LakeStation
--SET EdenNationalCode	= 'LS070015911706310'
--WHERE EdenNationalCode	= 'LS070015911700010'

--UPDATE dbo.LakeStation
--SET EdenNationalCode	= 'LS070015911706320'
--WHERE EdenNationalCode	= 'LS070015911700020'

--UPDATE dbo.LakeStation
--SET EdenNationalCode	= 'LS070015911706330'
--WHERE EdenNationalCode	= 'LS070015911700030'

--UPDATE dbo.LakeStation
--SET EdenNationalCode	= 'LS070015911706340'
--WHERE EdenNationalCode	= 'LS070015911700040'

--UPDATE dbo.LakeStation
--SET EdenNationalCode	= 'LS070015911706350'
--WHERE EdenNationalCode	= 'LS070015911703100'

--UPDATE dbo.LakeStation
--SET EdenNationalCode	= 'LS260155a03226310'
--WHERE EdenNationalCode	= 'LS260155a03220010'

--UPDATE dbo.LakeStation
--SET EdenNationalCode	= 'LS260155a03226320'
--WHERE EdenNationalCode	= 'LS260155a03223100'





--SELECT * FROM dbo.LakeStation
--WHERE	 StationFullCode	IN ('EA_07_274_0010_Op', 'EA_07_274_0020_Op', 'EA_07_274_0030_Op', 'EA_07_274_0040_Op', 'EA_07_274_3100_S', 'SH_26_750d_0010_Op', 'SH_26_750d_3100_S')
--SELECT * FROM dbo.LakeStation
--WHERE	 EdenNationalCode	IN ('LS070015911700010', 'LS070015911700020', 'LS070015911700030', 'LS070015911700040', 'LS070015911703100', 'LS260155a03220010', 'LS260155a03223100')


----BEGIN TRANSACTION
----UPDATE dbo.tblStation_sta
----SET
----RiverBasinDistrictId_org	= '12'
----, LastUpdatedBy_usr			= '1179'
----, LastUpdateDate_sta		= '2015-10-20 15:12:14.100'
----, RevisionComment_sta		= 'UPDATED 2015-10-19 RBD reverted change from "Neagh Bann IRBD" TO "North Western IRBD"'
----WHERE NationalCode_sta		= 'LS360012319200010'

----COMMIT TRANSACTION
------ROLLBACK TRANSACTION

---- ***************************
---- *** Update Montired Entity
 
----BEGIN TRANSACTION
----UPDATE dbo.tblMonitoredEntity_men
----SET
----OwnerOrganisationId_org	= '11'
----, Version_men			= '2'
----, LastUpdatedBy_usr		= '1179'
----, LastUpdateDate_men	= '2015-10-19 10:14:12.000'
----, RevisionComment_men	= 'UPDATED 2015-10-19 RBD updated from "Shannon IRBD" TO "Western RBD"'
----WHERE NationalCode_men	= '27001581900'

----COMMIT TRANSACTION
------ROLLBACK TRANSACTION

---- ********************************************
---- *** Determine monitored entities / stations

----SELECT * FROM dbo.tblStation_sta WHERE NationalCode_sta = 'LS360012319200010'

--SELECT * FROM dbo.tblMonitoredEntity_men WHERE NationalCode_men = '27001581900'

--SELECT * FROM dbo.tblOrganisation_org ORG
--INNER JOIN dbo.tblStringDefinition_std	STD ON ORG.Name_stg	= std.StringID_stg 
--WHERE STD.LanguageID_lan = '1'

----SELECT * FROM tblUser_usr WHERE Email_usr = 'm.meaney@epa.ie' -- 1179

--*/
