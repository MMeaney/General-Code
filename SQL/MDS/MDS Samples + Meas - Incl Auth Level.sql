-- *******************************************************
-- ** List of approved samples in Eden MDS
-- ** MDS Samples - IW Returns To Date
-- ** Drinking Water Public Scheme
-- *******************************************************

USE [EdenMDS-PRD]

IF  OBJECT_ID('TempDB..#tmpSampReturns') IS NOT NULL
	BEGIN	DROP TABLE #tmpSampReturns	END

SELECT DISTINCT
	AUP.Name_aup				AS	[Current Authorisation Level]
	, SOR.Name					AS	[Local Authority]
	, MEN.NationalCode_men + ' - ' + MEN.Name_men	AS	[Monitored Entity]
	, STA.NationalCode_sta + ' - ' + STA.Name_sta	AS	[Station]
	, SAM.SampleLabCode_sam		AS	[Sample Code]
	, SAM.Date_sam				AS	[Sample Date]
	, SAM.ApprovalDate_sam		AS	[Sample Approval Date]
	, SAM.Version_sam			AS	[Revision]
	, SAP.Name_sap				AS	[Sample Purpose]
	, SMT.Name_smt				AS	[Sampling Method]
	, SAT.Description_sat		AS	[Sample Reason]
	, SAM.CompletionDate_sam	AS	[Completion Date]
	, SAM.Sampler_sam			AS	[SampledBy]
	, REPLACE(REPLACE(SAM.Details_sam, CHAR(13), ' '), CHAR(10), ' ')	AS	[Details]
	, ULD.UploadDate_uld		AS	[UploadDate]
	, ENP.Name_enp				AS	[Parameter]
	--, MEA.Accredited_mea		AS	[Accredited]

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


WHERE ULD.UploadDate_uld = '2016-07-07 12:21:53.040'
--WHERE	SAM.SampleLabCode_sam IN
--(
--'1167236'
--)
AND		MET.Name_met	LIKE '%BATH%'
--AND		SOR.Name		LIKE '%LOUTH%'
--AND		YEAR(SAM.Date_sam)	= '2015'
--AND		ENP.Name_enp		= 'BOD - 5 days (Total)'

SELECT DISTINCT
	LTRIM(
		STUFF((
			SELECT ', ' + RET2.[Current Authorisation Level]
			FROM	#tmpSampReturns	RET2
			WHERE	RET2.[Station]		= RET1.[Station]
			AND		RET2.[Sample Code]	= RET1.[Sample Code]
			AND		RET2.[Sample Date]	= RET1.[Sample Date]
			AND		RET2.[Parameter]	= RET1.[Parameter]
			FOR XML PATH('') 
		), 1 ,1 , '')
	) AS [Current Authorisation Level]
	, [Local Authority]
	, [Monitored Entity]
	, [Station]
	, [Sample Code]
	, [Sample Date]
	, [Sample Approval Date]
	, [Revision]
	, [Sample Purpose]
	, [Sampling Method]
	, [Sample Reason]
	, [Completion Date]
	, [SampledBy]
	, [Details]
	, [UploadDate]
	, [Parameter]
	--, [Accredited]
FROM	#tmpSampReturns	RET1
--WHERE	[Parameter] LIKE '%Calcium%'
--OR		[Parameter] LIKE '%Hard%'
ORDER BY [Current Authorisation Level], [Local Authority], [Monitored Entity], [Station], [Sample Date]--[Parameter], 




