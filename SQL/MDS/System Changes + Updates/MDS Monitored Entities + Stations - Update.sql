-- **************************************************
-- *** Update station / monitored entity details
-- **************************************************

USE [EdenMDS-PRD]

SELECT * FROM dbo.tblStation_sta
WHERE NationalCode_sta IN
(
'LS360012319200010',
'LS360012332300040',
'LS360012332300050',
'LS360012332300060',
'LS360012332300070',
'LS360012332300080',
'LS360012332300090',
'LS360012332300100',
'LS360012332300020',
'LS360012332300030'
)

--SELECT * FROM tblOrganisation_org WHERE OrganisationId_org IN (11, 12, 13)
--SELECT * FROM tblMonitoredEntity_men WHERE MonitoredEntityId_men IN ('26292', '26288')


BEGIN TRANSACTION
UPDATE dbo.tblMonitoredEntity_men
SET
OwnerOrganisationId_org		= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_men		= GETDATE()
, RevisionComment_men		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE MonitoredEntityId_men	= '26292'

UPDATE dbo.tblMonitoredEntity_men
SET
OwnerOrganisationId_org		= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_men		= GETDATE()
, RevisionComment_men		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE MonitoredEntityId_men	= '26288'

UPDATE dbo.tblStation_sta
SET
RiverBasinDistrictId_org	= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_sta		= GETDATE()
, RevisionComment_sta		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE NationalCode_sta		= 'LS360012319200010'

UPDATE dbo.tblStation_sta
SET
RiverBasinDistrictId_org	= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_sta		= GETDATE()
, RevisionComment_sta		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE NationalCode_sta		= 'LS360012332300040'

UPDATE dbo.tblStation_sta
SET
RiverBasinDistrictId_org	= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_sta		= GETDATE()
, RevisionComment_sta		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE NationalCode_sta		= 'LS360012332300050'

UPDATE dbo.tblStation_sta
SET
RiverBasinDistrictId_org	= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_sta		= GETDATE()
, RevisionComment_sta		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE NationalCode_sta		= 'LS360012332300060'

UPDATE dbo.tblStation_sta
SET
RiverBasinDistrictId_org	= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_sta		= GETDATE()
, RevisionComment_sta		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE NationalCode_sta		= 'LS360012332300070'

UPDATE dbo.tblStation_sta
SET
RiverBasinDistrictId_org	= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_sta		= GETDATE()
, RevisionComment_sta		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE NationalCode_sta		= 'LS360012332300080'

UPDATE dbo.tblStation_sta
SET
RiverBasinDistrictId_org	= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_sta		= GETDATE()
, RevisionComment_sta		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE NationalCode_sta		= 'LS360012332300090'

UPDATE dbo.tblStation_sta
SET
RiverBasinDistrictId_org	= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_sta		= GETDATE()
, RevisionComment_sta		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE NationalCode_sta		= 'LS360012332300100'

UPDATE dbo.tblStation_sta
SET
RiverBasinDistrictId_org	= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_sta		= GETDATE()
, RevisionComment_sta		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE NationalCode_sta		= 'LS360012332300020'

UPDATE dbo.tblStation_sta
SET
RiverBasinDistrictId_org	= '13'
, LastUpdatedBy_usr			= '1179'
, LastUpdateDate_sta		= GETDATE()
, RevisionComment_sta		= 'UPDATED 2016-01-28 RBD changed from RBD6 Neagh Bann IRBD to RBD7 North Western IRBD after discussion with GIS'
WHERE NationalCode_sta		= 'LS360012332300030'

--COMMIT TRANSACTION
----ROLLBACK TRANSACTION

-- */

-- *******************
-- *** Update Station

--Existing code		Change to
--LS070015911700010 to LS070015911706310
--LS070015911700020 to LS070015911706320
--LS070015911700030 to LS070015911706330
--LS070015911700040 to LS070015911706340
--LS070015911703100 to LS070015911706350
--LS260155a03220010 to LS260155a03226310
--LS260155a03223100 to LS260155a03226320

--BEGIN TRANSACTION
--UPDATE dbo.tblStation_sta
--SET
--NationalCode_sta			= 'LS070015911706310'
--, LastUpdatedBy_usr			= '1179'
--, LastUpdateDate_sta		= '2015-10-22 15:12:14.100'
--, RevisionComment_sta		= 'UPDATED 2015-10-22 changed station code from LS070015911700010 to LS070015911706310'
--WHERE NationalCode_sta		= 'LS070015911700010'
--COMMIT TRANSACTION

--BEGIN TRANSACTION
--UPDATE dbo.tblStation_sta
--SET
--NationalCode_sta			= 'LS070015911706320'
--, LastUpdatedBy_usr			= '1179'
--, LastUpdateDate_sta		= '2015-10-22 15:12:14.100'
--, RevisionComment_sta		= 'UPDATED 2015-10-22 changed station code from LS070015911700020 to LS070015911706320'
--WHERE NationalCode_sta		= 'LS070015911700020'
--COMMIT TRANSACTION

