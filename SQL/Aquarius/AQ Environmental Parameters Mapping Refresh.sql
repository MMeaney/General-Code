-- *******************************************
-- *** Refresh Aquarius Parameter Mappings ***
-- *******************************************

USE [EPACentral_Aquarius]

DELETE FROM ParameterMapping
INSERT INTO ParameterMapping
SELECT 
	Parameter.Prm_id 
	, Parameter_1.Prm_id	AS Expr1 
	, Parameter.Prm_Desc 
	, Parameter.Theme_ID 
FROM		Parameter 
INNER JOIN	Parameter		AS Parameter_1 
			ON	Parameter.Prm_Desc	=  Parameter_1.Prm_Desc 
			AND Parameter.Theme_ID	=  Parameter_1.Theme_ID 
			AND Parameter.Prm_id	<> Parameter_1.Prm_id 
ORDER BY	Parameter.Theme_ID, Parameter.Prm_Desc

INSERT INTO ParameterMapping 
SELECT 
	Parameter.Prm_id		AS PrmID_From 
	, Parameter_1.Prm_id	AS PrmID_To 
	, Parameter.Prm_Desc 
	, Parameter_1.Theme_ID	AS Theme_To 
FROM		Parameter 
INNER JOIN	Parameter		AS Parameter_1 
			ON	Parameter.Prm_Desc = Parameter_1.Prm_Desc
			AND (Parameter.Theme_ID = 4 AND Parameter_1.Theme_ID <> 4)
ORDER BY Theme_To, Parameter.Prm_Desc
