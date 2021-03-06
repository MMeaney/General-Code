USE [EPACentral_Aquarius]

----BEGIN TRANSACTION
--UPDATE	dbo.Sample
--SET		Samp_Date = CAST('2015-06-30' AS DATETIME)
--WHERE	Samp_ID IN
--(
--'1643088',
--'1643089',
--'1643090',
--'1643094',
--'1643095',
--'1643091',
--'1643092',
--'1643093'
--)
----COMMIT TRANSACTION
----ROLLBACK TRANSACTION

SELECT DISTINCT
	SAM.Samp_ID
	, SAM.Samp_Code
	, SAM.MonEnt_ID
	, SAM.MonLoc_ID
	, SAM.RetTyp_ID
	, SAM.SampTyp_ID
	, SAM.SamCtg_ID
	, SAM.Samp_Date
	, SAM.Comp_Date
	, SAM.SampleMethod_ID
	, SAM.Samp_LabName
	, SAM.Samp_AnalName
	, SAM.Details
	, SAM.CmuID
	, SAM.SubnetID
	, SAM.WaterBodyCode
	, SAM.Hchk_ID
	, SAM.DepthTakenAt
	, SAM.IsSurrogateStation
	, SAM.SurrogateNorthing
	, SAM.SurrogateEasting
	, SAM.Source_ID
FROM	dbo.Sample	SAM
WHERE	SAM.Samp_ID IN
(
'1643088',
'1643089',
'1643090',
'1643094',
'1643095',
'1643091',
'1643092',
'1643093'
)