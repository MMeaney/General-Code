USE [EdenSSO-PRD]

-- ***********************************************************
-- *** Count Portal Users

IF  OBJECT_ID('TempDB..#tmpUsers_Month_Portal') IS NOT NULL
	BEGIN	DROP TABLE #tmpUsers_Month_Portal	END
SELECT
	MDL.Name								AS	[Module]
	, APP.Name								AS	[Module Short Name]
	, YEAR(OMB.MemberSince)					AS	[Year]
	, DATEPART(QUARTER, OMB.MemberSince)	AS	[Quarter]
	, CONVERT(CHAR(3), OMB.MemberSince, 0)	AS	[Month]
	, COUNT(DISTINCT(UPR.Email))			AS	[Users]	
	, SUM(COUNT(DISTINCT(UPR.Email))) 
		OVER(
			PARTITION BY APP.Name
			ORDER BY APP.Name, YEAR(OMB.MemberSince) 
			ROWS UNBOUNDED PRECEDING
		) AS [RunningTotal]

INTO		#tmpUsers_Month_Portal

FROM		dbo.UserProfile				UPR
LEFT JOIN	dbo.UserMembership			UMB	ON	UMB.UserId				= UPR.UserId
LEFT JOIN	dbo.OrganisationMembership	OMB	ON	OMB.UserId				= UPR.UserId
LEFT JOIN	dbo.Organisation			ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType		OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
LEFT JOIN	dbo.ModuleAuthorisation		MAU	ON	MAU.UserId				= OMB.UserID
LEFT JOIN	dbo.Module				  	MDL	ON	MDL.ModuleId			= MAU.ModuleId
LEFT JOIN	dbo.Application				APP	ON	APP.ApplicationId		= MDL.ApplicationId
WHERE		MDL.Name = 'EDEN Single Sign-On Portal'

GROUP BY MDL.Name
		 , APP.Name
		 , MONTH(OMB.MemberSince)
		 , CONVERT(CHAR(3), OMB.MemberSince, 0)
		 , DATEPART(QUARTER, OMB.MemberSince)
		 , YEAR(OMB.MemberSince)
ORDER BY APP.Name, YEAR(OMB.MemberSince)

SELECT * FROM #tmpUsers_Month_Portal

-- *** Portal Users By Quarter - Running Total

IF  OBJECT_ID('TempDB..#tmpUsers_Quarter_Portal_Total') IS NOT NULL
	BEGIN	DROP TABLE #tmpUsers_Quarter_Portal_Total	END
SELECT
	[Module]
	, [Module Short Name]
	, [Year]
	, [Quarter]
	, CAST([Year] AS VARCHAR(4)) + ' - ' + CAST([Quarter] AS VARCHAR(1)) AS [YQ]
	, SUM([Users])
		OVER(
			PARTITION BY [Year]
			ORDER BY	 [Year]
			ROWS UNBOUNDED PRECEDING
		) AS [Users]
	, SUM([Users])
		OVER(
			ORDER BY [Year]
			ROWS UNBOUNDED PRECEDING
		) AS [RunningTotal]
INTO	#tmpUsers_Quarter_Portal_Total
FROM	#tmpUsers_Month_Portal

SELECT 
	[Module]
	, [Module Short Name]
	, [Year]
	, 'Q' + CAST([Quarter]	AS VARCHAR(1)) AS [Quarter]
	, [YQ]
	, MAX([Users])			AS [Users]
	, MAX([RunningTotal])	AS [RunningTotal]

FROM #tmpUsers_Quarter_Portal_Total
WHERE	 [YQ] > '2011 - 2'

GROUP BY [Module]
		 , [Module Short Name]
		 , [Year]
		 , [Quarter]
		 , [YQ]
ORDER BY [Module Short Name], [Year]



-- *** Portal Users By Year - Running Total

IF  OBJECT_ID('TempDB..#tmpUsers_Year_Portal_Total') IS NOT NULL
	BEGIN	DROP TABLE #tmpUsers_Year_Portal_Total	END
