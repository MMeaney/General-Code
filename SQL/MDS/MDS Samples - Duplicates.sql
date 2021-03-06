-- *******************************************************
-- *** List of duplicate samples in Eden MDS
-- *******************************************************

USE [EdenMDS-PRD]

DECLARE @Samp_Code	VARCHAR(25)		= NULL,
		@Org_Name	VARCHAR(100)	= NULL,
		@Ret_Type	VARCHAR(100)	= NULL,
		@Samp_Year	VARCHAR(4)		= NULL;

-- ****************************************************
-- *** Set input parameters,
-- *** e.g. Organisation, sample year, data type, etc.


SET	@Samp_Code	= ''
SET @Org_Name	= 'MEATH%'
SET @Ret_Type	= '%DRINK%'
SET @Samp_Year	= '2016'

-- ****************************************************
-- *** Create temp table with duplicates

IF  OBJECT_ID('TempDB#tmpDuplicates') IS NOT NULL
	BEGIN	DROP TABLE #tmpDuplicates	END

SELECT DISTINCT
	SOR.Name
	, SOR.Code						AS [LACode]
	, MET.Name_met					AS [ReturnType]
	, SAM.SampleLabCode_sam			AS [SampleCode]
	, COUNT(SAM.SampleLabCode_sam)	AS [DupeCount]

INTO	#tmpDuplicates

FROM		dbo.tblSample_sam					SAM
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta				= SAM.StationID_sta
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org			= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR	ON	SOR.Code						= ORG.StaticName_org
LEFT JOIN	dbo.tblMonitoredEntity_men			MEN ON	MEN.MonitoredEntityId_men		= STA.MonitoredEntityId_men
LEFT JOIN	dbo.tblMonitoredEntityType_met		MET ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblSchemeYear_scy				SCY ON	SCY.MonitoredEntityId_men		= MEN.MonitoredEntityId_men

WHERE	SOR.Name				LIKE @Org_Name	+ '%'
AND		MET.Name_met			LIKE '%' + @Ret_Type	+ '%'
AND		YEAR(SAM.Date_sam)		LIKE '%' + @Samp_Year	+ '%'

GROUP BY
	SOR.Name
	, SOR.Code
	, MET.Name_met
	, SAM.SampleLabCode_sam

HAVING	COUNT(SAM.SampleLabCode_sam) > 1

SELECT DISTINCT * FROM #tmpDuplicates ORDER BY [SampleCode]

SELECT DISTINCT
	SOR.Name					AS	[LA Name]
	--, MEA.MeasurementID_mea
	--, AUP.Name_aup
	, SOR.Code					AS	[LA Code]
	, MET.Name_met				AS	[Return Type]
	, MEN.NationalCode_men		AS	[EDEN Entity Code]
	, MEN.Name_men				AS	[Mon Ent Name]
	, STA.NationalCode_sta		AS	[Station National Code]
	, STA.Name_sta				AS	[Station Name]
	, SAM.SampleLabCode_sam		AS	[Sample Code]
	, SAM.Date_sam				AS	[Sample Date]
	, SAM.CompletionDate_sam	AS	[Sample Complete Date]
	, SAM.SampleID_sam
	----, MEA.MeasurementID_mea
	--, MEA.Result_mea
	--, ENP.Name_enp				AS	[Parameter]
	--, MEU.ShortDescription_meu	AS	[UOM]
	--, PTR.Name_ptr				AS	[Uploaded Parameter]
	--, MEU.LongDescription_meu
	----, MEUX.ShortDescription_meu	AS	[UOM_TR]
	------, MEUX.Code_meu
	----, LIM.Name_lim
	----, LIM.InstallationId_lim
	----, SAT.Description_sat		AS	[Sample Type]
	----, SMT.Name_smt				AS	[Sampling Method]
	----, SAP.Name_sap				AS	[Sample Purpose]
	----, STT.StaticName_stt		AS	[Station Type]
	------, MEA.Accredited_mea
	, SAM.LastUpdateDate_sam
	, SAM.Sampler_sam
	, LTRIM(RTRIM(ULB.FirstName_usr)) + ' ' + LTRIM(RTRIM(ULB.LastName_usr)) AS	[UploadedBy]
	, ULB.Email_usr AS [Uploader_Email]
	, SAM.ApprovalDate_sam
	, LTRIM(RTRIM(UAP.FirstName_usr)) + ' ' + LTRIM(RTRIM(UAP.LastName_usr)) AS	[ApprovedBy]
	, UAP.Email_usr AS [Approver_Email]
	, LTRIM(RTRIM(UAT.FirstName_usr)) + ' ' + LTRIM(RTRIM(UAT.LastName_usr)) AS	[AuthLvlSetBy]
	, AUT.LastUpdateDate_flv	AS	[AuthLvlSetDate]
	, ULD.UploadId_uld
	, ULD.filename_uld
	--, ULD.UploadDate_uld
	--, ULD.Data_uld
	----, AUP.Name_aup
	, SAM.RevisionComment_sam

