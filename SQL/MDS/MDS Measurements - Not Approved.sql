-- *******************************************************
-- *** List of measurements awaiting approval in Eden MDS
-- *******************************************************

USE [EdenMDS-PRD]

SELECT DISTINCT
	SOR.Name					AS	[Local Authority]
	, ORG.StaticName_org		AS	[LA Code]
	, MET.Name_met				AS	[Data Type]
	, MEN.Name_men				AS	[Monitored Entity Name]
	, STA.NationalCode_sta		AS	[National Station Code]
	, STA.Name_sta				AS	[Station Name]
	, SAM.SampleLabCode_aps		AS	[Sample Code]
	, SAM.Date_aps				AS	[Sample Date]
	, YEAR(SAM.Date_aps)		AS	[Year]
	--, ENP.Name_enp				AS	[Parameter]
	--, MEU.ShortDescription_meu	AS	[UOM]
	--, MEA.Result_apm
	--, MEA.ResultType_apm
	--, MEA.TextResult_apm
	--, MEU.Code_meu				AS	[UOM EDEN Code]
	--, ENP.Code_enp				AS	[Param EDEN Code]
	, SAM.SampleID_aps
	, LTRIM(RTRIM(ULB.FirstName_usr)) + ' ' + LTRIM(RTRIM(ULB.LastName_usr)) AS	[UploadedBy]
	, ULB.Email_usr
	, ULD.FileName_uld
	, ULD.UploadDate_uld
	, ULD.TargetLims_uld
	, LIM.Name_lim

	
FROM		dbo.tblApprovalSample_aps			SAM
LEFT JOIN	dbo.tblApprovalMeasurement_apm		MEA	ON	MEA.ApprovalSampleID_aps			= SAM.SampleID_aps
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta					= SAM.StationID_sta
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org				= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR	ON	SOR.Code							= ORG.StaticName_org
LEFT JOIN	dbo.tblUpload_uld					ULD	ON	ULD.UploadId_uld					= SAM.UploadId_uld
LEFT JOIN	dbo.tblUser_usr						ULB	ON	ULB.UserID_usr						= ULD.LastUpdatedBy_usr
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
LEFT JOIN	dbo.tblSampleAuthorization_aut		AUT ON	AUT.SampleID_sam					= SAM.SampleID_aps
LEFT JOIN	dbo.tblSamplingMethod_smt			SMT ON	SMT.SamplingMethodID_smt			= SAM.SamplingMethodID_smt
LEFT JOIN	dbo.tblAuthorizationPurpose_aup		AUP ON	AUP.AuthorizationPurposeID_aup		= AUT.AuthorizationPurposeID_aup
LEFT JOIN	dbo.tblUser_usr						UAT ON	UAT.UserID_usr						= AUT.LastUpdatedBy_usr
LEFT JOIN	dbo.tblParameterTranslation_ptr		PTR ON	(
														PTR.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
														AND
														PTR.InstallationId_lim				= SAM.SourceSystem_lim
														)
LEFT JOIN	dbo.tblUser_usr								UPT ON	UPT.UserID_usr						= PTR.LastUpdatedBy_usr
LEFT JOIN	dbo.tblParameterMeasurementUnitMatrix_pmx	PMX	 ON	PMX.EnvironmentalParameterId_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblMeasurementUnit_meu					MEUX ON	MEUX.MeasurementUnitID_meu			= PMX.MeasurementUnitID_meu

--WHERE	ULD.FileId_uld	 = 'B5534AA9-52E9-49BA-858F-0C0D0C38AF61'
WHERE	SAM.SampleLabCode_aps LIKE '%16%'
--SAM.SampleLabCode_aps	IN
--(


--'999244',
--'1011351'


----'1531811',
----'1543921',
----'1532872',
----'1532873',
----'1530586',
----'1530587',
----'1533415',
----'1533406',
----'155620150416'
--)

--WHERE	ULD.Filename_uld	= 'MCCMAR2015edenexport.xml'
--WHERE	YEAR(SAM.Date_aps)	=	 '2015'
--AND		MET.Name_met		LIKE '%DRINKING%'


ORDER BY YEAR(SAM.Date_aps), SOR.Name, ULD.UploadDate_uld, MET.Name_met, STA.NationalCode_sta, SAM.Date_aps

--155620150158
--155620150309
--155620150455
--155620150611
--155620150890
--155620151491


--SELECT TOP 5 * FROM tblSample_sam

/*

WHERE	MET.Name_met	LIKE	'%BATH%'
AND		ENP.Name_enp	LIKE	'%E. Coli%'
AND		STA.Name_sta	LIKE	'%WOODSTOWN%'
AND		MEA.Result_mea	IS NOT NULL


ORDER BY SAM.Date_sam, MEA.Result_mea DESC, STA.Name_sta, SAM.SampleLabCode_sam
*/

/*


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