SELECT
	[Module]
	, [Module Short Name]
	, [Year]
	, SUM([Users])
		OVER(
			PARTITION BY [Year]
			ORDER BY	 [Year]
			ROWS UNBOUNDED PRECEDING
		) AS [Users]
	, SUM([Users])
		OVER(
			ORDER BY [Year]
			ROWS UNBOUNDED PRECEDING
		) AS [RunningTotal]
INTO	#tmpUsers_Year_Portal_Total
FROM	#tmpUsers_Month_Portal



-- ***********************************************************
-- *** Count active users - No organisation Type - By Year



IF  OBJECT_ID('TempDB..#tmpUsers_Year_Modules') IS NOT NULL
	BEGIN	DROP TABLE #tmpUsers_Year_Modules	END
SELECT
	MDL.Name		AS [Module]
	, CASE
		WHEN APP.Name = 'Licensing Management Application'
			THEN 'LMA'
		WHEN APP.Name = 'Licence and Authorisation Application'
			THEN 'AM'
		WHEN APP.Name = 'lawcpportal'
			THEN 'LAWCPP'
		WHEN APP.Name = 'Irish Water Compliance Application'
			THEN 'IWCA'
		WHEN MDL.Name = 'Monitoring Data System Module'
			THEN 'MDS'
		ELSE APP.Name		
		END
	AS [Module Short Name]
	, YEAR(MAU.LastUpdatedOn)		AS	[Year]
	, COUNT(DISTINCT(UPR.Email))	AS	[Users]
	, SUM(COUNT(DISTINCT(UPR.Email))) 
		OVER(
			PARTITION BY APP.Name
			ORDER BY APP.Name, YEAR(MAU.LastUpdatedOn) 
			ROWS UNBOUNDED PRECEDING
		) AS [RunningTotal]

INTO		#tmpUsers_Year_Modules

FROM		dbo.UserProfile				UPR
LEFT JOIN	dbo.UserMembership			UMB	ON	UMB.UserId				= UPR.UserId
LEFT JOIN	dbo.OrganisationMembership	OMB	ON	OMB.UserId				= UPR.UserId
LEFT JOIN	dbo.Organisation			ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType		OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
LEFT JOIN	dbo.ModuleAuthorisation		MAU	ON	MAU.UserId				= OMB.UserID
LEFT JOIN	dbo.Module				  	MDL	ON	MDL.ModuleId			= MAU.ModuleId
LEFT JOIN	dbo.Application				APP	ON	APP.ApplicationId		= MDL.ApplicationId
WHERE		MDL.Name IS NOT NULL
AND			MDL.Name <> 'EDEN Single Sign-On Portal'

GROUP BY MDL.Name
		 , APP.Name
		 , YEAR(MAU.LastUpdatedOn)
ORDER BY MDL.Name
		 , YEAR(MAU.LastUpdatedOn)



SELECT
	[Module]
	, [Module Short Name]
	, [Year]
	, [Users]
	, [RunningTotal]
FROM #tmpUsers_Year_Modules

UNION

SELECT 
	[Module]
	, [Module Short Name]
	, [Year]
	, MAX([Users])			AS [Users]
	, MAX([RunningTotal])	AS [RunningTotal]

FROM #tmpUsers_Year_Portal_Total

GROUP BY [Module]
		 , [Module Short Name]
		 , [Year]
ORDER BY [Module Short Name]
		 , [Year]






