FROM		dbo.tblSample_sam					SAM
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta				= SAM.StationID_sta
LEFT JOIN	dbo.tblMeasurement_mea				MEA	ON	MEA.SampleID_sam				= SAM.SampleID_sam
LEFT JOIN	dbo.tblMeasurementUnit_meu			MEU	ON	MEU.MeasurementUnitID_meu		= MEA.MeasurementUnitID_meu
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org			= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR	ON	SOR.Code						= ORG.StaticName_org
LEFT JOIN	dbo.tblUpload_uld					ULD	ON	ULD.UploadId_uld				= SAM.UploadId_uld
LEFT JOIN	dbo.tblUser_usr						ULB ON	ULB.UserID_usr					= ULD.LastUpdatedBy_usr
LEFT JOIN	dbo.tblUser_usr						UAP ON	UAP.UserID_usr					= SAM.ApprovedBy_usr
LEFT JOIN	dbo.tblMonitoredEntity_men			MEN ON	MEN.MonitoredEntityId_men		= STA.MonitoredEntityId_men
LEFT JOIN	dbo.tblMonitoredEntityType_met		MET ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblSchemeYear_scy				SCY ON	SCY.MonitoredEntityId_men		= MEN.MonitoredEntityId_men
LEFT JOIN	dbo.tblReturnYear_rty				RTY ON	RTY.ReturnYear_rty				= SCY.ReturnYear_rty
LEFT JOIN	dbo.tblReturnYearStatus_rst			RST ON	RST.StatusID_rst				= RTY.StatusID_rst
LEFT JOIN	dbo.tblSamplePurpose_sap			SAP	ON	SAP.SamplePurposeID_sap			= SAM.SamplePurposeID_sap
LEFT JOIN	dbo.tblSampleType_sat				SAT	ON	SAT.SampleTypeID_sat			= SAM.SampleTypeID_sat
LEFT JOIN	dbo.tblSampleAuthorization_aut		AUT ON	AUT.SampleID_sam				= SAM.SampleID_sam
LEFT JOIN	dbo.tblSamplingMethod_smt			SMT ON	SMT.SamplingMethodID_smt		= SAM.SamplingMethodID_smt
LEFT JOIN	dbo.tblStationType_stt				STT	ON	STT.StationTypeId_stt			= STA.StationTypeId_stt
LEFT JOIN	dbo.tblAuthorizationPurpose_aup		AUP ON	AUP.AuthorizationPurposeID_aup	= AUT.AuthorizationPurposeID_aup
LEFT JOIN	dbo.tblUser_usr						UAT ON	UAT.UserID_usr					= AUT.LastUpdatedBy_usr
LEFT JOIN	dbo.tblLimsInstallations_lim		LIM	ON	LIM.InstallationId_lim			= SAM.SourceSystem_lim
LEFT JOIN	dbo.tblEnvironmentalParameter_enp	ENP	ON	ENP.EnvironmentalParameterID_enp = MEA.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblParameterTranslation_ptr		PTR ON	(
														PTR.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
														AND
														PTR.InstallationId_lim				= SAM.SourceSystem_lim
														)
LEFT JOIN	dbo.tblUser_usr								UPT	 ON	UPT.UserID_usr						= PTR.LastUpdatedBy_usr
LEFT JOIN	dbo.tblParameterMeasurementUnitMatrix_pmx	PMX	 ON	PMX.EnvironmentalParameterId_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblMeasurementUnit_meu					MEUX ON	MEUX.MeasurementUnitID_meu			= PMX.MeasurementUnitID_meu

WHERE	SAM.SampleLabCode_sam	IN
(
	SELECT DISTINCT [SampleCode] FROM #tmpDuplicates
)

ORDER BY SAM.SampleLabCode_sam, SOR.Name, STA.NationalCode_sta, [Sample Date], [Mon Ent Name]

BEGIN	DROP TABLE #tmpDuplicates	END