-- *******************************************************
-- *** List of approved samples in Eden MDS
-- *******************************************************

USE [EdenMDS-STG]

DECLARE @SampCode	VARCHAR(25)	 = '16-1285',
		@OrgName	VARCHAR(100) = NULL,
		@RetType	VARCHAR(100) = NULL,
		@SampYear	VARCHAR(4)	 = NULL,
		@EdenEmail	VARCHAR(100) = NULL;

-- ****************************************************
-- *** Set input parameters,
-- *** e.g. Organisation, sample year, data type, etc.


--SET @SampCode	= ''
--SET @OrgName	= '%SLIGO%'
--SET @RetType	= '%RIVER%'
--SET @SampYear	= '2015'
--SET @EdenEmail	= ''


--SELECT * FROM tblSample_sam WHERE SampleLabCode_sam			= @SampCode
--SELECT * FROM tblApprovalSample_aps WHERE SampleLabCode_aps = @SampCode
--SELECT * FROM tblSampleHistory_sht WHERE SampleLabCode_sht	= @SampCode




SELECT DISTINCT
	SAM.SampleID_sam
	, MEA.MeasurementID_mea
	, SOR.Name					AS	[LA_Name]
	--, MEA.MeasurementID_mea
	--, AUP.Name_aup
	, SOR.Code					AS	[LA_Code]
	, MET.Name_met				AS	[Return_Type]
	, MEN.NationalCode_men		AS	[EDEN_Entity_Code]
	, MEN.Name_men				AS	[Mon_Ent_Name]
	, STA.NationalCode_sta		AS	[Station_National_Code]
	, STA.Name_sta				AS	[Station_Name]
	, SAM.SampleLabCode_sam		AS	[Sample_Code]
	, SAM.Date_sam				AS	[Sample_Date]
	, SAM.CompletionDate_sam	AS	[Sample_Complete_Date]
	, YEAR(SAM.Date_sam)		AS	[Sample_Year]
	--, SAM.SampleID_sam
	--, MEA.MeasurementID_mea
	, MEA.Result_mea
	, ENP.Name_enp				AS	[Parameter]
	, MEU.ShortDescription_meu	AS	[UOM]
	--, PTR.Name_ptr				AS	[Uploaded_Parameter]
	--, MEU.LongDescription_meu
	--, MEU.Code_meu
	--, MEUX.ShortDescription_meu	AS	[UOM_TR]
	----, MEUX.Code_meu
	--, LIM.Name_lim
	--, LIM.InstallationId_lim
	--, SAT.Description_sat		AS	[Sample_Type]
	--, SMT.Name_smt				AS	[Sampling_Method]
	--, SAP.Name_sap				AS	[Sample_Purpose]
	--, STT.StaticName_stt		AS	[Station_Type]
	----, MEA.Accredited_mea
	, SAM.LastUpdateDate_sam
	, SAM.Sampler_sam
	, LTRIM(RTRIM(ULB.FirstName_usr)) + ' ' + LTRIM(RTRIM(ULB.LastName_usr)) AS	[UploadedBy]
	, ULB.Email_usr AS [Uploader_Email]
	, SAM.ApprovalDate_sam
	, LTRIM(RTRIM(UAP.FirstName_usr)) + ' ' + LTRIM(RTRIM(UAP.LastName_usr)) AS	[ApprovedBy]
	, UAP.Email_usr AS [Approver_Email]
	, LTRIM(RTRIM(UAT.FirstName_usr)) + ' ' + LTRIM(RTRIM(UAT.LastName_usr)) AS	[AuthLvlSetBy]
	, AUT.LastUpdateDate_flv	AS	[AuthLvlSetDate]
	, ULD.UploadId_uld
	, ULD.filename_uld
	--, ULD.UploadDate_uld
	--, ULD.Data_uld
	----, AUP.Name_aup
	, SAM.RevisionComment_sam
	, SAP.Name_sap
	, MEA.LastUpdateDate_mea
	, STA.Easting_sta
	, STA.Northing_sta

