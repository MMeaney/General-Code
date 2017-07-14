USE [EPACentral_Aquarius]

SELECT DISTINCT 
--TOP (25)
	MNT.MonEnt_ID
	, MNT.fkWasteWater_ID
	, WW.WW_Name
	, MNT.Org_ID
	, ORG.Org_Code
	, ORG.Org_Name
	, ORT.OrgType_Desc
	, MNT.MonEnt_Code
	, STA.Station_Code
	, STA.EdenNationalCode
	, STA.Station_Name
	, THM.Theme_Desc
	, SMP.Samp_ID
	, SMP.Details
	, SMP.Samp_Date
	, SMP.Samp_LabName
	, SMP.Comp_Date
	, SMP.Samp_AnalName
	, SMT.SampleMethod_Name
	--, SMP.Hchk_ID AS [SMP_Hchk_ID]
	, MSM.Hchk_ID AS [MSM_Hchk_ID]
	, PRM.Hchk_ID AS [PRM_Hchk_ID]
	, MSM.Samp_ID
	--, MSM.Prm_ID
	, MSM.Meas_Date
	, MSM.Meas_UpdNo
	--, MSM.Meas_CompSym
	, MSM.Meas_Result
	, MSM.Meas_TextResult
	, MSM.Analyst
	, MSM.Comment
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
	, PMT.PrmTyp_Desc
	--, PRM.Prm_id
	--, PRM.Prm_Code
	, PRM.Prm_Desc
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
	, UNT.Unit_Code
	, UNT.Unit_Name
	, UNT.EdenUnit
	--, UNT.DeletedStatus AS [UNT_Del_Status]
	, CNT.Container_Desc
FROM EPACentral_aquarius.dbo.MonitoredEntity MNT
	INNER JOIN	MonitoredLocation	MLC	ON	MLC.MonitoredEntity_ID	= MNT.MonEnt_ID
	INNER JOIN	WasteWater			WW	ON	WW.WW_ID				= MNT.fkWasteWater_ID
	INNER JOIN	WasteWaterStation	STA	ON	STA.Station_Code		= MLC.MonitoredLocation_Code
										AND STA.WW_ID				= MNT.fkWasteWater_ID
	INNER JOIN	Theme				THM	ON	THM.Theme_id			= MNT.Theme_ID
	INNER JOIN	Organisations		ORG	ON	ORG.Org_Id				= MNT.Org_ID
	INNER JOIN	OrganisationTypes	ORT	ON	ORT.OrgTyp_ID			= ORG.OrgTyp_ID
	INNER JOIN	Sample				SMP	ON	SMP.MonEnt_ID			= MNT.MonEnt_ID
	LEFT JOIN	SampleMethod		SMT	ON	SMT.SampleMethod_ID		= SMP.SampleMethod_ID
	INNER JOIN	Measurements		MSM	ON	MSM.Samp_ID				= SMP.Samp_ID
	INNER JOIN	Parameter			PRM ON	PRM.Prm_id				= MSM.Prm_ID
	INNER JOIN	ParameterType		PMT	ON	PMT.PrmTyp_id			= PRM.PrmTyp_ID
	LEFT JOIN	UnitOfMeasure		UNT ON	UNT.Unit_ID				= PRM.Unit_ID
	LEFT JOIN	Container			CNT ON	CNT.Container_Id		= PRM.Container_Id
WHERE
--STA.EdenNationalCode = 'BPNBF310000200001'
--ORG.Org_ID = '156' -- Tipperary County Council
--ORG.Org_ID = '157' -- Waterford City and County Council
--ORG.Org_Code = '2901' -- Clonmel Borough Council
--ORG.Org_Code = '3700' -- Tipperary County Council
ORG.Org_Code = '3800' -- Waterford City and County Council
--SMP.Samp_ID LIKE '1264868'
--MSM.FromEDEN <> '2'
--AND Samp_AnalName = 'Paul  Carroll'
--AND MSM.FileIdentity = 'cbb9cae6-ae11-4e1e-83da-04b3532b97ca'