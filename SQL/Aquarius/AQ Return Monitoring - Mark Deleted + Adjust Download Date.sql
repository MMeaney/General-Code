USE [EPACentral_Aquarius]

SELECT DISTINCT 
	RTM.ReturnMonitoring_ID
	, RET.Ret_ID				AS [ReturnID]
	, THM.Theme_Desc			AS [Theme]
	, RTY.RetTyp_Desc			AS [ReturnType]
	, ORG.Org_Name				AS [Organisation]
	, RTM.DateOfNextReturn
	, RTM.DateOfLastReminder
	, RTM.ReturnStatus
	, RTM.DeletedStatus
	, RTM.LastDownloadDateTime
	, RET.DateOfReturn
	, RET.FileStatus
	, RET.FileIdentity
FROM		dbo.ReturnMonitoring	RTM
LEFT JOIN	dbo.Theme				THM	ON	THM.Theme_id		= RTM.Theme_ID
LEFT JOIN	dbo.ReturnTypes			RTY	ON	RTY.RetTyp_ID		= RTM.RetTyp_ID
LEFT JOIN	dbo.Organisations		ORG	ON	RTM.Organisation_ID	= ORG.Org_ID
LEFT JOIN	dbo.[Returns]			RET ON	(
											RET.Org_ID			= RTM.Organisation_ID
											AND
											RET.RetTyp_ID		= RTM.RetTyp_ID
											)

--WHERE SourceIdentity = '2cc1c69c-a560-46e0-981f-e12c57737829'

WHERE	ORG.Org_Name	LIKE 'EPA%'
AND		THM.Theme_Desc	LIKE '%GROUND%'
--AND		RET.DateOfReturn > '2016-01-01 00:00:00.000'
AND		RET.FileStatus	LIKE '%ERROR%'
ORDER BY RET.DateOfReturn

--UPDATE dbo.[Returns]
--SET DeletedStatus = 1
----SET	LastDownloadDateTime = '2016-05-29 23:02:24.000'
----SET	DateOfReturn = '2016-05-29 23:02:24.000'
--WHERE RET_ID = '16287'

--SELECT * FROM DBO.Returns WHERE Ret_ID = '16287'


/*


SELECT DISTINCT 
	RTM.ReturnMonitoring_ID
	, RTM.Theme_ID
	, RTM.RetTyp_ID
	, RTM.Organisation_ID
	, RTM.DateOfNextReturn
	, RTM.DateOfLastReminder
	, RTM.ReturnStatus
	, RTM.DeletedStatus
	, RTM.LastDownloadDateTime
FROM dbo.ReturnMonitoring	RTM

--*/