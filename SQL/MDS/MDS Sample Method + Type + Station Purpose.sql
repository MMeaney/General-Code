USE [EdenMDS-PRD]
SELECT 
	ORGSSO.Name					AS	[Organisation]
	, LIM.Description_lim
	, SAP.Name_sap				AS	[Sample Purpose]
	, STT.StaticName_stt		AS	[Station Type]
	, SAT.Code_sat				AS	[Sample Type]
	, SMT.Code_smt				AS	[Sampling Merthod]
	, SPT.Name_spt				AS	[Sample Purpose Translation]
	, SPT.RegulatoryBody_spt
	, LTRIM(RTRIM(USR.FirstName_usr)) + ' ' + LTRIM(RTRIM(USR.LastName_usr))	AS	[Updated By]
	, SPT.LastUpdateDate_spt
	, SPT.Default_spt
	, SPT.LIMSSamplePurpose_spt
	, SPT.NationalYN_spt

FROM		dbo.tblSamplePurposeTranslation_spt	SPT
LEFT JOIN	dbo.tblLimsInstallations_lim		LIM		ON	SPT.InstallationId_lim		=	LIM.InstallationId_lim
LEFT JOIN	dbo.tblOrganisation_org				ORG		ON	ORG.OrganisationId_org		=	LIM.OwnerOrganisationId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		ORGSSO	ON	ORGSSO.Code					=	ORG.StaticName_org
LEFT JOIN	dbo.tblSamplePurpose_sap			SAP		ON	SAP.SamplePurposeID_sap		=	SPT.SamplePurposeID_sap
LEFT JOIN	dbo.tblStationType_stt				STT		ON	STT.StationTypeId_stt		=	SPT.StationType_stt
LEFT JOIN	dbo.tblUser_usr						USR		ON	USR.UserID_usr				=	SPT.LastUpdatedBy_usr
LEFT JOIN	dbo.tblSample_sam					SAM		ON	SAM.SamplePurposeID_sap		=	SPT.SamplePurposeID_sap
LEFT JOIN	dbo.tblSampleType_sat				SAT		ON	SAT.SampleTypeID_sat		=	SAM.SampleTypeID_sat
LEFT JOIN	dbo.tblSamplingMethod_smt			SMT		ON	SMT.SamplingMethodID_smt	=	SAM.SamplingMethodID_smt

WHERE	--SPT.InstallationId_lim	= '77ceb35c-8fe6-44aa-b980-d421f35b348b'
--AND		SAM.SampleLabCode_sam	= '162500672'
--AND	

SAP.Name_sap LIKE '%Abstraction - A3'
--SPT.Name_spt	LIKE '%SUR%'