--BEGIN TRANSACTION
--UPDATE dbo.tblStation_sta
--SET
--NationalCode_sta			= 'LS070015911706330'
--, LastUpdatedBy_usr			= '1179'
--, LastUpdateDate_sta		= '2015-10-22 15:12:14.100'
--, RevisionComment_sta		= 'UPDATED 2015-10-22 changed station code from LS070015911700030 to LS070015911706330'
--WHERE NationalCode_sta		= 'LS070015911700030'
--COMMIT TRANSACTION

--BEGIN TRANSACTION
--UPDATE dbo.tblStation_sta
--SET
--NationalCode_sta			= 'LS070015911706340'
--, LastUpdatedBy_usr			= '1179'
--, LastUpdateDate_sta		= '2015-10-22 15:12:14.100'
--, RevisionComment_sta		= 'UPDATED 2015-10-22 changed station code from LS070015911700040 to LS070015911706340'
--WHERE NationalCode_sta		= 'LS070015911700040'
--COMMIT TRANSACTION

----LS070015911703100 to LS070015911706350
----LS260155a03220010 to LS260155a03226310
----LS260155a03223100 to LS260155a03226320

--BEGIN TRANSACTION
--UPDATE dbo.tblStation_sta
--SET
--NationalCode_sta			= 'LS070015911706350'
--, LastUpdatedBy_usr			= '1179'
--, LastUpdateDate_sta		= '2015-10-22 15:12:14.100'
--, RevisionComment_sta		= 'UPDATED 2015-10-22 changed station code from LS070015911703100 to LS070015911706350'
--WHERE NationalCode_sta		= 'LS070015911703100'
--COMMIT TRANSACTION

--BEGIN TRANSACTION
--UPDATE dbo.tblStation_sta
--SET
--NationalCode_sta			= 'LS260155a03226310'
--, LastUpdatedBy_usr			= '1179'
--, LastUpdateDate_sta		= '2015-10-22 15:12:14.100'
--, RevisionComment_sta		= 'UPDATED 2015-10-22 changed station code from LS260155a03220010 to LS260155a03226310'
--WHERE NationalCode_sta		= 'LS260155a03220010'
--COMMIT TRANSACTION

--BEGIN TRANSACTION
--UPDATE dbo.tblStation_sta
--SET
--NationalCode_sta			= 'LS260155a03226320'
--, LastUpdatedBy_usr			= '1179'
--, LastUpdateDate_sta		= '2015-10-22 15:12:14.100'
--, RevisionComment_sta		= 'UPDATED 2015-10-22 changed station code from LS260155a03223100 to LS260155a03226320'
--WHERE NationalCode_sta		= 'LS260155a03223100'
--COMMIT TRANSACTION
----ROLLBACK TRANSACTION


--BEGIN TRANSACTION
--UPDATE dbo.tblStation_sta
--SET
--RiverBasinDistrictId_org	= '12'
--, LastUpdatedBy_usr			= '1179'
--, LastUpdateDate_sta		= '2015-10-22 15:12:14.100'
--, RevisionComment_sta		= 'UPDATED 2015-10-22 RBD reverted change from "Neagh Bann IRBD" TO "North Western IRBD"'
--WHERE NationalCode_sta		= 'LS360012319200010'
----COMMIT TRANSACTION
------ROLLBACK TRANSACTION


--BEGIN TRANSACTION
--UPDATE dbo.tblStation_sta
--SET
--NationalCode_sta		= 'LS260155a03226310'
--, LastUpdatedBy_usr		= '1179'
--, LastUpdateDate_sta	= '2015-10-20 12:30:00.000'
--, RevisionComment_sta	= 'UPDATED 2015-10-20 Station Code updated from LS260155a03220010 to LS260155a03226310'
--WHERE StationId_sta		= '86284'
--COMMIT TRANSACTION
----ROLLBACK TRANSACTION


-- ***************************
-- *** Update Montitored Entity
 
--BEGIN TRANSACTION
--UPDATE dbo.tblMonitoredEntity_men
--SET
--OwnerOrganisationId_org	= '11'
--, Version_men			= '2'
--, LastUpdatedBy_usr		= '1179'
--, LastUpdateDate_men	= '2015-10-19 10:14:12.000'
--, RevisionComment_men	= 'UPDATED 2015-10-19 RBD updated from "Shannon IRBD" TO "Western RBD"'
--WHERE NationalCode_men	= '27001581900'
--COMMIT TRANSACTION
----ROLLBACK TRANSACTION

-- ********************************************
-- *** Determine monitored entities / stations

--SELECT * FROM dbo.tblStation_sta WHERE NationalCode_sta = 'LS360012319200010'

--SELECT * FROM dbo.tblMonitoredEntity_men WHERE NationalCode_men = '27001581900'

--SELECT * FROM dbo.tblOrganisation_org ORG
--INNER JOIN dbo.tblStringDefinition_std	STD ON ORG.Name_stg	= std.StringID_stg 
--WHERE STD.LanguageID_lan = '1'

--SELECT * FROM tblUser_usr 
--WHERE UserID_usr = 161
--WHERE Email_usr = 'm.meaney@epa.ie' -- 1179