FROM		dbo.tblSample_sam					SAM
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta				= SAM.StationID_sta
LEFT JOIN	dbo.tblMeasurement_mea				MEA	ON	MEA.SampleID_sam				= SAM.SampleID_sam
LEFT JOIN	dbo.tblMeasurementUnit_meu			MEU	ON	MEU.MeasurementUnitID_meu		= MEA.MeasurementUnitID_meu
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org			= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-STG].dbo.Organisation		SOR	ON	SOR.Code						= ORG.StaticName_org
LEFT JOIN	dbo.tblUpload_uld					ULD	ON	ULD.UploadId_uld				= SAM.UploadId_uld
LEFT JOIN	dbo.tblUser_usr						ULB ON	ULB.UserID_usr					= ULD.LastUpdatedBy_usr
LEFT JOIN	dbo.tblUser_usr						UAP ON	UAP.UserID_usr					= SAM.ApprovedBy_usr
LEFT JOIN	dbo.tblMonitoredEntity_men			MEN ON	MEN.MonitoredEntityId_men		= STA.MonitoredEntityId_men
LEFT JOIN	dbo.tblMonitoredEntityType_met		MET ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblSchemeYear_scy				SCY ON	SCY.MonitoredEntityId_men		= MEN.MonitoredEntityId_men
LEFT JOIN	dbo.tblReturnYear_rty				RTY ON	RTY.ReturnYear_rty				= SCY.ReturnYear_rty
LEFT JOIN	dbo.tblReturnYearStatus_rst			RST ON	RST.StatusID_rst				= RTY.StatusID_rst
LEFT JOIN	dbo.tblSamplePurpose_sap			SAP	ON	SAP.SamplePurposeID_sap			= SAM.SamplePurposeID_sap
LEFT JOIN	dbo.tblSampleType_sat				SAT	ON	SAT.SampleTypeID_sat			= SAM.SampleTypeID_sat
LEFT JOIN	dbo.tblSampleAuthorization_aut		AUT ON	AUT.SampleID_sam				= SAM.SampleID_sam
LEFT JOIN	dbo.tblSamplingMethod_smt			SMT ON	SMT.SamplingMethodID_smt		= SAM.SamplingMethodID_smt
LEFT JOIN	dbo.tblStationType_stt				STT	ON	STT.StationTypeId_stt			= STA.StationTypeId_stt
LEFT JOIN	dbo.tblAuthorizationPurpose_aup		AUP ON	AUP.AuthorizationPurposeID_aup	= AUT.AuthorizationPurposeID_aup
LEFT JOIN	dbo.tblUser_usr						UAT ON	UAT.UserID_usr					= AUT.LastUpdatedBy_usr
LEFT JOIN	dbo.tblLimsInstallations_lim		LIM	ON	LIM.InstallationId_lim			= SAM.SourceSystem_lim
LEFT JOIN	dbo.tblEnvironmentalParameter_enp	ENP	ON	ENP.EnvironmentalParameterID_enp = MEA.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblParameterTranslation_ptr		PTR ON	(
														PTR.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
														AND
														PTR.InstallationId_lim				= SAM.SourceSystem_lim
														)
LEFT JOIN	dbo.tblUser_usr								UPT	 ON	UPT.UserID_usr						= PTR.LastUpdatedBy_usr
LEFT JOIN	dbo.tblParameterMeasurementUnitMatrix_pmx	PMX	 ON	PMX.EnvironmentalParameterId_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblMeasurementUnit_meu					MEUX ON	MEUX.MeasurementUnitID_meu			= PMX.MeasurementUnitID_meu


