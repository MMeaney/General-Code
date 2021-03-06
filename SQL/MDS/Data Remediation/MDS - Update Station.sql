USE [EdenMDS-PRD]

SELECT DISTINCT
[StationId_sta]
    ,[StationTypeId_stt]
    ,[NationalCode_sta]
    ,[Name_sta]
    ,[LocalAuthorityId_org]
    ,[RiverBasinDistrictId_org]
    ,[MonitoredEntityId_men]
    ,[ApprovedBy_usr]
    ,[Version_sta]
    ,[WFDWiseCode_sta]
    ,[LocalCode_sta]
    ,[Easting_sta]
    ,[Northing_sta]
    ,[EQR_sta]
    ,[QValue_sta]
    ,[WaterBodyCode_sta]
    ,[RevisionComment_sta]
    ,[LastUpdatedBy_usr]
    ,[LastUpdateDate_sta]
    ,[UploadId_uld]
    ,[ApprovedOn_sta]
    ,[MonitoredEntityWFDWiseCode_sta]
    ,[CreatedByOrganisation_org]
FROM [EdenMDS-PRD].[dbo].[tblStation_sta]
WHERE [NationalCode_sta] = 'RS18D010300'



-- ******************************************
-- *** Script to update STATION

BEGIN TRANSACTION
UPDATE [EdenMDS-PRD].[dbo].[tblStation_sta]

SET
Easting_sta				= ''
, Northing_sta			= ''
, Version_sta			= Version_sta + 1	
, LastUpdatedBy_usr		= '1179'
, LastUpdateDate_sta	= GETDATE()
, RevisionComment_sta	= '2016-xx-xx - ...'

WHERE StationId_sta		= '...'