/*

-- ***********************************************************
-- *** Count active users - By Organistion Type

	--, OTY.Name		AS [OrgType]



USE [EdenSSO-PRD]

IF  OBJECT_ID('TempDB..#tmpEPA_IW') IS NOT NULL
	BEGIN	DROP TABLE #tmpEPA_IW	END
SELECT
	MDL.Name		AS	[Module]
	, CASE
		WHEN APP.Name = 'Licensing Management Application'
			THEN 'LMA'
		WHEN APP.Name = 'Licence and Authorisation Application'
			THEN 'Authorisation Module'
		WHEN APP.Name = 'lawcpportal'
			THEN 'LAWCPPortal'
		WHEN APP.Name = 'Irish Water Compliance Application'
			THEN 'IWCA'
		ELSE APP.Name		
		END
	AS [Module Short Name]
	, CASE WHEN ORG.Name = 'Environmental Protection Agency'
		THEN 'Environmental Protection Agency'
		ELSE 'Irish Water'
		END 
	AS [OrgType]
	, YEAR(OMB.MemberSince)			AS	[Year]
	, COUNT(DISTINCT(UPR.Email))	AS	[Users]

INTO		#tmpEPA_IW

FROM		dbo.UserProfile				UPR
INNER JOIN	dbo.UserMembership			UMB	ON	UMB.UserId				= UPR.UserId
LEFT JOIN	dbo.OrganisationMembership	OMB	ON	OMB.UserId				= UPR.UserId
LEFT JOIN	dbo.Organisation			ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType		OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
LEFT JOIN	dbo.ModuleAuthorisation		MAU	ON	MAU.UserId				= OMB.UserID
LEFT JOIN	dbo.Module				  	MDL	ON	MDL.ModuleId			= MAU.ModuleId
LEFT JOIN	dbo.Application				APP	ON	APP.ApplicationId		= MDL.ApplicationId

WHERE	ORG.Name	IN ('Irish Water', 'Environmental Protection Agency')
AND		MDL.Name	IS NOT NULL
--AND		UPR.Active  =	'1'

GROUP BY MDL.Name, APP.Name, ORG.Name, OTY.Name, YEAR(OMB.MemberSince)
ORDER BY MDL.Name, OTY.Name


IF  OBJECT_ID('TempDB..#tmpNonEPA_IW')	IS NOT NULL
	BEGIN	DROP TABLE #tmpNonEPA_IW	END
SELECT
	MDL.Name		AS [Module]
	, CASE
		WHEN APP.Name = 'Licensing Management Application'
			THEN 'LMA'
		WHEN APP.Name = 'Licence and Authorisation Application'
			THEN 'Authorisation Module'
		WHEN APP.Name = 'lawcpportal'
			THEN 'LAWCPPortal'
		WHEN APP.Name = 'Irish Water Compliance Application'
			THEN 'IWCA'
		ELSE APP.Name		
		END
	AS [Module Short Name]
	, OTY.Name		AS [OrgType]
	, YEAR(OMB.MemberSince)			AS	[Year]
	, COUNT(DISTINCT(UPR.Email))	AS	[Users]

INTO		#tmpNonEPA_IW

FROM		dbo.UserProfile				UPR
INNER JOIN	dbo.UserMembership			UMB	ON	UMB.UserId				= UPR.UserId
LEFT JOIN	dbo.OrganisationMembership	OMB	ON	OMB.UserId				= UPR.UserId
LEFT JOIN	dbo.Organisation			ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType		OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
LEFT JOIN	dbo.ModuleAuthorisation		MAU	ON	MAU.UserId				= OMB.UserID
LEFT JOIN	dbo.Module				  	MDL	ON	MDL.ModuleId			= MAU.ModuleId
LEFT JOIN	dbo.Application				APP	ON	APP.ApplicationId		= MDL.ApplicationId

WHERE	ORG.Name	NOT IN ('Environmental Protection Agency', 'Irish Water')
AND		MDL.Name	IS NOT NULL
--AND		UPR.Active  =	'1'

GROUP BY MDL.Name, APP.Name, OTY.Name, YEAR(OMB.MemberSince)
ORDER BY MDL.Name, OTY.Name

SELECT * FROM #tmpEPA_IW
UNION ALL
SELECT * FROM #tmpNonEPA_IW
ORDER BY 2, 3, 4;

--*/


