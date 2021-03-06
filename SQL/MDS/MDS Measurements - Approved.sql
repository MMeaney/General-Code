-- *******************************************************
-- *** List of approved measurements in Eden MDS
-- *******************************************************

USE [EdenMDS-PRD]

SELECT DISTINCT
	SAM.SampleLabCode_sam AS [SampCode]
	, SOR.Name
	, MET.Name_met
	--, MEN.Name_men
	, STA.Name_sta
	, STA.NationalCode_sta
	, SAM.Date_sam
	, MEA.MeasurementID_mea
	, MEA.Accredited_mea
	, ENP.Name_enp
	, PTR.Name_ptr
	, MEU.ShortDescription_meu
	, MEA.Result_mea
	, MEA.TextResult_mea
	, MEA.ResultType_mea
	--, MEU.Code_meu
	--, ENP.Code_enp
	, SAM.SampleID_sam
	, ORG.StaticName_org
	, LTRIM(RTRIM(ULB.FirstName_usr)) + ' ' + LTRIM(RTRIM(ULB.LastName_usr)) AS	[UploadedBy]
	, LTRIM(RTRIM(UAP.FirstName_usr)) + ' ' + LTRIM(RTRIM(UAP.LastName_usr)) AS	[ApprovedBy]
	, ULB.Email_usr
	, ULB.Phone_usr
	, ULB.Mobile_usr
	, SAM.LastUpdateDate_sam	
	, MET.Name_met				AS	[MonitoredEntityType]
	, SAT.Description_sat		AS	[Sample Type]
	, SAP.Name_sap				AS	[Sample Purpose]
	, SMT.Name_smt				AS	[Sampling Method]
	, ULD.UploadDate_uld
	--, LTRIM(RTRIM(UAT.FirstName_usr)) + ' ' + LTRIM(RTRIM(UAT.LastName_usr)) AS	[AuthLvlSetBy]
	--, AUT.LastUpdateDate_flv	AS	[AuthLvlSetDate]
	, ULD.filename_uld
	--, ULD.UploadId_uld
	--, AUP.Name_aup				AS	[Current Authorisation Level]
	--, RTY.ReturnYear_rty
	--, RTY.CurrentYear_rty
	--, RST.Name_rst AS [ReturnYearStatus]
	
FROM		dbo.tblSample_sam					SAM
LEFT JOIN	dbo.tblMeasurement_mea				MEA	ON	MEA.SampleID_sam					= SAM.SampleID_sam
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta					= SAM.StationID_sta
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org				= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR	ON	SOR.Code							= ORG.StaticName_org
LEFT JOIN	dbo.tblUpload_uld					ULD	ON	ULD.UploadId_uld					= SAM.UploadId_uld
LEFT JOIN	dbo.tblUser_usr						ULB	ON	ULB.UserID_usr						= ULD.LastUpdatedBy_usr
LEFT JOIN	dbo.tblUser_usr						UAP ON	UAP.UserID_usr						= SAM.ApprovedBy_usr
LEFT JOIN	dbo.tblMonitoredEntity_men			MEN	ON	MEN.MonitoredEntityId_men			= STA.MonitoredEntityId_men
LEFT JOIN	dbo.tblMonitoredEntityType_met		MET	ON	MET.MonitoredEntityTypeID_met		= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblMeasurementUnit_meu			MEU	ON	MEU.MeasurementUnitID_meu			= MEA.MeasurementUnitId_meu
LEFT JOIN	dbo.tblEnvironmentalParameter_enp	ENP	ON	ENP.EnvironmentalParameterID_enp	= MEA.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblLimsInstallations_lim		LIM	ON  LIM.InstallationId_lim				= SAM.SourceSystem_lim
LEFT JOIN	dbo.tblSchemeYear_scy				SCY	ON	SCY.MonitoredEntityId_men			= MEN.MonitoredEntityId_men
LEFT JOIN	dbo.tblReturnYear_rty				RTY	ON	RTY.ReturnYear_rty					= SCY.ReturnYear_rty
LEFT JOIN	dbo.tblReturnYearStatus_rst			RST	ON	RST.StatusID_rst					= RTY.StatusID_rst
LEFT JOIN	dbo.tblSamplePurpose_sap			SAP	ON	SAP.SamplePurposeID_sap				= SAM.SamplePurposeID_sap
LEFT JOIN	dbo.tblSampleType_sat				SAT	ON	SAT.SampleTypeID_sat				= SAM.SampleTypeID_sat
LEFT JOIN	dbo.tblSampleAuthorization_aut		AUT ON	AUT.SampleID_sam					= SAM.SampleID_sam
LEFT JOIN	dbo.tblAuthorizationPurpose_aup		AUP ON	AUP.AuthorizationPurposeID_aup		= AUT.AuthorizationPurposeID_aup
LEFT JOIN	dbo.tblUser_usr						UAT ON	UAT.UserID_usr						= AUT.LastUpdatedBy_usr
LEFT JOIN	dbo.tblSamplingMethod_smt			SMT	ON	SMT.SamplingMethodID_smt			= SAM.SamplingMethodID_smt
LEFT JOIN	dbo.tblParameterTranslation_ptr		PTR ON	(
														PTR.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
														AND
														PTR.InstallationId_lim				= SAM.SourceSystem_lim
														)
