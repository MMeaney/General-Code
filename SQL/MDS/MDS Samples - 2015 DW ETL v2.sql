-- *******************************************************
-- *** List of approved samples in Eden MDS
-- *******************************************************

USE [EdenMDS-PRD]

DECLARE @Samp_Code	VARCHAR(25)		= NULL,
		@Org_Name	VARCHAR(100)	= NULL,
		@Ret_Type	VARCHAR(100)	= NULL,
		@Samp_Year	VARCHAR(4)		= NULL;

---- ****************************************************
---- *** Set input parameters,
---- *** e.g. Organisation, sample year, data type, etc.


SET	@Samp_Code	= ''
SET @Org_Name	= '%SLIGO%'
SET @Ret_Type	= '%RIVER%'
SET @Samp_Year	= '2015'


--SELECT * FROM tblSample_sam WHERE SampleLabCode_sam			= @Samp_Code
--SELECT * FROM tblApprovalSample_aps WHERE SampleLabCode_aps = @Samp_Code
--SELECT * FROM tblSampleHistory_sht WHERE SampleLabCode_sht	= @Samp_Code




SELECT DISTINCT
	SOR.Name					AS	[LA Name]
	--, MEA.MeasurementID_mea
	--, AUP.Name_aup
	, SOR.Code					AS	[LA Code]
	, MET.Name_met				AS	[Return Type]
	, MEN.NationalCode_men		AS	[EDEN Entity Code]
	, MEN.Name_men				AS	[Mon Ent Name]
	, STA.NationalCode_sta		AS	[Station National Code]
	, STA.Name_sta				AS	[Station Name]
	, SAM.SampleLabCode_sam		AS	[Sample Code]
	, SAM.Date_sam				AS	[Sample Date]
	, SAM.CompletionDate_sam	AS	[Sample Complete Date]
	, SAM.SampleID_sam
	----, MEA.MeasurementID_mea
	--, MEA.Result_mea
	--, ENP.Name_enp				AS	[Parameter]
	--, MEU.ShortDescription_meu	AS	[UOM]
	--, PTR.Name_ptr				AS	[Uploaded Parameter]
	--, MEU.LongDescription_meu
	----, MEUX.ShortDescription_meu	AS	[UOM_TR]
	------, MEUX.Code_meu
	----, LIM.Name_lim
	----, LIM.InstallationId_lim
	----, SAT.Description_sat		AS	[Sample Type]
	----, SMT.Name_smt				AS	[Sampling Method]
	----, SAP.Name_sap				AS	[Sample Purpose]
	----, STT.StaticName_stt		AS	[Station Type]
	------, MEA.Accredited_mea
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

FROM		dbo.tblSample_sam					SAM
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta				= SAM.StationID_sta
LEFT JOIN	dbo.tblMeasurement_mea				MEA	ON	MEA.SampleID_sam				= SAM.SampleID_sam
LEFT JOIN	dbo.tblMeasurementUnit_meu			MEU	ON	MEU.MeasurementUnitID_meu		= MEA.MeasurementUnitID_meu
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org			= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR	ON	SOR.Code						= ORG.StaticName_org
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

--WHERE	SOR.Name				LIKE '%' + @Org_Name	+ '%'
--AND		MET.Name_met			LIKE '%' + @Ret_Type	+ '%'
----AND		YEAR(SAM.Date_sam)		LIKE '%' + @Samp_Year	+ '%'
--AND		ULB.Email_usr	= 'rmorris@sligococo.ie'
--AND		PTR.Name_ptr	LIKE '%BOD%'
----OR		SAM.SampleLabCode_sam	LIKE '%' + @Samp_Code	+ '%'