--WHERE	(SOR.Name				LIKE '%' + (@OrgName)	+ '%' OR (@OrgName)		IS NULL)
--AND		(MET.Name_met			LIKE '%' + (@RetType)	+ '%' OR (@RetType)		IS NULL)
--AND		(YEAR(SAM.Date_sam)		LIKE '%' + (@SampYear)	+ '%' OR (@SampYear)	IS NULL)
--AND		(SAM.SampleLabCode_sam	LIKE '%' + (@SampCode)	+ '%' OR (@SampCode)	IS NULL)
--AND		(ULB.Email_usr			LIKE '%' + (@EdenEmail)	+ '%' OR (@EdenEmail)	IS NULL)

--WHERE	STA.NationalCode_sta LIKE '%TPEFF0600D0535SW001%'

--WHERE SAM.SampleLabCode_sam LIKE '1149656%'

--WHERE	MEA.MeasurementID_mea = '7266989'

--WHERE SAP.Name_sap = 'Drinking Water Public Abstraction - A3'

--WHERE SAM.SampleLabCode_sam IN
--(
--'16443431'
----,
----'52434',
----'52436',
----'52440',
----'52439',
----'52435',
----'52438',
----'52433'
--)
--AND		MET.Name_met	LIKE '%BATH%'
--AND		SOR.Name		LIKE '%KERRY%'
--AND		ENP.Name_enp	LIKE '%NITR%'

--AND		PTR.Name_ptr	LIKE '%BOD%'
--WHERE		ULD.Filename_uld	LIKE '%BW 05-09-2016.xml%'

--ORDER BY SAM.SampleLabCode_sam, SOR.Name, STA.NationalCode_sta, [Sample Date], [Mon Ent Name]--, ENP.Name_enp--, ENP.Name_enp,  [Sample Complete Date] DESC,  --, [Return Type], ULD.UploadDate_uld


/*

--AND		ENP.Name_enp = 'pah'
--AND		SOR.Name			LIKE '%CLARE%'
--AND		
--WHERE	MET.Name_met		 LIKE '%BATH%'
--AND		YEAR(SAM.Date_sam) = 2015
--AND		MEN.NationalCode_men LIKE '%D0127-01%'

--WHERE SAM.SampleLabCode_sam IN 
--(
--'1655DW0066'
--)

--WHERE	
--ULD.Filename_uld	LIKE '%TippCoCoMarch2016DWCheck.xml%'
--AND		ENP.Name_enp = 'Conductivity @ 25°C (on-site)'
--WHERE STA.NationalCode_sta	 IN (
--'RS13B010090'
--, 'RS13B010089'
--)


WHERE	SAM.SampleLabCode_sam	IN (
'MEATH2015/0742',
'MEATH2015/0742',
'MEATH2015/0693',
'MEATH2015/0693',
'MEATH2015/0908',
'MEATH2015/0908',
'MEATH2015/1028',
'MEATH2015/1028',
'MEATH2015/0887',
'MEATH2015/0887',
'MEATH2015/1126',
'MEATH2015/1126',
'MEATH2015/1125'
)
--AND		
--ENP.Name_enp			=	'Salinity(Lab)'
--WHERE	SAM.SampleLabCode_sam	=	'DW2015022'
--ENP.Name_enp	LIKE	'%SALINITY%'
----WHERE	SOR.Code		= '1700'-- '2100)
----AND		AUP.Name_aup = 'EPA Return'
--AND		SOR.Name			LIKE 'Kerry County Council'
----AND ULD.filename_uld = 'River_Samples_upldfeb23a_20160224_103922.xml'

----AND		YEAR(SAM.Date_sam)	= 2015
----AND		(
----			MEA.Accredited_mea	IS NULL 
----		--OR	MEA.Accredited_mea	IN ('0')
----		)
----AND		ENP.Name_enp		IN ('Odour', 'Taste', 'Dissolved Organic Carbon')

--WHERE	STA.NationalCode_sta IN ('RS07K670630', 'RS07K670680')
--WHERE		Sam.SampleLabCode_sam = '1531004'
--WHERE ULD.FILEID_ULD = '5bbebdab-6818-420c-a13a-bde64e367990'
--WHERE ULD.filename_uld LIKE '%EdenDET-20151014-213006-KK-DW.xml%'--'%EdenDET-20150408-1930%'--EdenDET-20151014-213006-KK-DW.xml C:\Aquarius\WFD\LIMSFiles\ForEdenUpload\EdenDET-20150408-193008-CB-LK.xml
--WHERE SAM.SampleLabCode_sam IN ('15-0292', '15-1569')/0594'
--AND		SAP.Name_sap		= 'Waste Water Discharge'
--AND		YEAR(SAM.Date_sam)	> '2014'
--AND		ULD.UploadId_uld = '77743285-B700-45F4-91FE-08E78EF655CB'
--AND		SAM.SourceSystem_lim = '1EE35487-6346-440E-BF12-9AB47AB44D30'
--AND		ULD.UploadDate_uld	> '2014-08-14 10:05:10.723'
--AND		ULD.UploadDate_uld	< '2014-08-16 10:05:10.723'
--AND		ULD.filename_uld = 'LabInfoDW_WaterfordCoCo DWQ1 2014 25-02-2015 14-31.xml'
--AND		ULD.UploadedBy_usr  = '282'
--*/

