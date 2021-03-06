/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT
	BTW.BathingWater_ID
	, BTW.BathingWater_Code
	, BWS.Station_Code
	, BWS.EdenNationalCode
	, BTW.BathingWater_Name
	, BTW.HA_ID
	, BTW.MainRBD_ID
	, BTW.MainCounty_ID
	, BTW.Org_ID
	, BTW.Region_ID
	, BTW.Province_ID
	, BTW.BathingWaterType_ID
	, BTW.BathingWaterVisibility_ID
	, BTW.EdenMonitoredEntity
	, BTW.WFD_Code
	, BTW.NUTS_Code
	, BTW.IDBW_Code
	, BTW.WeatherKey
	, BTW.PhotoID
	, BTW.BeachDesc
	, BTW.DisabilityAccess
	, BTW.BathingWaterProfile
	, BTW.Facilities
	, BTW.Activities
	, BTW.IsToiletsAvailable
	, BTW.IsDogsAllowed
	, BTW.IsDisabilityAccessible
	, BTW.IsGreenCoastFlag
	, BTW.IsBlueFlag
	, BTW.IsInformationBoardAvailable
	, BTW.IsLifeguardAvailable
	, BTW.IsCarParkingAvailable
	, BTW.IsBicycleParkingAvailable
	, BTW.IsAuthorisedCampingAvailable
	, BTW.IsNaturalSensitiveArea
	, BTW.LifeguardInfo
	, BTW.CenterXCoord
	, BTW.CenterYCoord
	, BTW.DeletedStatus
FROM [EPACentral_aquarius].[dbo].[BathingWater] BTW
	INNER JOIN	BathingWaterStation		BWS
	ON			BTW.BathingWater_ID		= BWS.BathingWater_ID
WHERE 
--BathingWater_ID = '135'
BTW.Org_ID = '157'