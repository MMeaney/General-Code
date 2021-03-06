USE [EdenMDS-PRD]

SELECT DISTINCT 
	RTY.ReturnYear_rty
	, SFD.ShortFallReasonText_sfd
	, SFD.SamplesRequired_sfd
	--, RTY.CurrentYear_rty
	--, SFD.ShortFall_sfd
	, SFR.StaticName_sfr		AS	[Shortfall Reason]
	, SAP.Name_sap				AS	[Sample Purpose]
	, SFD.SampleCategory_sfd
	, SMT.Name_smt				AS	[Sampling Method]
	, SAT.Description_sat		AS	[Sample Reason]
	, MET.Name_met				AS	[MonitoredEntityType]
	, RST.Name_rst				AS	[ReturnYearStatus]
	, SAM.SampleLabCode_sam		AS	[SampCode]
	, SOR.Name					AS	[Local Authority]
	, MET.Name_met				AS	[Data Type]
	, MEN.NationalCode_men + ' - ' + MEN.Name_men AS [Monitored Entity]
	, STA.NationalCode_sta + ' - ' + STA.Name_sta AS [Station]
	, SAM.Date_sam				AS	[Sample Date]
	, PAR.ParameterReportingName_par
	, ENP.Name_enp				AS	[Parameter]
	, MEU.ShortDescription_meu	AS	[Unit]
	, MEA.Result_mea
	, MEA.ResultType_mea
	, MEA.TextResult_mea
	, ORG.StaticName_org
	, LTRIM(RTRIM(ULB.FirstName_usr)) + ' ' + LTRIM(RTRIM(ULB.LastName_usr)) AS	[UploadedBy]
	, LTRIM(RTRIM(UAP.FirstName_usr)) + ' ' + LTRIM(RTRIM(UAP.LastName_usr)) AS	[ApprovedBy]
	, SAM.LastUpdateDate_sam	AS	[Sample Last Updated]

FROM		dbo.tblSample_sam					SAM
LEFT JOIN	dbo.tblMeasurement_mea				MEA	ON	MEA.SampleID_sam					= SAM.SampleID_sam
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta					= SAM.StationID_sta
LEFT JOIN	dbo.tblMonitoredEntity_men			MEN	ON	MEN.MonitoredEntityId_men			= STA.MonitoredEntityId_men
LEFT JOIN	dbo.tblSchemeYear_scy				SCY	ON	SCY.MonitoredEntityId_men			= MEN.MonitoredEntityId_men
LEFT JOIN	dbo.tblReturnYear_rty				RTY	ON	RTY.ReturnYear_rty					= SCY.ReturnYear_rty
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org				= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR	ON	SOR.Code							= ORG.StaticName_org
LEFT JOIN	dbo.tblUpload_uld					ULD	ON	ULD.UploadId_uld					= SAM.UploadId_uld
LEFT JOIN	dbo.tblUser_usr						ULB	ON	ULB.UserID_usr						= ULD.LastUpdatedBy_usr
LEFT JOIN	dbo.tblUser_usr						UAP ON	UAP.UserID_usr						= SAM.ApprovedBy_usr
LEFT JOIN	dbo.tblMonitoredEntityType_met		MET	ON	MET.MonitoredEntityTypeID_met		= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblMeasurementUnit_meu			MEU	ON	MEU.MeasurementUnitID_meu			= MEA.MeasurementUnitId_meu
LEFT JOIN	dbo.tblEnvironmentalParameter_enp	ENP	ON	ENP.EnvironmentalParameterID_enp	= MEA.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblParameterTranslation_ptr		PTR	ON	PTR.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblLimsInstallations_lim		LIM	ON  LIM.InstallationId_lim				= PTR.InstallationId_lim
LEFT JOIN	dbo.tblReturnYearStatus_rst			RST	ON	RST.StatusID_rst					= RTY.StatusID_rst
LEFT JOIN	dbo.tblStationType_stt				STT	ON	STT.MonitoredEntityTypeId_met		= MET.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblSamplePurpose_sap			SAP	ON	SAP.SamplePurposeID_sap				= SAM.SamplePurposeID_sap
LEFT JOIN	dbo.tblSampleType_sat				SAT	ON	SAT.SampleTypeID_sat				= SAM.SampleTypeID_sat
LEFT JOIN	dbo.tblSampleAuthorization_aut		AUT ON	AUT.SampleID_sam					= SAM.SampleID_sam
LEFT JOIN	dbo.tblAuthorizationPurpose_aup		AUP ON	AUP.AuthorizationPurposeID_aup		= AUT.AuthorizationPurposeID_aup
LEFT JOIN	dbo.tblSamplingMethod_smt			SMT	ON	SMT.SamplingMethodID_smt			= SAM.SamplingMethodID_smt
LEFT JOIN	dbo.tblParameterReportingMembership_prm PRM ON PRM.EnvironmentalParameterID_enp = MEA.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblParameterReporting_par		PAR ON	PAR.ParameterReportingID_par		= PRM.ParameterReportingID_par
LEFT JOIN	dbo.tblShortFallDownload_sfd		SFD	ON	(	SFD.SchemeCode_sfd				= MEN.NationalCode_men
														AND	SFD.ReturnYear_rty				= RTY.ReturnYear_rty
														AND	SFD.ParameterReportingID_par	= SAP.SamplePurposeID_sap
														AND	SFD.MonitoredEntityTypeId_met	= MET.MonitoredEntityTypeID_met
														)