WHERE	
--SOR.Name			 LIKE	'%Leitrim%'
--AND		
MET.Name_met		 LIKE	 '%Lake%'
AND		YEAR(SAM.Date_sam) > '2016'
/*
AND		STA.NationalCode_sta IN
(
'RS26D050300',
'RS26O020100',
'RS26O020200',
'RS26R020060',
'RS26S020500',
'RS26S020530',
'RS26S020600',
'RS26S020915',
'RS35B060600',
'RS35D030100',
'RS36L020600'
)
--*/
/*

WHERE	SOR.Code				=	 '3300'
AND		YEAR(SAM.Date_sam)		=	 '2015'
AND		MEN.NationalCode_men	=	 '12U01'
AND		STA.NationalCode_sta	LIKE '%0200%'

WHERE	STA.NationalCode_sta IN
(
'RS25T030400',
'RS25C060500',
'RS25B090760',
'RS25S020700',
'RS25B091100',
'RS25L010200',
'RS25L020700',
'RS25G210010',
'RS15B010200'
)


--SAM.SampleLabCode_sam	IN	('14-0080', '14-0109', '14-1381')
		SAM.SampleLabCode_sam	IN	('14-1131', '14-1364')
--AND		SOR.Code				=	'0300'


SELECT * FROM [EdenMDS-PRD].[dbo].[tblSample_sam]		
WHERE SampleLabCode_sam	IN(
'1898896',
'1898897',
'1904224',
'1904225',
'1904234',
'1904235',
'1902831'
)
SELECT * FROM [EdenMDS-PRD].[dbo].[tblSample_sam]		
WHERE SampleLabCode_sam	IN(
'1898849',
'1898881',
'1898899',
'1898900',
'1898904',
'1898906',
'1902838',
'1902830',
'1902834',
'1902840',
'1904244',
'1898895',
'1904239',
'1898920',
'1904223',
'1904227',
'1904233',
'1898902',
'1904237',
'1904229',
'1898848',
'1898880',
'1898894',
'1898898',
'1898901',
'1898903',
'1898905',
'1898919',
'1904222',
'1904226',
'1904228',
'1904230',
'1904232',
'1904236',
'1904238',
'1904243',
'1902829'
)
ORDER BY SampleLabCode_sam
--*/


/*
-- *********************
-- *** MDS Sample Audit
-- *********************
-- Last update date (check if within the latest year, so it's not affecting returns)
SELECT SMH.*
	, USR.FirstName_usr + ' ' + USR.LastName_usr 	AS	[UploadedBy] 
FROM		[EdenMDS-PRD].[dbo].[tblSampleHistory_sht]	SMH
INNER JOIN	[EdenMDS-PRD].[dbo].[tblUser_usr]			USR	ON	USR.UserID_usr = SMH.LastUpdatedBy_usr
WHERE		SampleLabCode_sht = '14370003'
--*/