LEFT JOIN	dbo.tblUser_usr								UPT ON	UPT.UserID_usr						= PTR.LastUpdatedBy_usr
LEFT JOIN	dbo.tblParameterMeasurementUnitMatrix_pmx	PMX	 ON	PMX.EnvironmentalParameterId_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblMeasurementUnit_meu					MEUX ON	MEUX.MeasurementUnitID_meu			= PMX.MeasurementUnitID_meu

WHERE		STA.NationalCode_sta IN
(
'RS23F010324',
'RS25S012561'
)
--WHERE	SAM.SampleLabCode_sam	= '1537CM1506274'

--AND	(ENP.Name_enp	LIKE '%Odour%' OR ENP.Name_enp	LIKE '%Taste%')
--WHERE SMT.Name_smt	LIKE '%TRAC%'
----WHERE SOR.Name LIKE '%Waterford%'
--WHERE ULD.FileId_uld = '5bbebdab-6818-420c-a13a-bde64e367990'
--WHERE	SAM.SampleLabCode_sam = '15370042'
--WHERE	MET.Name_met	LIKE '%DRINK%'
--WHERE	ULD.filename_uld = 'FinalisedAmbientMonitoring2015.xml'
--AND		ENP.Name_enp	LIKE '%Conductivity @ 25°C (on-site)%'
----AND		MET.Name_met	LIKE '%DRINK%'
ORDER BY STA.NationalCode_sta, ULD.UploadDate_uld DESC, SAM.Date_sam DESC, SAM.SampleLabCode_sam, ENP.Name_enp


--SELECT * FROM tblEnvironmentalParameter_enp WHERE Name_enp = 'Hydrogen Fluoride' ORDER BY Name_enp


/*

WHERE	MET.Name_met	LIKE	'%BATH%'
AND		ENP.Name_enp	LIKE	'%E. Coli%'
AND		STA.Name_sta	LIKE	'%WOODSTOWN%'
AND		MEA.Result_mea	IS NOT NULL


ORDER BY SAM.Date_sam, MEA.Result_mea DESC, STA.Name_sta, SAM.SampleLabCode_sam
*/

/*

SELECT DISTINCT 
	RTY.ReturnYear_rty
	, RTY.CurrentYear_rty
	, MET.Name_met AS [MonitoredEntityType]
	, RST.Name_rst AS [ReturnYearStatus]
FROM dbo.tblReturnYear_rty RTY
LEFT JOIN	dbo.tblMonitoredEntityType_met	MET ON MET.MonitoredEntityTypeID_met	= RTY.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblReturnYearStatus_rst		RST ON RST.StatusID_rst					= RTY.StatusID_rst


	--, RTY.ReturnYear_rty
	--, MEN.NationalCode_men
	--, SAM.Sampler_sam
	--, SAM.ApprovalDate_sam
	----, MEU.LongDescription_meu
	----, RST.Name_rst
	----, SAM.SampleID_sam
	----, SAM.Details_sam
	----, SAM.RevisionComment_sam
	----, ULD.Comments_uld

--AND		MEU.Code_meu	=		'MEASUREMENT_UNIT_91'
--AND		MEA.Result_mea	>		'500'
--AND		SSOORG.Name		LIKE	'%FINGAL%'
--AND		DATEPART(Year, SAM.Date_sam)  IN ('2014', '2015')
--AND		ULD.UploadDate_uld > '2015-07-15 00:00:00.000'
--AND		SAM.SampleLabCode_sam	=	'1533WW003A0204A207'
--AND		RTY.ReturnYear_rty	=	'2014'
--AND		ULD.FileId_uld IN ('3DBdDA0c-0f48-5A7D-f3c4-c68eAE5AEBE0')
--MDSSAM.SampleLabCode_sam = '1335D1300245'
--AND		MDSSTA.NationalCode_sta	LIKE	'%BPBLF060000270001%'
*/

/*
WHERE
	(
	SAM.SampleLabCode_sam	= '15-1156'
	AND	SOR.Code			= '0300'
	)
OR
	(
	SAM.SampleLabCode_sam	= '1019729'
	AND	SOR.Code			= '0700'
	)
ORDER BY SAM.SampleLabCode_sam

*/


/*
-- *********************
-- *** MDS Sample Audit
-- *********************
SELECT * FROM	[EdenMDS-PRD].[dbo].[tblSampleHistory_sht]
WHERE	[SampleLabCode_sht] = '1335D1300245'
--*/