LEFT JOIN	dbo.tblShortFallReason_sfr			SFR ON SFR.ShortFallReasonId_sfr = SFD.ShortFallReasonId_sfr

WHERE		SFD.ShortFall_sfd	<> 1 --IS NOT NULL
AND			MET.Name_met		IN ( 'Drinking Water Public Scheme', 'Drinking Water Private Scheme')
AND			RTY.ReturnYear_rty	> '2014'
AND			YEAR(SAM.Date_sam)	> '2014'
--AND			SOR.Name			LIKE 'Meath%'
--AND			ENP.Name_enp		LIKE '%COLOUR%'
--AND			RST.Name_rst		<>	 'Complete'
--AND			ENP.Name_enp		LIKE '%APPARENT%'
--AND			SFD.SchemeCode_sfd	=	 '2300PRI2009'
--AND			STA.NationalCode_sta =   'DWMON2300PRI20090010'	
ORDER BY	SFD.ShortFallReasonText_sfd DESC, RTY.ReturnYear_rty, [Local Authority], [Monitored Entity], [Station]


/*

	----
	--, SFD.OrganisationId_org
	--, SFD.ReturnYear_rty
	--, SFD.SanitaryAuthority_sfd
	--, SFD.SchemeCode_sfd
	--, SFD.SchemeName_sfd
	--, SFD.SampleCategory_sfd
	--, SFD.PopulationServed_sfd
	--, SFD.SchemeStartDate_sfd
	--, SFD.SchemeEndDate_sfd
	--, SFD.NumberOfSamples_sfd
	--, SFD.SamplesRequired_sfd
	--, SFD.ShortFall_sfd
	--, SFD.ShortFallReasonId_sfr
	--, SFR.StaticName_sfr		AS [Shortfall Reason]
	--, SFD.ShortFallReasonText_sfd
	--, SFD.LastUpdateDate_sfd
	--, SFD.LastUpdatedBy_usr
	--, SFD.ParameterReportingID_par
	--, SFD.MonitoredEntityTypeId_met
	----


--SELECT * FROM tblSampleType_sat
--SELECT * FROM tblSamplePurpose_sap
--SELECT * FROM tblStationType_stt


SELECT DISTINCT
	SFD.ShortFallDownLoadID_sfd
	, SFD.OrganisationId_org
	, SFD.ReturnYear_rty
	, SFD.SanitaryAuthority_sfd
	, SFD.SchemeCode_sfd
	, SFD.SchemeName_sfd
	, SFD.SampleCategory_sfd
	, SFD.PopulationServed_sfd
	, SFD.SchemeStartDate_sfd
	, SFD.SchemeEndDate_sfd
	, SFD.NumberOfSamples_sfd
	, SFD.SamplesRequired_sfd
	, SFD.ShortFall_sfd
	, SFD.ShortFallReasonId_sfr
	, SFR.StaticName_sfr		AS [Shortfall Reason]
	, SFD.ShortFallReasonText_sfd
	, SFD.LastUpdateDate_sfd
	, SFD.LastUpdatedBy_usr
	, SFD.ParameterReportingID_par
	, SFD.MonitoredEntityTypeId_met
FROM dbo.tblShortFallDownload_sfd SFD
LEFT JOIN	dbo.tblShortFallReason_sfr		SFR ON SFR.ShortFallReasonId_sfr = SFD.ShortFallReasonId_sfr
WHERE	SFD.ReturnYear_rty	= '2016'
AND		SFD.SchemeCode_sfd	= '2300PRI2009'
AND		SFD.ShortFall_sfd	IS NOT NULL

/*

USE [EdenMDS-PRD]

SELECT DISTINCT 
	STT.StationTypeId_stt
	, STT.StaticName_stt
	, STT.Name_stt
	, STT.MonitoredEntityTypeId_met
	, STT.LastUpdatedBy_usr
	, STT.LastUpdateDate_stt
	, STT.Editable_stt
	, STT.Creatable_stt
	, STT.Uploadable_stt
FROM dbo.tblStationType_stt	STT

SELECT DISTINCT
	SAP.SamplePurposeID_sap
	, SAP.StationType_stt
	, SAP.Code_sap
	, SAP.RegulatoryBodyID_reg
	, SAP.Name_sap
	, SAP.NationalYN_sap
	, SAP.LastUpdatedBy_usr
	, SAP.LastUpdateDate_sap
FROM dbo.tblSamplePurpose_sap	SAP

SELECT DISTINCT
	PAR.ParameterReportingName_par
	, PAR.SamplePurposeID_sap
	, PAR.ParameterReportingID_par
FROM dbo.tblParameterReporting_par PAR

SELECT DISTINCT
	SFD.ShortFallDownLoadID_sfd
	, SFD.OrganisationId_org
	, SFD.ReturnYear_rty
	, SFD.SanitaryAuthority_sfd
	, SFD.SchemeCode_sfd
	, SFD.SchemeName_sfd
	, SFD.SampleCategory_sfd
	, SFD.PopulationServed_sfd
	, SFD.SchemeStartDate_sfd
	, SFD.SchemeEndDate_sfd
	, SFD.NumberOfSamples_sfd
	, SFD.SamplesRequired_sfd
	, SFD.ShortFall_sfd
	, SFD.ShortFallReasonId_sfr
	, SFD.ShortFallReasonText_sfd
	, SFD.LastUpdateDate_sfd
	, SFD.LastUpdatedBy_usr
	, SFD.ParameterReportingID_par
	, SFD.MonitoredEntityTypeId_met
FROM		dbo.tblShortFallDownload_sfd	SFD
LEFT JOIN	dbo.tblShortFallReason_sfr		SFR ON SFR.ShortFallReasonId_sfr = SFD.ShortFallReasonId_sfr

WHERE	SFD.ReturnYear_rty = '2015'
AND		SFD.SchemeCode_sfd = '2300PRI2009'


SELECT DISTINCT
SFR.ShortFallReasonId_sfr
, SFR.StaticName_sfr
, SFR.Name_sfr
, SFR.TexFieldVisible
FROM dbo.tblShortFallReason_sfr	SFR

--*/--*/