WHERE SAM.SampleLabCode_sam IN 
(
'15550107',
'15550108',
'15550110',
'15550113',
'15550114',
'15550118',
'15550155',
'15550157',
'15550158',
'15550165',
'15550167',
'15550323',
'15550406',
'15550409',
'15550422',
'15550424',
'15550425',
'15550462',
'15550463',
'15550493',
'15550496',
'15550498',
'15550501',
'15550506',
'15550566',
'15550640',
'15550657',
'15550658',
'15550661',
'15550662',
'15550664',
'15550669',
'15550670',
'15550748',
'15550795',
'15550800',
'15550805',
'15550807',
'15550810',
'15550851',
'15550865',
'15550866',
'15550869',
'15550874',
'15550881',
'15550883',
'15550884',
'15551030',
'15551031',
'15551033',
'15551037',
'15551042',
'15551052',
'15551053',
'15551054',
'15551078',
'15551085',
'15551087',
'15551091',
'15551093',
'15551167',
'15551276',
'15551288',
'15551292',
'15551295',
'15551391',
'15551393',
'15551394',
'15551395',
'15551400',
'15551403',
'15551409',
'15551413',
'15551414',
'15551422',
'15551562',
'15551566',
'15551569',
'15551573',
'15551587',
'1555DW0002',
'1555DW0003',
'1555DW0004',
'1555DW0005',
'1555DW0006',
'1555DW0007',
'1555DW0008',
'1555DW0009',
'1555DW0010',
'1555DW0011',
'1555DW0012',
'1555DW0013',
'1555DW0014',
'1555DW0015',
'1555DW0016',
'1555DW0017',
'1555DW0033',
'1555DW0034',
'1555DW0035',
'1555DW0036',
'1555DW0037',
'1555DW0038',
'1555DW0039',
'1555DW0040',
'1555DW0041',
'1555DW0042',
'1555DW0043',
'1555DW0044',
'1555DW0045',
'1555DW0047',
'1555DW0048',
'1555DW0049',
'1555DW0050',
'1555DW0070',
'1555DW0071',
'1555DW0072',
'1555DW0073',
'1555DW0074',
'1555DW0075',
'1555DW0076',
'1555DW0077',
'1555DW0078',
'1555DW0079',
'1555DW0080',
'1555DW0081',
'1555DW0082',
'1555DW0083',
'1555DW0084',
'1555DW0125',
'1555DW0126',
'1555DW0127',
'1555DW0128',
'1555DW0129',
'1555DW0130',
'1555DW0131',
'1555DW0132',
'1555DW0133',
'1555DW0134',
'1555DW0135',
'1555DW0136',
'1555DW0161',
'1555DW0162',
'1555DW0163',
'1555DW0164',
'1555DW0170',
'1555DW0187',
'1555DW0189',
'1555DW0190',
'1555DW0192',
'1555DW0193',
'1555DW0194',
'1555DW0195',
'1555DW0196',
'1555DW0199',
'1555DW0200',
'1555DW0201',
'1555DW0236',
'1555DW0237',
'1555DW0238',
'1555DW0239',
'1555DW0240',
'1555DW0241',
'1555DW0242',
'1555DW0243',
'1555DW0244',
'1555DW0245',
'1555DW0246',
'1555DW0247',
'1555DW0264',
'1555DW0265',
'1555DW0266',
'1555DW0267',
'1555DW0285',
'1555DW0286',
'1555DW0288',
'1555DW0289',
'1555DW0292',
'1555DW0293',
'1555DW0294',
'1555DW0295',
'1555DW0296',
'1555DW0297',
'1555DW0305',
'1555DW0306',
'1555DW0307',
'1555DW0308',
'1555DW0309',
'1555DW0310',
'1555DW0347',
'1555DW0348',
'1555DW0349',
'1555DW0350',
'1555DW0351',
'1555DW0352',
'1555DW0353',
'1555DW0354',
'1555DW0355',
'1555DW0356',
'1555DW0357',
'1555DW0358',
'1555DW0360',
'1555DW0361',
'1555DW0362',
'1555DW0363',
'1555DW0364',
'1555DW0372',
'1555DW0375',
'1555DW0376',
'1555DW0377',
'1555DW0378',
'1555DW0379',
'1555DW0380',
'1555DW0381',
'1555DW0382',
'1555DW0383',
'1555DW0389',
'1555DW0390',
'1555DW0391',
'1555DW0392',
'1555DW0397',
'1555DW0398',
'1555DW0399',
'1555DW0419',
'1555DW0420',
'1555DW0421',
'1555DW0422',
'1555DW0424',
'1555DW0425',
'1555DW0426',
'1555DW0427',
'1555DW0428',
'1555DW0429',
'1555DW0430',
'1555DW0431',
'1555DW0432',
'1555DW0434',
'1555DW0435',
'1555DW0436',
'1555DW0437',
'1555DW0439',
'1555DW0440',
'1555DW0442',
'1555DW0455',
'1555DW0456',
'1555DW0457',
'1555DW0458',
'1555DW0459',
'1555DW0461',
'1555DW0464',
'1555DW0465',
'1555DW0466'
)
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
ORDER BY SAM.SampleLabCode_sam, SOR.Name, STA.NationalCode_sta, [Sample Date], [Mon Ent Name]--,ENP.Name_enp,  [Sample Complete Date] DESC,  --, [Return Type], ULD.UploadDate_uld


/*


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


WHERE	SOR.Name			 LIKE	'%Leitrim%'
AND		MET.Name_met		 LIKE	'%River%'
AND		YEAR(SAM.Date_sam)	 >		'2013'
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