/*
-- ***********************************************************
-- *** Misc 

SELECT 
	 OTY.Name	 AS [OrgType]
	 , COUNT (*) AS [OrgCount]
FROM		dbo.Organisation		ORG
INNER JOIN	dbo.OrganisationType	OTY ON OTY.OrganisationTypeId		= ORG.OrganisationTypeId
WHERE	 ORG.Active  =	'1'
GROUP BY OTY.Name
ORDER BY OTY.Name

SELECT  COUNT (*) AS [TotalUsers]
FROM		dbo.UserProfile			UPR
INNER JOIN	dbo.Organisation		ORG ON	UPR.CurrentOrganisationId	= ORG.OrganisationId
INNER JOIN	dbo.OrganisationType	OTY ON	OTY.OrganisationTypeId		= ORG.OrganisationTypeId
WHERE	UPR.CurrentOrganisationId	IS NOT NULL
AND		UPR.Active  =	'1'
AND		ORG.Active  =	'1'

SELECT  COUNT (*) AS [TotalUsers]
FROM	dbo.UserProfile	  UPR
WHERE	UPR.Active  =	'1'

SELECT
	 OTY.Name	 AS [OrgType]
	 , COUNT (*) AS [UserCount]
FROM		dbo.Organisation		ORG
INNER JOIN	dbo.OrganisationType	OTY ON OTY.OrganisationTypeId		= ORG.OrganisationTypeId
INNER JOIN	dbo.UserProfile			UPR ON UPR.CurrentOrganisationId	= ORG.OrganisationId 
WHERE	ORG.Active  =	'1'
AND		UPR.Active  =	'1'
GROUP BY OTY.Name
ORDER BY OTY.Name


-- ***********************************************************
-- *** Count active users per module application

USE [EdenSSO-PRD]

SELECT
	 MDL.Name	 AS [Module]
	 , COUNT (DISTINCT (UPR.Email)) AS [UserCount]
FROM		dbo.UserProfile				UPR
INNER JOIN	dbo.UserMembership			UMB	ON	UMB.UserId				= UPR.UserId
LEFT JOIN	dbo.OrganisationMembership	OMB	ON	OMB.UserId				= UPR.UserId
LEFT JOIN	dbo.Organisation			ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType		OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
LEFT JOIN	dbo.ModuleAuthorisation		MAU	ON	MAU.UserId				= OMB.UserID
LEFT JOIN	dbo.Module				  	MDL	ON	MDL.ModuleId			= MAU.ModuleId
WHERE	UPR.Active  =	'1'
AND		MDL.Name	=	'WFD'
GROUP BY MDL.Name


-- ***********************************************************
-- *** Count and list distinct active application modules

USE [EdenSSO-PRD]

SELECT COUNT (DISTINCT Name)	AS [ModuleCount] FROM dbo.Module WHERE Name NOT LIKE ('EDEN%') AND Active = '1'

SELECT DISTINCT 
	MODL.Name			AS	[Module Name]
	, APP.Name			AS	[Module Short Name]
	, MODL.Description
FROM dbo.Module				MODL
LEFT JOIN dbo.Application	APP		ON APP.ApplicationId	=	MODL.ApplicationId

WHERE MODL.Active = '1' 
ORDER BY MODL.Name

--*/

-- ***********************************************************
-- *** Sandbox

/*
SELECT COUNT(*)
FROM			[EdenSSO-PRD].[dbo].[UserProfile]		 USR
INNER JOIN	[EdenSSO-PRD].[dbo].[Organisation]		 ORG ON	USR.CurrentOrganisationId	 =	 ORG.OrganisationId 
WHERE	  USR.Active  =	'1'
AND	  ORG.Active  =	'1'
--AND	  ORG.OrganisationTypeId  =	'220675E2-F21A-E311-89AF-005056AE0006'	 -- Local Authority
--AND	  ORG.OrganisationTypeId  =	'EBBA01D4-5720-E311-89AF-005056AE0006'	 -- National Organisation
AND	  ORG.OrganisationTypeId  =	'7F5E321E-5124-E311-B036-005056AE0006'	 -- Private Organisation
--*/


--USE [EdenSSO-PRD]

