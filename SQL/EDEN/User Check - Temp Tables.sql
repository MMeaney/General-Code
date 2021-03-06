USE	[EdenSSO-PRD]

DECLARE @prmEmail VARCHAR(100) = NULL
SET		@prmEmail = 'AndrewRae@ccpc.ie'
 
SELECT DISTINCT 
	TMPCNTCT.UserId
	, TMPCNTCT.Email
	, TMPCNTCT.FirstName
	, TMPCNTCT.LastName
	, TMPCNTCT.Phone
	, TMPCNTCT.Mobile
	, TMPCNTCT.IsRegistration
	--, TMPCNTCT.AddressLine1
	--, TMPCNTCT.AddressLine2
	--, TMPCNTCT.AddressLine3
	--, TMPCNTCT.PostCode
	--, TMPCNTCT.Fax
	--, TMPCNTCT.CountyId
	--, TMPCNTCT.CountryId
	--, TMPCNTCT.TitleId
	--, TMPCNTCT.SectionId
	--, TMPCNTCT.PositionId
FROM	[EdenIdentity-PRD].dbo.TempContactDetail	TMPCNTCT
WHERE	TMPCNTCT.Email = @prmEmail


USE [EdenSSO-PRD]

IF OBJECT_ID('Tempdb..#tmpOrg')	IS NOT NULL
	BEGIN	DROP TABLE #tmpOrg	END
CREATE TABLE #tmpOrg
(
  Organisation			VARCHAR(MAX) COLLATE Latin1_General_CI_AS 
  , OrganisationType	VARCHAR(100) COLLATE Latin1_General_CI_AS 
  , Email				VARCHAR(100) COLLATE Latin1_General_CI_AS 
  , RegistrationNo		VARCHAR(100) COLLATE Latin1_General_CI_AS 
)
INSERT INTO #tmpOrg
SELECT 
	TMPORG.CompanyName
	, OTY.Name
	, TMPORG.Email
	--, TMPORG.AddressLine1
	--, TMPORG.AddressLine2
	--, TMPORG.AddressLine3
	--, TMPORG.Country
	--, TMPORG.CountyId
	--, TMPORG.CountryId
	--, TMPORG.Phone
	--, TMPORG.PostCode
	--, TMPORG.Fax
	, TMPORG.RegistrationNo
	--, TMPORG.BusinessTypeId
	--, TMPORG.TradingAs
FROM		[EdenIdentity-PRD].dbo.TempOrganisation		TMPORG
LEFT JOIN	dbo.OrganisationType						OTY			ON	OTY.OrganisationTypeId	= TMPORG.OrganisationTypeId
WHERE	TMPORG.CompanyName		IS NOT NULL	 
AND		TMPORG.Email = @prmEmail


IF OBJECT_ID('Tempdb..#tmpOrgLANATPRVT')	IS NOT NULL
	BEGIN	DROP TABLE #tmpOrgLANATPRVT	END
CREATE TABLE #tmpOrgLANATPRVT
(
  Organisation			VARCHAR(MAX) COLLATE Latin1_General_CI_AS 
  , OrganisationType	VARCHAR(100) COLLATE Latin1_General_CI_AS 
  , Email				VARCHAR(100) COLLATE Latin1_General_CI_AS 
  , RegistrationNo		VARCHAR(100) COLLATE Latin1_General_CI_AS 
)
INSERT INTO #tmpOrgLANATPRVT
SELECT 
	CASE
		WHEN TMPORG.CompanyId		IS NOT NULL	THEN ORGPRVT.Name		
		WHEN TMPORG.OrganisationId	IS NOT NULL	THEN ORGLANAT.Name
		--WHEN TMPORG.CompanyName		IS NOT NULL	THEN TMPORG.CompanyName					
		END
	AS	[Organisation]
	, OTYLANAT.Name	
	, TMPORG.Email
	--, TMPORG.AddressLine1
	--, TMPORG.AddressLine2
	--, TMPORG.AddressLine3
	--, TMPORG.Country
	--, TMPORG.CountyId
	--, TMPORG.CountryId
	--, TMPORG.Phone
	--, TMPORG.PostCode
	--, TMPORG.Fax
	, TMPORG.RegistrationNo
	--, TMPORG.BusinessTypeId
	--, TMPORG.TradingAs
FROM		[EdenIdentity-PRD].dbo.TempOrganisation		TMPORG
LEFT JOIN	dbo.Organisation							ORGLANAT	ON	ORGLANAT.OrganisationId		= TMPORG.OrganisationId
LEFT JOIN	dbo.OrganisationType						OTYLANAT	ON	OTYLANAT.OrganisationTypeId	= TMPORG.OrganisationTypeId
--LEFT JOIN	dbo.OrganisationAddress						OADLANAT	ON	OADLANAT.OrganisationId		= TMPORG.OrganisationId
LEFT JOIN	dbo.Organisation							ORGPRVT		ON	ORGPRVT.OrganisationId		= TMPORG.OrganisationId
LEFT JOIN	dbo.OrganisationType						OTYPRVT		ON	OTYPRVT.OrganisationTypeId	= TMPORG.OrganisationTypeId
--LEFT JOIN	dbo.OrganisationAddress						OADPRVT		ON	OADPRVT.OrganisationId		= TMPORG.OrganisationId
WHERE	TMPORG.Email = @prmEmail

SELECT
[Organisation]
, [OrganisationType]
, Email
, RegistrationNo
FROM	#tmpOrgLANATPRVT

UNION

SELECT
Organisation
, OrganisationType
, Email
, RegistrationNo
FROM	#tmpOrg


SELECT DISTINCT 
    OMB.UserId
    FROM      dbo.UserProfile						  UPR
    LEFT JOIN	dbo.UserMembership					UMB		ON	UMB.UserId						  = UPR.UserId
    LEFT JOIN	dbo.OrganisationMembership	OMB		ON	OMB.UserId					  	= UPR.UserId
    LEFT JOIN	dbo.Organisation					  ORG		ON	ORG.OrganisationId			= OMB.OrganisationId
    LEFT JOIN	dbo.OrganisationAddress			OAD		ON	OAD.OrganisationId		  = ORG.OrganisationId
    LEFT JOIN	dbo.OrganisationType				OTY		ON	OTY.OrganisationTypeId  = ORG.OrganisationTypeId
    LEFT JOIN	dbo.ModuleAuthorisationRequest		MAR		ON  MAR.UserID				= UPR.UserID
    WHERE	OMB.Active = 1
    AND		UPR.Email = @prmEmail

/*
SELECT DISTINCT Email	FROM [EdenIdentity-PRD].dbo.TempOrganisation
SELECT DISTINCT Email	FROM [EdenIdentity-PRD].dbo.TempContactDetail
SELECT DISTINCT *	FROM [EdenIdentity-PRD].dbo.TempOrganisation	WHERE OrganisationId = 'E3207DC8-7561-DE11-8DCA-0022642A33B2'
SELECT DISTINCT *	FROM Organisation								WHERE OrganisationId = 'E3207DC8-7561-DE11-8DCA-0022642A33B2'

USE [EdenIdentity-PRD]
SELECT
    col.name, col.collation_name
FROM 
    sys.columns col
WHERE
    object_id = OBJECT_ID('TempOrganisation')


USE [EdenSSO-PRD]
SELECT
    col.name, col.collation_name
FROM 
    sys.columns col
WHERE
    object_id = OBJECT_ID('Organisation')
*/