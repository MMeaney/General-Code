-- **************************************************************
-- *** Organisations - EDEN - for Martina Hennessy (2015/09/08)
-- **************************************************************

USE	[EdenSSO-PRD]

IF  OBJECT_ID('TempDB..#tmpEDENOrgs') IS NOT NULL
	BEGIN	DROP TABLE #tmpEDENOrgs	END
SELECT DISTINCT
	ORG.Name			AS	[Organisation]
	, MDL.Name			AS	[Module]
	, MAU.Active		AS	[Active]
INTO		#tmpEDENOrgs
FROM		UserProfile				UPR
INNER JOIN	UserMembership			UMB	ON	UMB.UserId				= UPR.UserId
LEFT JOIN	OrganisationMembership	OMB	ON	OMB.UserId				= UPR.UserId
LEFT JOIN	Organisation			ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
LEFT JOIN	OrganisationType		OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
LEFT JOIN	ModuleAuthorisation		MAU	ON	MAU.UserId				= OMB.UserID
LEFT JOIN	Module				  	MDL	ON	MDL.ModuleId			= MAU.ModuleId
WHERE		MDL.Name	= 'EDEN PORTAL'
AND			MAU.Active	= '1'

SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Spatial Ireland%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Air Survey%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Garda Siochana%' OR [Organisation] LIKE '%Garda%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%BIM%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Blackthorn%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Carlow County Council%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Carlson Software%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%CDM Smith%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%CIEEM%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Citi Logik%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%CL Spatial%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Coastwatch Ireland%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Codesmart%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Coillte%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Compass Informatics%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Concern%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Department of Agriculture%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Derilinx%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%desireland%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Diatec Amicus Technology%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%DUBLIN INST%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%DotSharp%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%DTTaS%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Dublin City Council%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Dun Laoghaire Rath%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%EACS%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Ecological Advisory and Consultancy Services%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%East Ayrshire%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%e-Frontiers%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%EirGrid%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Enterprise Ireland%'  AND [Organisation] NOT LIKE '%Hewlett-Packard Enterprise Ireland Ltd%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE 'Environmental Protection Agency%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Ervia%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%ESB International%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%ESB Networks%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Explore Marketing%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Fingal County Council%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE 'Free%'   AND [Organisation] NOT LIKE '%FREE-HOTSPOT%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Google Maps%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%GoParkit Technologies%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Grasstec Ltd%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Handheld Group AB%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%HERE%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Heritage Council%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Iarnrod Eireann%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%iGeotec%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%iGeotech Technologies%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%INVAS Biosecurity%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Invasive Plant Solutions%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Farmer%Journal%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Irish Forestry%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Irish Rail%' OR [Organisation] LIKE '%IARNR%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Irish Water%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%IT Partner Italia%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%JBA Consulting%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Kabzy%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Kildare County Council%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Lee Strand Co-Op%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%LGMA%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Local Government%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Loughs Agency%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%MAC Ltd%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Macroom E%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Malcolm Hollis%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Mallon Technology%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Marine Institute%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Mary Tubridy and Associates%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE 'Meath County Council%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Murphy Surveys%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%National Biodiversity Data Centre%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%National Museum of Ireland%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%National Roads Authority%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%National Transport Authority%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%NBDC%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%NRA/Atkins%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%National Transport Authority%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%NUI Galway%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Optimum Results Ltd%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%OPW%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Ordnance Survey of Ireland%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Ozone Car Sales%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Pin Point Alerts%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%PMS Pavement Management Services Ltd.%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Pobal%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%RPS%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Self-Employed%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Silvalytics%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE 'SSE%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Teagasc%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%TechWorks Marine%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%The Gresham Hotel%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%The Heritage Council%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%The Icon Group%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%The Matine Institute%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%The Planning Partnership%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%TII%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%TOBIN%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Transport Infrastructure Ireland%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Trinity College%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%UCC%' OR [Organisation] LIKE '%University College Cork%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%NUIG%' OR [Organisation] LIKE '%National University%Galway%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%UCD%' OR [Organisation] LIKE '%University College Dublin%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Veolia%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Waterford Institute of Technology%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%Wexford County Council%'
UNION SELECT * FROM #tmpEDENOrgs WHERE [Organisation] LIKE '%WorleyParsons%' OR [Organisation] LIKE '%Worley%'
