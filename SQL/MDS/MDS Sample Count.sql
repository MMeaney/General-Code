-- *******************************************************
-- *** List of approved samples in Eden MDS
-- *******************************************************

USE [EdenMDS-TST]

SELECT DISTINCT
	--SAM.SampleLabCode_sam		AS	[Samp Code]
	----, SAM.SampleID_sam
	----, MEA.MeasurementID_mea
	--, MEN.NationalCode_men		AS	[Mon Ent]
	--, STA.NationalCode_sta		AS	[Station Code]
	SOR.Name					AS	[Organisation]
	, STA.NationalCode_sta	
	, STA.Name_sta
	, SOR.Code
	, COUNT (SAM.SampleLabCode_sam)
	--, MET.Name_met				AS	[Mon Ent Type]
	--, STA.Name_sta				AS	[Station Name]
	--, SAM.Date_sam				AS	[Sample Date]
	--, SAM.CompletionDate_sam
	--, SAT.Description_sat		AS	[Sample Type]
	, SAP.Name_sap				AS	[Sample Purpose]
	, DATEPART(YEAR, SAM.Date_sam)
	--, ULD.UploadDate_uld
	--, LTRIM(RTRIM(ULB.FirstName_usr)) + ' ' + LTRIM(RTRIM(ULB.LastName_usr)) AS	[UploadedBy]
	--, LTRIM(RTRIM(UAP.FirstName_usr)) + ' ' + LTRIM(RTRIM(UAP.LastName_usr)) AS	[ApprovedBy]

FROM		dbo.tblSample_sam				SAM
LEFT JOIN	dbo.tblStation_sta				STA	ON	STA.StationId_sta				= SAM.StationID_sta
LEFT JOIN	dbo.tblMeasurement_mea			MEA	ON	MEA.SampleID_sam				= SAM.SampleID_sam
LEFT JOIN	dbo.tblOrganisation_org			ORG	ON	ORG.OrganisationId_org			= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-TST].dbo.Organisation  SOR	ON	SOR.Code						= ORG.StaticName_org
LEFT JOIN	dbo.tblUpload_uld				ULD	ON	ULD.UploadId_uld				= SAM.UploadId_uld
LEFT JOIN	dbo.tblUser_usr					ULB ON	ULB.UserID_usr					= ULD.LastUpdatedBy_usr
LEFT JOIN	dbo.tblUser_usr					UAP ON	UAP.UserID_usr					= SAM.ApprovedBy_usr
LEFT JOIN	dbo.tblMonitoredEntity_men		MEN ON	MEN.MonitoredEntityId_men		= STA.MonitoredEntityId_men
LEFT JOIN	dbo.tblMonitoredEntityType_met  MET ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblSchemeYear_scy			SCY ON	SCY.MonitoredEntityId_men		= MEN.MonitoredEntityId_men
LEFT JOIN	dbo.tblReturnYear_rty			RTY ON	RTY.ReturnYear_rty				= SCY.ReturnYear_rty
LEFT JOIN	dbo.tblReturnYearStatus_rst		RST ON	RST.StatusID_rst				= RTY.StatusID_rst
LEFT JOIN	dbo.tblSamplePurpose_sap		SAP	ON	SAP.SamplePurposeID_sap			= SAM.SamplePurposeID_sap
LEFT JOIN	dbo.tblSampleType_sat			SAT	ON	SAT.SampleTypeID_sat			= SAM.SampleTypeID_sat

WHERE		MET.Name_met = 'Urban Waste Water'
AND			DATEPART(YEAR, SAM.Date_sam) = '2015'
AND			SOR.Code = '2400'

GROUP BY	SAM.SampleLabCode_sam, SOR.Name, SOR.Code, SAP.Name_sap, STA.NationalCode_sta, STA.Name_sta, DATEPART(YEAR, SAM.Date_sam)
ORDER BY	SAP.Name_sap, STA.Name_sta

