USE [EdenMDS-TST]

BEGIN TRANSACTION
UPDATE [dbo].[tblWasteWaterReturnYear_wwy]
   SET [WasteWaterReturnYear_wwy] = '2015', -- Set to desired return year value
       [StaticName_wwy]		= 'WasteWater',
       [CurrentYear_wwy]	= '1',
       [StatusID_rst]		= '1',
       [LastUpdateDate_wwy] = GETDATE(),
       [LastUpdatedBy_usr]	= '95'
COMMIT TRANSACTION
--ROLLBACK TRANSACTION


SELECT * FROM [dbo].[tblWasteWaterReturnYear_wwy]
