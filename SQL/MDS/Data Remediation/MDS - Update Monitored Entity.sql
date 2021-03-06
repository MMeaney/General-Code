/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [MonitoredEntityId_men]
      ,[MonitoredEntityTypeId_met]
      ,[NationalCode_men]
      ,[Name_men]
      ,[OwnerOrganisationId_org]
      ,[ApprovedBy_usr]
      ,[Version_men]
      ,[RevisionComment_men]
      ,[LastUpdatedBy_usr]
      ,[LastUpdateDate_men]
  FROM [EdenMDS-STG].[dbo].[tblMonitoredEntity_men]
  WHERE NationalCode_men = '0400pub1001'


-- ******************************************
-- *** Script to update entity

UPDATE [EdenMDS-STG].[dbo].[tblMonitoredEntity_men]

SET
NationalCode_men		= '0400PUB1001'
, Version_men			= '4'	
, LastUpdatedBy_usr		= '1179'
, LastUpdateDate_men	= GETDATE()
, RevisionComment_men	= 'NationalCode_men changed to uppercase'

WHERE MonitoredEntityId_men	= '29468'