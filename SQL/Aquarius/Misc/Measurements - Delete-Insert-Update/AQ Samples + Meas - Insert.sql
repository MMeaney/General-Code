-- ********************************************************************************
-- *** Insert Samples and measurements
-- ********************************************************************************

USE [EPACentral_aquarius]


-- ********************************
-- *** Insert Samples
-- ********************************

SET IDENTITY_INSERT dbo.[Sample] ON

INSERT INTO dbo.[Sample]
(Samp_ID, Samp_Code, MonEnt_ID, MonLoc_ID, RetTyp_ID, SampTyp_ID, SamCtg_ID, Samp_Date, Comp_Date, SampleMethod_ID, Samp_LabName, Samp_AnalName, Details, CmuID, SubnetID, WaterBodyCode, Hchk_ID, DepthTakenAt, IsSurrogateStation, SurrogateNorthing, SurrogateEasting, Source_ID)
VALUES ('1477383', '15-0768', '7354', '19742', '6', '11', '4', '2015-05-25 13:40:000', '2015-05-29 01:00:000', '16', 'Eden', 'Sinead McDonnell', '36147', '0', '0', NULL, NULL, '0', '0', '0.000000000', '0.000000000', '4');

INSERT INTO dbo.[Sample]
(Samp_ID, Samp_Code, MonEnt_ID, MonLoc_ID, RetTyp_ID, SampTyp_ID, SamCtg_ID, Samp_Date, Comp_Date, SampleMethod_ID, Samp_LabName, Samp_AnalName, Details, CmuID, SubnetID, WaterBodyCode, Hchk_ID, DepthTakenAt, IsSurrogateStation, SurrogateNorthing, SurrogateEasting, Source_ID)
VALUES ('1542501', '31072', '7437', '19825', '6', '11', '1', '2015-08-30 14:40:00',	'2015-08-30 14:40:00', '16', 'Eden', NULL, '2015/3631: Tide low , coming in, Dry, Calm', '0', '0', NULL, NULL, '0', '0', '0.000000000', '0.000000000', '4');

SET IDENTITY_INSERT dbo.[Sample] OFF



-- ********************************
-- *** Insert Measurements
-- ********************************

