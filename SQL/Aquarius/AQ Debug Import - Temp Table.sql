USE [EPACentral_Aquarius]

SELECT 
	TMP.SampleId
	, ENP.Prm_Desc			AS	[JN_Parameter]
	, UOM.Unit_Code			AS	[JN_UOM]
	, UOM.EdenUnit			AS	[JN_EdenUnit]
	, TMP.MeasurementResult
	, TMP.MeasurementTextResult
	, TMP.ResultString
	, TMP.MeasurementDate
	, TMP.MeasurementUpdateNo
	, TMP.MeasurementCompSym
	, TMP.ParameterId
	, TMP.UnitId
	, TMP.HealthcheckId
	, TMP.FileIdentity
	, TMP.Analyst
	, TMP.Comment
	, TMP.MinimumRequiredConcentration
	, TMP.MaximumAllowedConcentration
	, TMP.LimitOfDetection
	, TMP.LimitOfQuantification
	, TMP.MethodOfAnalysis
	, TMP.Uncertainty
	, TMP.UncertaintyUnit
	, TMP.ConfidenceInterval
	, TMP.AccreditedResult
	, TMP.StatusMAC
	, TMP.StatusMRC
	, TMP.VerifiedStatus
	, TMP.FromEden

FROM	[tempdb].[dbo].[3d5e823d-5450-4d99-9f6d-28dd3ddea07b]	TMP

LEFT JOIN	dbo.Parameter		ENP		ON ENP.Prm_id	= TMP.ParameterId
LEFT JOIN	dbo.UnitOfMeasure	UOM		ON UOM.Unit_ID	= TMP.UnitId

ORDER BY	SampleId, [JN_Parameter]

