-- *******************************************************
-- *** List of approved samples in Eden MDS
-- *******************************************************

USE [EdenMDS-STG]

/*
IF  OBJECT_ID('TempDB..#tmpMeasSTD_DEV') IS NOT NULL
	BEGIN	DROP TABLE #tmpMeasSTD_DEV	END

SELECT 
	MET.Name_met					AS [Return_Type] 
	, ENP.Name_enp					AS [Parameter] 
	, MEU.ShortDescription_meu		AS [UOM] 
	, COUNT(MEA.Result_mea)			AS [Count]
	, CAST(STDEVP(MEA.Result_mea)	AS INTEGER)	AS [Std_DevP] 
	, CAST(STDEV(MEA.Result_mea)	AS INTEGER)	AS [Std_Dev] 
	, CAST(MIN(MEA.Result_mea)		AS INTEGER)	AS [Min] 
	, CAST(MAX(MEA.Result_mea)		AS INTEGER)	AS [Max] 
	, CAST(AVG(MEA.Result_mea)		AS INTEGER)	AS [Avg] 
	, CAST((MAX(MEA.Result_mea) - AVG(MEA.Result_mea))	AS INTEGER) AS [MaxFromAVG] 

INTO	#tmpMeasSTD_DEV

FROM		dbo.tblSample_sam					SAM 
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta				= SAM.StationID_sta 
LEFT JOIN	dbo.tblMeasurement_mea				MEA	ON	MEA.SampleID_sam				= SAM.SampleID_sam 
LEFT JOIN	dbo.tblMeasurementUnit_meu			MEU	ON	MEU.MeasurementUnitID_meu		= MEA.MeasurementUnitID_meu 
LEFT JOIN	dbo.tblMonitoredEntity_men			MEN ON	MEN.MonitoredEntityId_men		= STA.MonitoredEntityId_men 
LEFT JOIN	dbo.tblMonitoredEntityType_met		MET ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met 
LEFT JOIN	dbo.tblEnvironmentalParameter_enp	ENP	ON	ENP.EnvironmentalParameterID_enp = MEA.EnvironmentalParameterID_enp

WHERE	MEA.Result_mea	IS NOT NULL
AND		MEA.Result_mea	<> 0

GROUP BY	MET.Name_met, ENP.Name_enp, MEU.ShortDescription_meu 
HAVING		COUNT(MEA.Result_mea)	> 1
ORDER BY	MET.Name_met, ENP.Name_enp, MEU.ShortDescription_meu

SELECT * FROM #tmpMeasSTD_DEV
--*/

--/*
SELECT DISTINCT
	SAM.SampleID_sam
	, MEA.MeasurementID_mea
	, SOR.Name					AS	[LA_Name]
	, SOR.Code					AS	[LA_Code]
	, MET.Name_met				AS	[Return_Type]
	, MEN.NationalCode_men		AS	[EDEN_Entity_Code]
	, MEN.Name_men				AS	[Mon_Ent_Name]
	, STA.NationalCode_sta		AS	[Station_National_Code]
	, STA.Name_sta				AS	[Station_Name]
	, SAM.SampleLabCode_sam		AS	[Sample_Code]
	, SAM.Date_sam				AS	[Sample_Date]
	, SAM.CompletionDate_sam	AS	[Sample_Complete_Date]
	, YEAR(SAM.Date_sam)		AS	[Sample_Year]
	, MEA.Result_mea
	, ENP.Name_enp				AS	[Parameter]
	, MEU.ShortDescription_meu	AS	[UOM]
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
	, SAM.RevisionComment_sam
	, SAP.Name_sap
	, MEA.LastUpdateDate_mea
	, STA.Easting_sta
	, STA.Northing_sta
	, MEA.Result_mea
	, STD_DEV.[Avg]
	, STD_DEV.*
FROM		dbo.tblSample_sam					SAM
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta				= SAM.StationID_sta
LEFT JOIN	dbo.tblMeasurement_mea				MEA	ON	MEA.SampleID_sam				= SAM.SampleID_sam
LEFT JOIN	dbo.tblMeasurementUnit_meu			MEU	ON	MEU.MeasurementUnitID_meu		= MEA.MeasurementUnitID_meu
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org			= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-STG].dbo.Organisation		SOR	ON	SOR.Code						= ORG.StaticName_org
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
LEFT JOIN	#tmpMeasSTD_DEV		STD_DEV	ON (STD_DEV.[Return_Type]	= MET.Name_met 
										AND STD_DEV.[Parameter]		= ENP.Name_enp 
										AND	STD_DEV.[UOM]			= MEU.ShortDescription_meu
										)
WHERE	SOR.Name			 LIKE	'%Leitrim%'
--AND		MET.Name_met		 LIKE	 '%Lake%'
AND		YEAR(SAM.Date_sam) > '2016'
AND		MEA.Result_mea	IS NOT NULL
AND		MEA.Result_mea	<> 0
--AND		MEA.Result_mea) - AVG(MEA.Result_mea)) = STDEV(MEA.Result_mea)

--*/