USE [EPACentral_Aquarius]

DECLARE @Samp_Code VARCHAR(MAX)
SET @Samp_Code = '157200039'

IF(OBJECT_ID('TEMPDB..#TMPSampleAudit') IS NOT NULL)
BEGIN
    DROP TABLE #TMPSampleAudit
END
SELECT DISTINCT 
	AUDSMP.Samp_ID
	, AUDSMP.Samp_Code
	, AUDSMP.MonEnt_ID
	, AUDSMP.MonLoc_ID
	, AUDSMP.RetTyp_ID
	, AUDSMP.SampTyp_ID
	, AUDSMP.SamCtg_ID
	, AUDSMP.Samp_Date
	, AUDSMP.Comp_Date
	, AUDSMP.SampleMethod_ID
	, AUDSMP.Samp_LabName
	, AUDSMP.Samp_AnalName
	, AUDSMP.Details
	, AUDSMP.CmuID
	, AUDSMP.SubnetID
	, AUDSMP.WaterBodyCode
	, AUDSMP.Hchk_ID
	, AUDSMP.DepthTakenAt
	, AUDSMP.IsSurrogateStation
	, AUDSMP.SurrogateEasting
	, AUDSMP.SurrogateNorthing
	, AUDSMP.Source_ID
	--, AUDSMP.AuditID
	--, AUDSMP.TransactionDate
	--, AUDSMP.TransactionType
INTO	#TMPSampleAudit
FROM	[EPACentral_Aquarius].[dbo].[AuditTrailSample]	AUDSMP
WHERE	AUDSMP.Samp_Code = @Samp_Code

SELECT * FROM	#TMPSampleAudit

INSERT	INTO	#TMPSampleAudit
SELECT DISTINCT 
	SMP.Samp_ID
	, SMP.Samp_Code
	, SMP.MonEnt_ID
	, SMP.MonLoc_ID
	, SMP.RetTyp_ID
	, SMP.SampTyp_ID
	, SMP.SamCtg_ID
	, SMP.Samp_Date
	, SMP.Comp_Date
	, SMP.SampleMethod_ID
	, SMP.Samp_LabName
	, SMP.Samp_AnalName
	, SMP.Details
	, SMP.CmuID
	, SMP.SubnetID
	, SMP.WaterBodyCode
	, SMP.Hchk_ID
	, SMP.DepthTakenAt
	, SMP.IsSurrogateStation
	, SMP.SurrogateEasting
	, SMP.SurrogateNorthing
	, SMP.Source_ID
FROM		[EPACentral_Aquarius].[dbo].[Sample]	SMP
WHERE		SMP.Samp_Code = @Samp_Code

SELECT * FROM	#TMPSampleAudit

INSERT	INTO	#TMPSampleAudit
SELECT DISTINCT 
	ARCSMP.Samp_ID
	, ARCSMP.Samp_Code
	, ARCSMP.MonEnt_ID
	, ARCSMP.MonLoc_ID
	, ARCSMP.RetTyp_ID
	, ARCSMP.SampTyp_ID
	, ARCSMP.SamCtg_ID
	, ARCSMP.Samp_Date
	, ARCSMP.Comp_Date
	, ARCSMP.SampleMethod_ID
	, ARCSMP.Samp_LabName
	, ARCSMP.Samp_AnalName
	, ARCSMP.Details
	, ARCSMP.CmuID
	, ARCSMP.SubnetID
	, ARCSMP.WaterBodyCode
	, ARCSMP.Hchk_ID
	, ARCSMP.DepthTakenAt
	, ARCSMP.IsSurrogateStation
	, ARCSMP.SurrogateEasting
	, ARCSMP.SurrogateNorthing
	, ARCSMP.Source_ID
FROM	[EPACentral_Aquarius_Archive].[dbo].[AuditTrailSample]	ARCSMP
WHERE	ARCSMP.Samp_Code = @Samp_Code

SELECT * FROM	#TMPSampleAudit

--=SELECT * FROM Sample   WHERE Samp_Code = @Samp_Code