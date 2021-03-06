-- *******************************************
-- *** Add 1772	EP_00084	Apparent colour
-- *** to tblParameterReportingMembership_prm
-- *******************************************

USE [EdenMDS-PRD]

-- *** Script to add parameters

--INSERT INTO tblParameterReportingMembership_prm
--(
--	ParameterReportingID_par
--	, EnvironmentalParameterID_enp
--)
--VALUES 
--	(31, 1772),
--	(32, 1772),
--	(33, 1772),
--	(34, 1772);

-- **************************************************
-- *** Query relevant tables

SELECT DISTINCT
	PRM.ParameterReportingMemberhip_prm
	, PRM.ParameterReportingID_par
	, PRM.EnvironmentalParameterID_enp
	, SAP.Name_sap
	, ENP.Code_enp
	, ENP.Name_enp
	, PAR.ParameterReportingName_par

FROM		dbo.tblParameterReportingMembership_prm	PRM
LEFT JOIN	dbo.tblParameterReporting_par			PAR	ON	PAR.ParameterReportingID_par		= PRM.ParameterReportingID_par
LEFT JOIN	dbo.tblSamplePurpose_sap				SAP	ON	SAP.SamplePurposeID_sap				= PAR.SamplePurposeID_sap
LEFT JOIN	dbo.tblEnvironmentalParameter_enp		ENP	ON	ENP.EnvironmentalParameterID_enp	= PRM.EnvironmentalParameterID_enp

WHERE		PRM. ParameterReportingID_par IN
(
'31',
'32',
'33',
'34'
)



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT
	PRM.ParameterReportingMemberhip_prm
	, PRM.ParameterReportingID_par
	, PRM.EnvironmentalParameterID_enp
FROM	dbo.tblParameterReportingMembership_prm	PRM
WHERE	ParameterReportingID_par IN
(
'31',
'32',
'33',
'34'
)

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT
	PAR.ParameterReportingID_par
	, PAR.ParameterReportingName_par
	, PAR.SamplePurposeID_sap
FROM	dbo.tblParameterReporting_par	PAR
WHERE	ParameterReportingName_par LIKE '%COLOUR%'

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT 
	SAP.SamplePurposeID_sap
	, SAP.StationType_stt
	, SAP.Code_sap
	, SAP.RegulatoryBodyID_reg
	, SAP.Name_sap
	, SAP.NationalYN_sap
	, SAP.LastUpdatedBy_usr
	, SAP.LastUpdateDate_sap
FROM	dbo.tblSamplePurpose_sap	SAP
WHERE	SAP.SamplePurposeID_sap IN (
22,
23,
33,
34
)

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT
	ENP.EnvironmentalParameterID_enp
	, ENP.Code_enp
	, ENP.Name_enp
	, ENP.Symbol_enp
	, ENP.AutoAnalisysName_enp
	, ENP.LastUpdatedBy_usr
	, ENP.LastUpdateDate_enp
FROM	dbo.tblEnvironmentalParameter_enp	ENP
--WHERE ENP.EnvironmentalParameterID_enp IN (1883,2287)
WHERE ENP.Name_enp LIKE '%COLOUR%'

--*/