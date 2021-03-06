USE [EdenMDS-TST]

SELECT 
	STD.Content_std						AS [LocalAuthority]
	, MET.Name_met						AS [SchemeType]
	, SCY.ReturnYear_rty				AS [RetYear]
	, COUNT(SCY.MonitoredEntityId_men)	AS [EntityCount]
      
FROM		dbo.tblSchemeYear_scy			SCY
INNER JOIN	dbo.tblMonitoredEntity_men		MEN	ON MEN.MonitoredEntityId_men		= SCY.MonitoredEntityId_men
INNER JOIN	dbo.tblOrganisation_org			ORG	ON ORG.OrganisationId_org			= MEN.OwnerOrganisationId_org
INNER JOIN	dbo.tblStringDefinition_std		STD	ON STD.StringID_stg					= ORG.Name_stg
INNER JOIN	dbo.tblMonitoredEntityType_met	MET	ON MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeId_met

WHERE	 SCY.ReturnYear_rty = '2014'
AND		 STD.LanguageID_lan = '1'
GROUP BY STD.Content_std, MET.Name_met, SCY.ReturnYear_rty
ORDER BY MET.Name_met, STD.Content_std