SET IDENTITY_INSERT dbo.Measurements ON

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13134091', '1477383', '3402', '2015-05-26 01:00:00', '0', '', NULL, NULL, '1', '1ec87f41-6d41-4b9f-ae27-2a1eb0bfa520', 'Sinead McDonnell', NULL, '0', '0', NULL, NULL, NULL, '16', NULL, NULL, NULL, '0', '0', '0', NULL, '', '1', NULL, NULL, NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13134092', '1477383', '3796', '2015-05-26 01:00:00', '0', '', NULL, 'Clear', '1', '1ec87f41-6d41-4b9f-ae27-2a1eb0bfa520', 'Sinead McDonnell', NULL, '0', '0', NULL, NULL, NULL, '16', NULL, NULL, NULL, '0', '0', '0', NULL, '', '1', NULL, 'Clear', NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13134093', '1477383', '3395', '2015-05-26 01:00:00', '0', '', '55', NULL, '1', '1ec87f41-6d41-4b9f-ae27-2a1eb0bfa520', 'Sinead McDonnell', NULL, '0', '0', NULL, NULL, NULL, '68', NULL, NULL, NULL, '0', '0', '0', '55', '', '1', '55', '55', NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13134094', '1477383', '3307', '2015-05-26 01:00:00', '0', '', NULL, NULL, '1', '1ec87f41-6d41-4b9f-ae27-2a1eb0bfa520', 'Sinead McDonnell', NULL, '0', '500', '10', NULL, NULL, '83', NULL, NULL, NULL, '0', '0', '0', '<10', '', '1', '5', '<10', NULL, '10');

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13134108', '1477383', '5560', '2015-05-25 13:40:000', '0', '', NULL, 'Excellent', '1', '1ec87f41-6d41-4b9f-ae27-2a1eb0bfa520', NULL, NULL, '0', '0', NULL, NULL, NULL, '16', NULL, NULL, NULL, '0', '0', '0', 'Ok', '', '1', NULL, 'Excellent', 'Ok', NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13134140', '1477383', '3358', '2015-05-26 01:00:00', '0', '', '9.21', NULL, '1', '1ec87f41-6d41-4b9f-ae27-2a1eb0bfa520', 'Sinead McDonnell', NULL, '0', '0', NULL, NULL, NULL, '2', NULL, NULL, NULL, '0', '0', '0', '9.21', '', '1', '9.21', '9.21', NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13134141', '1477383', '5887', '2015-05-26 01:00:00', '0', '', '0.5', NULL, '1', '1ec87f41-6d41-4b9f-ae27-2a1eb0bfa520', 'Sinead McDonnell', NULL, '0', '0', NULL, NULL, NULL, '61', NULL, NULL, NULL, '0', '0', '0', '0.5', '', '1', '0.5', '0.5', NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13134142', '1477383', '3319', '2015-05-26 01:00:00', '0', '', NULL, NULL, '1', '1ec87f41-6d41-4b9f-ae27-2a1eb0bfa520', 'Sinead McDonnell', NULL, '0', '200', '10', NULL, NULL, '79', NULL, NULL, NULL, '0', '0', '0', '<10', '', '1', '5', '<10', NULL, '10');

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433556', '1542501', '3241', '2015-08-30 14:40:00', '0', '', NULL, NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '31', NULL, NULL, NULL, '0', '0', '0', '>1m', '', '1', NULL, '>1m', NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433557', '1542501', '3388', '2015-08-30 14:40:00', '0', '', '16.7', NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '4', NULL, NULL, NULL, '0', '0', '0', NULL, '', '1', '16.7', NULL, NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433558', '1542501', '3244', '2015-08-30 14:40:00', '0', '', '8.2', NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '66', NULL, NULL, NULL, '0', '0', '0', NULL, '', '1', '8.2', NULL, NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433559', '1542501', '3243', '2015-08-30 14:40:00', '0', '', NULL, NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '16', NULL, NULL, NULL, '0', '0', '0', 'Absent', '', '1', NULL, 'Absent', NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433560', '1542501', '3389', '2015-08-30 14:40:00', '0', '', NULL, NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '16', NULL, NULL, NULL, '0', '0', '0', 'Absent', '', '1', NULL, 'Absent', NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433561', '1542501', '3239', '2015-08-30 14:40:00', '0', '', NULL, NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '16', NULL, NULL, NULL, '0', '0', '0', 'Absent', '', '1', NULL, 'Absent', NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433562', '1542501', '3796', '2015-08-30 14:40:00', '0', '', NULL, NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '16', NULL, NULL, NULL, '0', '0', '0', 'tide low beach calm', '', '1', NULL, 'tide low beach calm', NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433563', '1542501', '3348', '2015-08-30 14:40:00', '0', '', '112.2', NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '3', NULL, NULL, NULL, '0', '0', '0', NULL, '', '1', '112.2', NULL, NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433564', '1542501', '3361', '2015-08-30 14:40:00', '0', '', '1', NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '56', NULL, NULL, NULL, '0', '0', '0', NULL, '', '1', '1', NULL, NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433565', '1542501', '3323', '2015-08-30 14:40:00', '0', '', '33.5', NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '10', NULL, NULL, NULL, '0', '0', '0', NULL, '', '1', '33.5', NULL, NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433582', '1542501', '5560', '2015-08-30 14:40:00', '0', '', NULL, 'Excellent', '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '16', NULL, NULL, NULL, '0', '0', '0', 'Ok', '', '1', NULL, 'Excellent', 'Ok', NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433596', '1542501', '3386', '2015-08-30 14:40:00', '0', '', '8', NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '23', NULL, NULL, NULL, '0', '0', '0', NULL, '', '1', '8', NULL, NULL, NULL);

INSERT INTO dbo.Measurements 
(Meas_ID, Samp_ID, Prm_ID, Meas_Date, Meas_UpdNo, Meas_CompSym, Meas_Result, Meas_TextResult, Hchk_ID, FileIdentity, Analyst, Comment, MinimumRequiredConcentration, MaximumAllowedConcentration, LimitOfDetection, LimitOfQuantification, MethodOfAnalysis, Unit_ID, Uncertainty, UncertaintyUnit, ConfidenceInterval, AccreditedResult, StatusMAC, StatusMRC, ResultString, VerifiedStatus, FromEDEN, Report_Meas_Result, Report_Meas_TextResult, Report_ResultString, Report_Limit)
VALUES ('13433597', '1542501', '3360', '2015-08-30 14:40:00', '0', '', NULL, NULL, '1', 'a5d2e7c8-b740-473a-9cf9-73fd74d2cda8', NULL, NULL, '0', '0', NULL, NULL, NULL, '56', NULL, NULL, NULL, '0', '0', '0', '<10', '', '1', '5', '<10', NULL, '10');

SET IDENTITY_INSERT dbo.Measurements OFF






/*

-- ********************************************************************************
-- *** Sandbox

--DELETE FROM dbo.[Sample] 
--WHERE Samp_Code = '15-0768' AND samp_date = '2015-05-25 13:40:00.000'
--SELECT * FROM dbo.[Sample] WHERE Samp_Code = '31072'
SELECT * FROM dbo.Measurements WHERE Samp_ID = '1542501' -- '2015-05-26 01:00:00'
SELECT * FROM dbo.Measurements WHERE Samp_ID = '1477383' -- '2015-08-30 14:40:00'

--*/