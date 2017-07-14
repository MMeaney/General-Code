USE [EPACentral_Aquarius]

SELECT DISTINCT 
--TOP (25)
	BTW.BathingWater_Name
	, MNT.fkBathingWater_ID
	--, MNT.Org_ID
	, ORG.Org_Code
	, ORG.Org_Name
	, MNT.MonEnt_Code
	, STA.Station_Code
	, STA.EdenNationalCode
	, STA.Station_Name
	, THM.Theme_Desc
	, SMP.Samp_ID
	, SMP.Details
	, SMP.Samp_Date
	, MSM.Meas_Date
	, SMP.Comp_Date
	, SMP.Samp_LabName
	, SMP.Samp_AnalName
	, SMT.SampleMethod_Name
	--, SMP.Hchk_ID AS [SMP_Hchk_ID]
	, MSM.Hchk_ID AS [MSM_Hchk_ID]
	, PRM.Hchk_ID AS [PRM_Hchk_ID]
	, MSM.Samp_ID
	--, MSM.Prm_ID
	, PRM.Prm_Desc
	--, MSM.Meas_CompSym
	, MSM.Meas_Result
	, MSM.Meas_TextResult
	, UNT.Unit_Code
	, UNT.Unit_Name
	, MSM.Analyst
	, MSM.MinimumRequiredConcentration	AS [MinReqConc]
	, MSM.MaximumAllowedConcentration	AS [MaxAllConc]
	, MSM.LimitOfDetection
	--, MSM.LimitOfQuantification
	--, MSM.MethodOfAnalysis
	--, MSM.Unit_ID
	, MSM.Uncertainty
	, MSM.UncertaintyUnit
	, MSM.ConfidenceInterval
	, MSM.AccreditedResult
	, MSM.StatusMAC
	, MSM.StatusMRC
	, MSM.ResultString
	, MSM.VerifiedStatus
	, MSM.FromEDEN
	, MSM.Report_Meas_Result
	, MSM.Report_Meas_TextResult
	, MSM.Report_ResultString
	, MSM.Report_Limit
	, MSM.FileIdentity
	, MSM.Comment
	, MSM.Meas_UpdNo
	, MNT.MonEnt_ID
	, PMT.PrmTyp_Desc
	--, PRM.Prm_id
	--, PRM.Prm_Code
	--, PRM.Theme_ID
	, PRM.Prm_ChemForm
	, PRM.Prm_LowLimit
	, PRM.Prm_UprLimit
	, PRM.Prm_DetDesc
	--, PRM.Prm_AAName
	--, PRM.Unit_ID
	--, PRM.Prm_ManAud
	--, PRM.Prm_ManCheck
	--, PRM.DeletedStatus AS [PRM_Del_Status]
	, PRM.Hazardous
	, PRM.Nutrient
	--, PRM.CASNumber
	--, PRM.PrmSubTyp_Id
	--, PRM.EPALicenceName
	--, PRM.EU_Prm_Code
	, UNT.EdenUnit
	--, UNT.DeletedStatus AS [UNT_Del_Status]
	, CNT.Container_Desc
FROM EPACentral_aquarius.dbo.MonitoredEntity MNT
	INNER JOIN	MonitoredLocation	MLC	ON	MLC.MonitoredEntity_ID	= MNT.MonEnt_ID
	INNER JOIN	BathingWater		BTW	ON	BTW.BathingWater_ID		= MNT.fkBathingWater_ID
	INNER JOIN	BathingWaterStation	STA	ON	STA.Station_Code		= MLC.MonitoredLocation_Code
										AND STA.BathingWater_ID		= MNT.fkBathingWater_ID
	INNER JOIN	Theme				THM	ON	THM.Theme_id			= MNT.Theme_ID
	INNER JOIN	Organisations		ORG	ON	ORG.Org_Id				= MNT.Org_ID
	INNER JOIN	Sample				SMP	ON	SMP.MonEnt_ID			= MNT.MonEnt_ID
	INNER JOIN	SampleMethod		SMT	ON	SMT.SampleMethod_ID		= SMP.SampleMethod_ID
	INNER JOIN	Measurements		MSM	ON	MSM.Samp_ID				= SMP.Samp_ID
	INNER JOIN	Parameter			PRM ON	PRM.Prm_id				= MSM.Prm_ID
	INNER JOIN	ParameterType		PMT	ON	PMT.PrmTyp_id			= PRM.PrmTyp_ID
	INNER JOIN	UnitOfMeasure		UNT ON	UNT.Unit_ID				= PRM.Unit_ID
	LEFT JOIN	Container			CNT ON	CNT.Container_Id		= PRM.Container_Id
WHERE	BTW.Org_ID = '157'
AND		SMP.Samp_Date	= '2015-06-15 00:00:00.000'
		--STA.EdenNationalCode = 'BPNBF310000200001'
		--BTW.BathingWater_Code = '31000003'
		--SMP.Samp_ID LIKE '1264868'
		--MSM.FromEDEN <> '2'
ORDER BY	BTW.BathingWater_Name
			, STA.Station_Name
			, SMP.Samp_Date