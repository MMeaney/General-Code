/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [SamplingMethodID_smt]
      ,[Code_smt]
      ,[Name_smt]
      ,[LastUpdatedBy_usr]
      ,[LastUpdateDate_smt]
FROM [EdenMDS-TST].[dbo].[tblSamplingMethod_smt]

BEGIN TRANSACTION
INSERT INTO [EdenMDS-TST].[dbo].[tblSamplingMethod_smt]
(
      [Code_smt]
      ,[Name_smt]
	  ,[LastUpdatedBy_usr]
      ,[LastUpdateDate_smt]
)
VALUES
(
'SAMPLINGMETHOD_TRAC_DISCRETE_RETURN'
, 'TRaC Discrete Return'
, 1179
, GETDATE()
)
--COMMIT TRANSACTION
----ROLLBACK TRANSACTION
