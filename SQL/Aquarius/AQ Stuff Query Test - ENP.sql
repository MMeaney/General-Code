USE [EPACentral_Aquarius]

 IF OBJECT_ID('Tempdb..#tmpEnvParam')	IS NOT NULL
	    BEGIN	DROP TABLE #tmpEnvParam	END

SELECT DISTINCT	
	  ENP.Prm_Desc		AS [Prm_Desc]
	, ENP.Prm_Code		AS [Prm_Code]
	, UOM.Unit_Code		AS [Unit_Code]
	, THM.Theme_Desc	AS [Theme_Desc]
INTO	#tmpEnvParam	
FROM		dbo.Parameter					ENP 
LEFT JOIN	dbo.UnitOfMeasure				UOM ON UOM.Unit_ID		= ENP.Unit_ID 
LEFT JOIN	dbo.Theme						THM ON THM.Theme_id		= ENP.Theme_ID
WHERE	ENP.Prm_Code	=	'938'

SELECT DISTINCT	
	  ENVP1.[Prm_Desc]
	, ENVP1.[Prm_Code]
	, ENVP1.[Unit_Code]
	, STUFF((
		    SELECT ', ' + ENVP2.[Theme_Desc]
		    FROM	#tmpEnvParam ENVP2
		    WHERE	ENVP2.[Prm_Desc]	= ENVP1.[Prm_Desc]
		    AND		ENVP2.[Prm_Code]	= ENVP1.[Prm_Code]
		    AND		ENVP2.[Unit_Code]	= ENVP1.[Unit_Code]
		    FOR XML PATH('') 
	      ), 1 ,1 , '')
	AS [Theme_Desc]
FROM	#tmpEnvParam ENVP1