/*

	STUFF
		(
			(
				SELECT  ', ' + ATL.Name_aup
				FROM		#tmpAuthLevels		ATL	
				INNER JOIN	dbo.tblStation_sta	STA2	ON	ATL.NationalCode_sta	= STA2.NationalCode_sta
				INNER JOIN	dbo.tblSample_sam	SAM2	ON	(
															ATL.SampleLabCode_sam	= SAM2.SampleLabCode_sam
															AND	ATL.Date_sam		= SAM2.Date_sam
															)
				WHERE	ATL.NationalCode_sta	= STA2.NationalCode_sta
				AND		ATL.SampleLabCode_sam	= SAM2.SampleLabCode_sam
				AND		ATL.Date_sam			= SAM2.Date_sam
			), 1, 1, ''
		)

IF  OBJECT_ID('TempDB..#tmpAuthLevels') IS NOT NULL
	BEGIN	DROP TABLE #tmpAuthLevels	END
SELECT DISTINCT
	AUP.Name_aup
	, MET.Name_met
	, SOR.Code
	, SOR.Name
	, STA.NationalCode_sta
	, SAM.SampleLabCode_sam
	, SAM.Date_sam
INTO	#tmpAuthLevels	
FROM		dbo.tblSample_sam					SAM
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta					= SAM.StationID_sta
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org				= STA.LocalAuthorityId_org
LEFT JOIN	dbo.tblMonitoredEntity_men			MEN	ON	MEN.MonitoredEntityId_men			= STA.MonitoredEntityId_men
LEFT JOIN	dbo.tblMonitoredEntityType_met		MET	ON	MET.MonitoredEntityTypeID_met		= MEN.MonitoredEntityTypeID_met
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR	ON	SOR.Code							= ORG.StaticName_org
LEFT JOIN	dbo.tblSampleAuthorization_aut		AUT ON	AUT.SampleID_sam					= SAM.SampleID_sam
LEFT JOIN	dbo.tblAuthorizationPurpose_aup		AUP ON	AUP.AuthorizationPurposeID_aup		= AUT.AuthorizationPurposeID_aup
WHERE	SOR.Name		= 'CARLOW COUNTY COUNCIL'
AND		MET.Name_met	LIKE '%Drinking Water Public Scheme%'
ORDER BY SOR.Name, MET.Name_met, STA.NationalCode_sta, SAM.Date_sam

--SELECT * FROM #tmpAuthLevels

SELECT DISTINCT
	STUFF
		(
			(
				SELECT  ', ' + ATL.Name_aup
				FROM		#tmpAuthLevels		ATL	
				INNER JOIN	dbo.tblStation_sta	STA2	ON	ATL.NationalCode_sta	= STA2.NationalCode_sta
				INNER JOIN	dbo.tblSample_sam	SAM2	ON	(
															ATL.SampleLabCode_sam	= SAM2.SampleLabCode_sam
															AND	ATL.Date_sam		= SAM2.Date_sam
															)
				WHERE	ATL.NationalCode_sta	= STA2.NationalCode_sta
				AND		ATL.SampleLabCode_sam	= SAM2.SampleLabCode_sam
				AND		ATL.Date_sam			= SAM2.Date_sam
			), 1, 1, ''
		)
			
	, SOR.Name					AS	[Local Authority]
	, MEN.NationalCode_men + ' - ' 
		+ MEN.Name_men			AS	[Monitored Entity]
	, STA.NationalCode_sta + ' - ' 
		+ STA.Name_sta			AS	[Station]
	, SAM.SampleLabCode_sam		AS	[Sample Code]
	, SAM.Date_sam				AS	[Sample Date]
	, SAM.ApprovalDate_sam		AS	[Sample Approval Date]
	, SAM.Version_sam			AS	[Revision]
	, SAP.Name_sap				AS	[Sample Purpose]
	, SMT.Name_smt				AS	[Sampling Method]
	, SAT.Description_sat		AS	[Sample Reason]
	, SAM.CompletionDate_sam	AS	[Completion Date]
	, SAM.Sampler_sam			AS	[SampledBy]
	, SAM.Details_sam			AS	[Details]
	
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
--LEFT JOIN	#tmpAuthLevels						ATL	ON	(	ATL.NationalCode_sta			= STA.NationalCode_sta
--														AND	ATL.SampleLabCode_sam			= SAM.SampleLabCode_sam
--														AND	ATL.Date_sam					= SAM.Date_sam
--														)
WHERE	SOR.Name		= 'CARLOW COUNTY COUNCIL'
AND		MET.Name_met	LIKE '%Drinking Water Public Scheme%'
ORDER BY SOR.Name, [Monitored Entity], [Station], SAM.Date_sam

--*/
--*/