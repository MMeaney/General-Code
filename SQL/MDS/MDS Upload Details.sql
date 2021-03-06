-- *** MDS: Check uploads / uploaded by

USE [EdenMDS-PRD]

SELECT TOP 100
	ULD.UploadId_uld
	, LTRIM(RTRIM(ULB.FirstName_usr)) + ' ' + LTRIM(RTRIM(ULB.LastName_usr)) AS	[UploadedBy]
	, ULB.Email_usr
	, ULD.FileName_uld
	, ULD.UploadDate_uld
	, ULD.TargetLims_uld
	, LIM.Name_lim
	, ULD.FileId_uld
	, ULD.Data_uld
	--, ORG.StaticName_org	AS [OwnerOrg]
	, ORGSSO.Name			AS [OwnerOrg]
	, ULD.State_uld
	, ULD.Comments_uld
	, ULD.ContractedLabName_uld
	, ULD.FormallyResponsibleBody_uld
	, ULD.PreApprove_uld
	, LTRIM(RTRIM(UPD.FirstName_usr)) + ' ' + LTRIM(RTRIM(UPD.LastName_usr)) AS	[UpdatedBy]
	, ULD.LastUpdateDate_uld

FROM		dbo.tblUpload_uld				ULD
LEFT JOIN	dbo.tblUser_usr					ULB		ON	ULB.UserID_usr				= ULD.UploadedBy_usr
LEFT JOIN	dbo.tblUser_usr					UPD		ON	UPD.UserID_usr				= ULD.LastUpdatedBy_usr
LEFT JOIN	dbo.tblLimsInstallations_lim	LIM		ON	LIM.InstallationId_lim		= ULD.TargetLims_uld
LEFT JOIN	dbo.tblOrganisation_org			ORG		ON	ULD.OwnerOrganisationID_org = ORG.OrganisationId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation	ORGSSO	ON	ORGSSO.Code					= ORG.StaticName_org


--WHERE ULD.UploadId_uld = '5f945c31-4629-4a3b-b8ab-f12830dcc4f4'
--WHERE	ORGSSO.Name			LIKE '%CORK%'
--AND		ULD.UploadDate_uld	> '2016-04-14 12:21:06.667'
WHERE	ULD.Filename_uld	IN ('EdenDET-20160701-132733-CB-BW.xml')
OR		ULD.Filename_uld	LIKE '%EdenDET-20160701-132733-CB-BW.xml%'
--WHERE		ULB.Email_usr		LIKE '%ann.reen@corkcoco.ie%'

--SELECT * FROM [EdenSSO-PRD].dbo.Organisation
--SELECT * FROM [EdenMDS-PRD].dbo.tblOrganisation_org

ORDER BY ULD.UploadDate_uld DESC

/*
	--, ULD.UploadedBy_usr
	--, ULD.PreApprove_uld
	--, ULD.LastUpdatedBy_usr
	--, ULD.OwnerOrganisationId_org
	--, ULD.State_uld
	--, ULD.FormallyResponsibleBody_uld
*/