--SELECT
--	 MDL.Name	 AS [Module]
--	 , COUNT (DISTINCT (UPR.Email)) AS [UserCount]
--FROM		dbo.UserProfile				UPR
--INNER JOIN	dbo.UserMembership			UMB	ON	UMB.UserId				= UPR.UserId
--LEFT JOIN	dbo.OrganisationMembership	OMB	ON	OMB.UserId				= UPR.UserId
--LEFT JOIN	dbo.Organisation			ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
--LEFT JOIN	dbo.OrganisationType		OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
--LEFT JOIN	dbo.ModuleAuthorisation		MAU	ON	MAU.UserId				= OMB.UserID
--LEFT JOIN	dbo.Module				  	MDL	ON	MDL.ModuleId			= MAU.ModuleId
--WHERE		UPR.Active  =	'1'
--AND		MDL.Name		=  'WFD'
--GROUP BY MDL.Name




-- ***********************************************************
-- *** Count active WFD users by organistion type

--USE [EdenSSO-PRD]

--IF  OBJECT_ID('TempDB..#tmpEPA_IW') IS NOT NULL
--	BEGIN	DROP TABLE #tmpEPA_IW	END
--SELECT
--	 MDL.Name	 AS [Module]
--	 , ORG.Name	 AS [Organisation]
--	 , OTY.Name	 AS [OrgType]
--	 , COUNT (DISTINCT(UPR.Email)) AS [Users]
--INTO			#tmpEPA_IW
--FROM			dbo.UserProfile				 UPR
--INNER JOIN	dbo.UserMembership			 UMB	ON	UMB.UserId					= UPR.UserId
--LEFT JOIN	dbo.OrganisationMembership	 OMB	ON	OMB.UserId					= UPR.UserId
--LEFT JOIN	dbo.Organisation				 ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
--LEFT JOIN	dbo.OrganisationType			 OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
--LEFT JOIN	dbo.ModuleAuthorisation		 MAU	ON	MAU.UserId					= OMB.UserID
--LEFT JOIN	dbo.Module				  		 MDL	ON	MDL.ModuleId				= MAU.ModuleId
--WHERE	   UPR.Active  =	'1'
--AND		MDL.Name	   =  'WFD'
--AND		ORG.Name	   IN ('Irish Water', 'Environmental Protection Agency')
--GROUP BY MDL.Name, ORG.Name, OTY.Name
--ORDER BY MDL.Name, OTY.Name

--IF  OBJECT_ID('TempDB..#tmpNonEPA_IW')	IS NOT NULL
--	BEGIN	DROP TABLE #tmpNonEPA_IW	END
--SELECT
--	 MDL.Name	 AS [Module]
--	 , CASE WHEN OTY.Name = 'Local Authority'
--			THEN 'Local Authority (Non-IW)'
--			ELSE 'National Organisation (Non-EPA)'
--			END 
--				 AS [Organisation]
--	 , OTY.Name	 AS [OrgType]
--	 , COUNT ((UPR.Email)) AS [Users]
--INTO			#tmpNonEPA_IW
--FROM			dbo.UserProfile				 UPR
--INNER JOIN	dbo.UserMembership			 UMB	ON	UMB.UserId					= UPR.UserId
--LEFT JOIN	dbo.OrganisationMembership	 OMB	ON	OMB.UserId					= UPR.UserId
--LEFT JOIN	dbo.Organisation				 ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
--LEFT JOIN	dbo.OrganisationType			 OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
--LEFT JOIN	dbo.ModuleAuthorisation		 MAU	ON	MAU.UserId					= OMB.UserID
--LEFT JOIN	dbo.Module				  		 MDL	ON	MDL.ModuleId				= MAU.ModuleId
--WHERE	 UPR.Active  =	'1'
--AND	 MDL.Name	 =  'WFD'
--AND	 ORG.Name	 NOT IN ('Irish Water', 'Environmental Protection Agency')
--GROUP BY MDL.Name, OTY.Name
--ORDER BY MDL.Name, OTY.Name

--SELECT * FROM #tmpEPA_IW
--UNION ALL
--SELECT * FROM #tmpNonEPA_IW;