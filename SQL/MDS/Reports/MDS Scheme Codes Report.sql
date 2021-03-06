USE [EdenMDS-PRD]

SELECT DISTINCT
	MEN.NationalCode_men							AS [National Code]
	, MEN.Name_men									AS [Entity Name]
	, CAST(SCY.ReturnYear_rty AS varchar)			AS [Scheme Year]
	, ISNULL(SCY.PopulationServed_scy, '')			AS [Population]
	, ISNULL(SCY.VolumeDistributed_scy, '')			AS [Volume Distributed]
	, SCY.SchemeSource_scy							AS [Scheme Source]
	, ISNULL(SCY.Derogation_scy, '')				AS [Derrogation]
	, REPLACE(REPLACE(ISNULL(SCY.TreatmentType_scy, ''), CHAR(13), ''), CHAR(10), '') AS [Treatment Name]
	--, ISNULL(SCY.TreatmentType_scy, '')			AS [Treatment Name]	
	, REPLACE(REPLACE(ISNULL(SCY.SupplementaryInformation_scy, ''), CHAR(13), ''), CHAR(10), '') AS [Supplementary Information]	
	--, ISNULL(SCY.SupplementaryInformation_scy, '')	AS [Supplementary Information]
	, ORG2.StaticName_org							AS [Parent LA Code]
	, STD.Content_std								AS [Parent LA Name]

FROM		dbo.tblMonitoredEntity_men		MEN
LEFT JOIN	dbo.tblSchemeYear_scy			SCY		ON MEN.MonitoredEntityId_men	= SCY.MonitoredEntityId_men
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation	ORG		ON ORG.Code						= SCY.SanitaryAuthority_scy
LEFT JOIN	tblOrganisation_org				ORG2	ON ORG2.OrganisationId_org		= MEN.OwnerOrganisationId_org
LEFT JOIN	tblStringDefinition_std			STD		ON STD.StringID_stg				= ORG2.Name_stg

WHERE	MEN.NationalCode_men	LIKE '%PUB%'
AND		STD.LanguageID_lan		= '1'

ORDER BY [Parent LA Name], ORG2.StaticName_org, MEN.NationalCode_men, [Scheme Year] DESC











/*


--SELECT * FROM dbo.tblMonitoredEntity_men WHERE NationalCode_men	= '0500PUB2503'
--SELECT * FROM dbo.tblMonitoredEntity_men WHERE Name_men			= 'Bandon Regional'


	--, SCY.SanitaryAuthority_scy						AS [Parent LA Code]
	--, ORG.Name										AS [Parent LA Name]


--, MEN.*
--, SCY.SourceOfSupply_scy
--, SCY.SchemeType_sct
--, SCY.Locked_scy
--, SCY.SchemeStartDate_scy
--, SCY.SchemeEndDate_scy
--, SCY.DoesHaveChloringMonitor_scy
--, SCY.DoesHaveTurbidityMonitor_scy
--, SCY.CryptoCatchmentScore_scy
--, SCY.CryptoTreatmentScore_scy
--, SCY.OverallCryptoRiskScreeningScore_scy
--, SCY.ActionInSupplyOnRemedialActionList_scy
--, SCY.DoesHaveChlorineResidualAlarm_scy
--, SCY.DoesHaveChlorineDosing_scy
--, SCY.IsChlorineDosingResidualBase_scy
--, SCY.IsChlorineContactTimeCalculated_scy
--, SCY.IsWSPinPlace_scy
--, SCY.HasWSPpreparation_scy
--, SCY.IsDWIRPinPlace_scy
--, SCY.ChlorineContactTime_scy
--, SCY.LastUpdatedBy_usr
--, SCY.LastUpdateDate_scy


--*/