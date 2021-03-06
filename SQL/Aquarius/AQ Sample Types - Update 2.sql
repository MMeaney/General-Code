USE [EPACentral_Aquarius]

SELECT DISTINCT
	STY.SamTyp_id
	, STY.SamTyp_Code
	, STY.SamTyp_Desc
	, STY.RetTyp_ID
	, STY.SamTyp_Category
	, STY.SamCtg_ID
	, STY.EdenStationPurpose
	, STY.EdenSamplePurpose
	, STY.SamTyp_PubPri
	--, STY.Hchk_Id
	--, STY.DeletedStatus
	--, SCT.SamCtg_id
	--, SCT.SamCtg_Code
	--, SCT.SamCtg_Desc
	--, SCT.Hchk_id
	--, SCT.DeletedStatus
	--, SCT.EdenSampleReason
	--, SCT.IncludeInReports
	--, SMT.SampleMethod_ID
	--, SMT.SampleMethod_Code
	--, SMT.SampleMethod_Name
	--, SMT.EdenSampleMethod
	--, SMT.[National]
	--, SMT.DeletedStatus
FROM		dbo.SampleType		STY
LEFT JOIN	dbo.SampleCategory	SCT	ON	SCT.SamCtg_id		=	STY.SamCtg_ID
--LEFT JOIN	dbo.SampleMethod	SMT	ON	SMT.SampleMethod_ID	=	STY.EdenSamplePurpose
--WHERE RetTyp_ID IN (4, 5)

--BEGIN TRANSACTION
--INSERT INTO EPACentral_Aquarius.dbo.SampleType (
--SamTyp_Code
--, SamTyp_Desc
--, RetTyp_ID
--, SamTyp_Category
--, SamCtg_ID
--, EdenStationPurpose
--, EdenSamplePurpose
--, SamTyp_PubPri
--, Hchk_Id
--, DeletedStatus
--)
--VALUES(
--'DWPRICY', 'DW Private Crypto Station', 5, 'Drinking Water Private Crypto', 3, 'DW_PRIVATE_MONITORING_STATION', 25, 'PRI', 1,0
--)

--COMMIT TRANSACTION
----ROLLBACK TRANSACTION

/*

SELECT DISTINCT
	STY.SamTyp_id
	, STY.SamTyp_Code
	, STY.SamTyp_Desc
	, STY.RetTyp_ID
	, STY.SamTyp_Category
	, STY.SamCtg_ID
	, STY.EdenStationPurpose
	, STY.EdenSamplePurpose
	, STY.SamTyp_PubPri
	, STY.Hchk_Id
	, STY.DeletedStatus
FROM dbo.SampleType STY
WHERE RetTyp_ID IN (4, 5)

 SELECT DISTINCT
	SMT.SampleMethod_ID
	, SMT.SampleMethod_Code
	, SMT.SampleMethod_Name
	, SMT.EdenSampleMethod
	, SMT.[National]
	, SMT.DeletedStatus
FROM dbo.SampleMethod SMT

SELECT DISTINCT 
	SCT.SamCtg_id
	, SCT.SamCtg_Code
	, SCT.SamCtg_Desc
	, SCT.Hchk_id
	, SCT.DeletedStatus
	, SCT.EdenSampleReason
	, SCT.IncludeInReports
FROM dbo.SampleCategory SCT

 --*/
  