-- *******************************************************
-- ** List of approved samples in Eden MDS
-- ** from 2013 onwards
-- *******************************************************

USE [EdenMDS-PRD]

IF  OBJECT_ID('TempDB..#tmpSampReturns') IS NOT NULL
	BEGIN	DROP TABLE #tmpSampReturns	END

SELECT DISTINCT
	AUP.Name_aup				AS	[Current Authorisation Level]
	, SOR.Name					AS	[Local Authority]
	, DATEPART(YEAR,SAM.Date_sam)		AS	[Sample Year]
	, MEN.NationalCode_men + ' - ' + REPLACE(REPLACE(MEN.Name_men, CHAR(13), ' '), CHAR(10), ' ')	AS	[Monitored Entity]
	, STA.NationalCode_sta + ' - ' + REPLACE(REPLACE(STA.Name_sta, CHAR(13), ' '), CHAR(10), ' ')	AS	[Station]
	, SAM.SampleLabCode_sam		AS	[Sample Code]
	, SAM.Date_sam				AS	[Sample Date]
	, SAM.ApprovalDate_sam		AS	[Sample Approval Date]
	, SAM.Version_sam			AS	[Revision]
	, SAP.Name_sap				AS	[Sample Purpose]
	, MET.Name_met				AS	[Data Type]
	, SMT.Name_smt				AS	[Sampling Method]
	, SAT.Description_sat		AS	[Sample Reason]
	, SAM.CompletionDate_sam	AS	[Completion Date]
	, SAM.Sampler_sam			AS	[SampledBy]
	, REPLACE(REPLACE(SAM.Details_sam, CHAR(13), ' '), CHAR(10), ' ')	AS	[Details]
	, ULD.UploadDate_uld		AS	[UploadDate]

INTO		#tmpSampReturns	

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
LEFT JOIN	dbo.tblParameterTranslation_ptr		PTR	ON	PTR.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblLimsInstallations_lim		LIM	ON  LIM.InstallationId_lim				= PTR.InstallationId_lim
LEFT JOIN	dbo.tblSchemeYear_scy				SCY	ON	SCY.MonitoredEntityId_men			= MEN.MonitoredEntityId_men
LEFT JOIN	dbo.tblReturnYear_rty				RTY	ON	RTY.ReturnYear_rty					= SCY.ReturnYear_rty
LEFT JOIN	dbo.tblReturnYearStatus_rst			RST	ON	RST.StatusID_rst					= RTY.StatusID_rst
LEFT JOIN	dbo.tblSamplePurpose_sap			SAP	ON	SAP.SamplePurposeID_sap				= SAM.SamplePurposeID_sap
LEFT JOIN	dbo.tblSampleType_sat				SAT	ON	SAT.SampleTypeID_sat				= SAM.SampleTypeID_sat
LEFT JOIN	dbo.tblSampleAuthorization_aut		AUT ON	AUT.SampleID_sam					= SAM.SampleID_sam
LEFT JOIN	dbo.tblAuthorizationPurpose_aup		AUP ON	AUP.AuthorizationPurposeID_aup		= AUT.AuthorizationPurposeID_aup
LEFT JOIN	dbo.tblSamplingMethod_smt			SMT	ON	SMT.SamplingMethodID_smt			= SAM.SamplingMethodID_smt

WHERE	YEAR(SAM.Date_sam)	> 2012

SELECT DISTINCT
	LTRIM(
		STUFF((
			SELECT ', ' + RET2.[Current Authorisation Level]
			FROM	 #tmpSampReturns	RET2
			WHERE	 RET2.[Station]		= RET1.[Station]
			AND		 RET2.[Sample Code]	= RET1.[Sample Code]
			AND		 RET2.[Sample Date]	= RET1.[Sample Date]
			ORDER BY RET2.[Current Authorisation Level]
			FOR XML PATH('') 
		), 1 ,1 , '')
	) AS [Current Authorisation Level]
	, [Local Authority]
	, [Sample Year]
	, [Monitored Entity]
	, [Station]
	, [Sample Code]
	, [Sample Date]
	, [Sample Approval Date]
	, [Revision]
	, [Sample Purpose]
	, [Data Type]
	, [Sampling Method]
	, [Sample Reason]
	, [Completion Date]
	, [SampledBy]
	, [Details]
	, [UploadDate]
FROM	#tmpSampReturns	RET1
ORDER BY RET1.[Local Authority], [Sample Year], RET1.[Data Type], RET1.[Sample Purpose], RET1.[Monitored Entity], RET1.[Station], RET1.[Sample Date]
