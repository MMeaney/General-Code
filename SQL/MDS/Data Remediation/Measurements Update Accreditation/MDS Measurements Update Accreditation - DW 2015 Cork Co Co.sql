-- *****************************************
-- *** MDS: Update measurement accrediation
-- *****************************************

-- *************************************
-- Determine measurements to be updated

USE [EdenMDS-PRD]

SELECT DISTINCT
	SOR.Name					AS	[LA Name]
	, MEA.MeasurementID_mea
	, MEA.Accredited_mea
	, MEA.Result_mea
	, SAM.SampleLabCode_sam		AS	[Sample Code]
	, MET.Name_met				AS	[Return Type]
	, MEN.NationalCode_men		AS	[Mon Ent Code]
	, MEN.Name_men				AS	[Mon Ent Name]
	, STA.NationalCode_sta		AS	[Station National Code]
	, STA.Name_sta				AS	[Station Name]
	, SAM.Date_sam				AS	[Sample Date]
	, ENP.Name_enp				AS	[Parameter]
	, MEU.ShortDescription_meu	AS	[UOM]
	, LIM.Name_lim
	, SAM.Sampler_sam
	, LTRIM(RTRIM(ULB.FirstName_usr)) + ' ' + LTRIM(RTRIM(ULB.LastName_usr)) AS	[UploadedBy]
	, ULD.UploadDate_uld

FROM		dbo.tblSample_sam					SAM
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta				= SAM.StationID_sta
LEFT JOIN	dbo.tblMeasurement_mea				MEA	ON	MEA.SampleID_sam				= SAM.SampleID_sam
LEFT JOIN	dbo.tblMeasurementUnit_meu			MEU	ON	MEU.MeasurementUnitID_meu		= MEA.MeasurementUnitID_meu
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org			= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR	ON	SOR.Code						= ORG.StaticName_org
LEFT JOIN	dbo.tblUpload_uld					ULD	ON	ULD.UploadId_uld				= SAM.UploadId_uld
LEFT JOIN	dbo.tblUser_usr						ULB ON	ULB.UserID_usr					= ULD.LastUpdatedBy_usr
LEFT JOIN	dbo.tblMonitoredEntity_men			MEN ON	MEN.MonitoredEntityId_men		= STA.MonitoredEntityId_men
LEFT JOIN	dbo.tblMonitoredEntityType_met		MET ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblLimsInstallations_lim		LIM	ON	LIM.InstallationId_lim			= SAM.SourceSystem_lim
LEFT JOIN	dbo.tblEnvironmentalParameter_enp	ENP	ON	ENP.EnvironmentalParameterID_enp = MEA.EnvironmentalParameterID_enp

WHERE	SOR.Name			LIKE 'CORK COUNTY%'
AND		MET.Name_met		LIKE '%DRINK%'
AND		YEAR(SAM.Date_sam)	= 2015
--AND		(
--			--MEA.Accredited_mea	= 1
--			MEA.Accredited_mea	IS NULL 
--		OR	MEA.Accredited_mea	IN ('0')
--		)
AND		ENP.Name_enp NOT IN 
(
'1,2-Dichloroethane',
'Aluminium - filtered',
'Aluminium - unfiltered',
'Aluminium - unspecified',
'Benzene',
'Bromodichloromethane',
'Bromoform',
'Cadmium - filtered',
'Cadmium - unfiltered',
'Cadmium - unspecified',
'Cadmium and Thallium',
'Calcium - filtered',
'Calcium - unfiltered',
'Calcium - unspecified',
'Calcium Hardness (as Ca)',
'Calcium Hardness (as CaCO3)',
'Calcium IC - filtered',
'Calcium IC - unfiltered',
'Calcium IC - unspecified',
'Chloroform',
'Chromium - filtered',
'Chromium - unfiltered',
'Chromium - unspecified',
'Chromium VI - filtered',
'Chromium VI - unfiltered',
'Chromium VI - unspecified',
'Clostridium Perfringens after 24 hours',
'Clostridium Perfringens after 48 hours',
'Copper - filtered',
'Copper - unfiltered',
'Copper - unspecified',
'Cryptosporidium',
'Dibromochloromethane',
'Free Residual Chlorine',
'Giardia',
'Total Hardness (as Ca)',
'Total Hardness (as CaCO3)',
'Iron - filtered',
'Iron - unfiltered',
'Iron - unspecified',
'Lead - filtered',
'Lead - unfiltered',
'Lead - unspecified',
'Magnesium - filtered',
'Magnesium - unfiltered',
'Magnesium - unspecified',
'Magnesium IC - filtered',
'Magnesium IC - unfiltered',
'Magnesium IC - unspecified',
'Manganese - filtered',
'Manganese - unfiltered',
'Manganese - unspecified',
'Nickel - filtered',
'Nickel - unfiltered',
'Nickel - unspecified',
'Odour',
'Potassium - filtered',
'Potassium - unfiltered',
'Potassium - unspecified',
'Potassium IC - filtered',
'Potassium IC - unfiltered',
'Potassium IC - unspecified',
'Sodium - filtered',
'Sodium - unfiltered',
'Sodium - unspecified',
'Sodium IC - filtered',
'Sodium IC - unfiltered',
'Sodium IC - unspecified',
'Taste',
'Tetrachloroethene & Trichloroethene (Total)',
'Total Residual Chlorine',
'Trihalomethanes - Total'
)

ORDER BY [Parameter]
/*
1,2-Dichloroethane
Aluminium - filtered
Aluminium - unfiltered
Aluminium - unspecified
Benzene
Bromodichloromethane
Bromoform
Cadmium - filtered
Cadmium - unfiltered
Cadmium - unspecified
Cadmium and Thallium
Calcium - filtered
Calcium - unfiltered
Calcium - unspecified
Calcium Hardness (as Ca)
Calcium Hardness (as CaCO3)
Calcium IC - filtered
Calcium IC - unfiltered
Calcium IC - unspecified
Chloroform
Chromium - filtered
Chromium - unfiltered
Chromium - unspecified
Chromium VI - filtered
Chromium VI - unfiltered
Chromium VI - unspecified
Clostridium Perfringens after 24 hours
Clostridium Perfringens after 48 hours
Copper - filtered
Copper - unfiltered
Copper - unspecified
Cryptosporidium
Dibromochloromethane
Free Residual Chlorine
Giardia
Total Hardness (as Ca)
Total Hardness (as CaCO3)
Iron - filtered
Iron - unfiltered
Iron - unspecified
Lead - filtered
Lead - unfiltered
Lead - unspecified
Magnesium - filtered
Magnesium - unfiltered
Magnesium - unspecified
Magnesium IC - filtered
Magnesium IC - unfiltered
Magnesium IC - unspecified
Manganese - filtered
Manganese - unfiltered
Manganese - unspecified
Nickel - filtered
Nickel - unfiltered
Nickel - unspecified
Odour
Potassium - filtered
Potassium - unfiltered
Potassium - unspecified
Potassium IC - filtered
Potassium IC - unfiltered
Potassium IC - unspecified
Sodium - filtered
Sodium - unfiltered
Sodium - unspecified
Sodium IC - filtered
Sodium IC - unfiltered
Sodium IC - unspecified
Taste
Tetrachloroethene & Trichloroethene (Total)
Total Residual Chlorine
Trihalomethanes - Total
*/

--SELECT DISTINCT	ENP.Name_enp
--FROM		[EdenMDS-PRD].[dbo].[tblEnvironmentalParameter_enp]			ENP
--LEFT JOIN	[EdenMDS-PRD].[dbo].[tblParameterMeasurementUnitMatrix_pmx]	PMX	ON PMX.EnvironmentalParameterId_enp = ENP.EnvironmentalParameterId_enp
--LEFT JOIN	[EdenMDS-PRD].[dbo].[tblMonitoredEntityType_met]			MET	ON MET.MonitoredEntityTypeID_met = PMX.DataTypeId_met
--WHERE		MET.Name_met	LIKE '%Drinking Water%'
----AND			ENP.Name_enp	LIKE '%CHLORINE%'
--ORDER BY	ENP.Name_enp

/*
-- ********************
-- *** Initiate Update

USE [EdenMDS-PRD]

BEGIN TRANSACTION
UPDATE	dbo.tblMeasurement_mea
SET		Accredited_mea       = 1
WHERE	MeasurementID_mea    IN
(
'6011504',
'6011505',
'6011506',
'6011507',
'6011508',
'6011509',
'6011510',
'6011512',
'6011524',
'6011525',
'6011526',
'6011527',
'6011528',
'6011529',
'6011530',
'6011532',
'6011534',
'6011535',
'6011536',
'6011537',
'6011538',
'6011539',
'6011540',
'6011542',
'6011544',
'6011545',
'6011546',
'6011547',
'6011548',
'6011549',
'6011550',
'6011552',
'6011554',
'6011555',
'6011556',
'6011557',
'6011558',
'6011559',
'6011560',
'6011562',
'6011564',
'6011565',
'6011566',
'6011567',
'6011568',
'6011569',
'6011570',
'6011572',
'6011574',
'6011575',
'6011576',
'6011577',
'6011578',
'6011579',
'6011580',
'6011582',
'6011584',
'6011585',
'6011586',
'6011587',
'6011588',
'6011589',
'6011590',
'6011592',
'6011594',
'6011595',
'6011596',
'6011597',
'6011598',
'6011599',
'6011601',
'6011603',
'6011604',
'6011605',
'6011606',
'6011607',
'6011608',
'6011610',
'6011612',
'6011613',
'6011614',
'6011615',
'6011616',
'6011617',
'6011618',
'6011620',
'6011622',
'6011623',
'6011624',
'6011625',
'6011626',
'6011627',
'6011628',
'6011630',
'6011632',
'6011633',
'6011634',
'6011635',
'6011636',
'6011637',
'6011638',
'6011640',
'6011642',
'6011643',
'6011644',
'6011645',
'6011646',
'6011647',
'6011648',
'6011650',
'6011652',
'6011653',
'6011654',
'6011655',
'6011656',
'6011657',
'6011658',
'6011660',
'6011662',
'6011663',
'6011664',
'6011665',
'6011666',
'6011667',
'6011668',
'6011670',
'6011672',
'6011673',
'6011674',
'6011675',
'6011676',
'6011677',
'6011678',
'6011680',
'6011682',
'6011683',
'6011684',
'6011685',
'6011686',
'6011687',
'6011688',
'6011690',
'6011692',
'6011693',
'6011694',
'6011695',
'6011696',
'6011697',
'6011698',
'6011700',
'6011702',
'6011703',
'6011704',
'6011705',
'6011706',
'6011707',
'6011708',
'6011710',
'6011712',
'6011713',
'6011714',
'6011715',
'6011716',
'6011717',
'6011718',
'6011720',
'6031281',
'6031283',
'6031284',
'6031285',
'6031286',
'6031287',
'6031288',
'6031290',
'6031291',
'6031292',
'6031294',
'6031295',
'6031296',
'6031297',
'6031298',
'6031299',
'6031301',
'6031302',
'6031303',
'6031305',
'6031306',
'6031307',
'6031308',
'6031309',
'6031310',
'6031312',
'6031313',
'6031315',
'6031316',
'6031317',
'6031318',
'6031319',
'6031320',
'6031322',
'6031324',
'6031325',
'6031326',
'6031327',
'6031328',
'6031329',
'6031331',
'6031333',
'6031334',
'6031335',
'6031336',
'6031337',
'6031338',
'6031340',
'6031342',
'6031343',
'6031344',
'6031345',
'6031346',
'6031347',
'6031349',
'6031350',
'6031352',
'6031353',
'6031354',
'6031355',
'6031356',
'6031357',
'6031359',
'6031360',
'6031362',
'6031363',
'6031364',
'6031365',
'6031366',
'6031367',
'6031369',
'6031370',
'6031372',
'6031373',
'6031374',
'6031375',
'6031376',
'6031377',
'6031379',
'6031380',
'6031381',
'6031383',
'6031384',
'6031385',
'6031386',
'6031387',
'6031388',
'6031390',
'6031391',
'6031392',
'6031394',
'6031395',
'6031396',
'6031397',
'6031398',
'6031399',
'6031401',
'6031402',
'6031404',
'6031405',
'6031406',
'6031407',
'6031408',
'6031409',
'6031411',
'6031412',
'6031414',
'6031415',
'6031416',
'6031417',
'6031418',
'6031419',
'6031421',
'6031422',
'6031424',
'6031425',
'6031426',
'6031427',
'6031428',
'6031429',
'6031431',
'6031433',
'6031434',
'6031435',
'6031436',
'6031437',
'6031438',
'6031440',
'6031442',
'6031443',
'6031444',
'6031445',
'6031446',
'6031447',
'6031449',
'6031451',
'6031452',
'6031453',
'6031454',
'6031455',
'6031456',
'6031458',
'6031460',
'6031461',
'6031462',
'6031463',
'6031464',
'6031465',
'6031467',
'6031468',
'6031470',
'6031471',
'6031472',
'6031473',
'6031474',
'6031475',
'6031477',
'6031478',
'6031479',
'6031481',
'6031482',
'6031483',
'6031484',
'6031485',
'6031486',
'6031488',
'6031489',
'6031491',
'6031492',
'6031493',
'6031494',
'6031495',
'6031496',
'6031498',
'6031500',
'6031501',
'6031502',
'6031503',
'6031504',
'6031505',
'6031507',
'6031508',
'6031510',
'6031511',
'6031512',
'6031513',
'6031514',
'6031515',
'6031517',
'6031518',
'6031519',
'6031521',
'6031522',
'6031523',
'6031524',
'6031525',
'6031526',
'6031528',
'6031529',
'6031531',
'6031532',
'6031533',
'6031534',
'6031535',
'6031536',
'6031538',
'6031540',
'6031541',
'6031542',
'6031543',
'6031544',
'6031545',
'6031547',
'6031549',
'6031550',
'6031551',
'6031552',
'6031553',
'6031554',
'6031556',
'6031557',
'6031559',
'6031560',
'6031561',
'6031562',
'6031563',
'6031564',
'6031566',
'6031567',
'6031568',
'6031570',
'6031571',
'6031572',
'6031573',
'6031574',
'6031575',
'6031577',
'6031578',
'6031580',
'6031581',
'6031582',
'6031583',
'6031584',
'6031585',
'6031587',
'6031588',
'6031590',
'6031591',
'6031592',
'6031593',
'6031594',
'6031595',
'6031597',
'6031598',
'6031600',
'6031601',
'6031602',
'6031603',
'6031604',
'6031605',
'6031607',
'6031609',
'6031610',
'6031611',
'6031612',
'6031613',
'6031614',
'6031616',
'6031618',
'6031619',
'6031620',
'6031621',
'6031622',
'6031623',
'6031625',
'6031627',
'6031628',
'6031629',
'6031630',
'6031631',
'6031632',
'6031634',
'6031635',
'6031637',
'6031638',
'6031639',
'6031640',
'6031641',
'6031642',
'6031644',
'6031645',
'6031646',
'6031648',
'6031649',
'6031650',
'6031651',
'6031652',
'6031653',
'6031655',
'6031656',
'6031657',
'6031659',
'6031660',
'6031661',
'6031662',
'6031663',
'6031664',
'6031666',
'6031667',
'6031669',
'6031670',
'6031671',
'6031672',
'6031673',
'6031674',
'6031676',
'6031677',
'6031679',
'6031680',
'6031681',
'6031682',
'6031683',
'6031684',
'6031686',
'6031687',
'6031688',
'6031690',
'6031691',
'6031692',
'6031693',
'6031694',
'6031695',
'6031697',
'6031698',
'6031699',
'6031701',
'6031702',
'6031703',
'6031704',
'6031705',
'6031706',
'6031708',
'6031709',
'6031711',
'6031712',
'6031713',
'6031714',
'6031715',
'6031716',
'6031718',
'6031719',
'6031721',
'6031722',
'6031723',
'6031724',
'6031725',
'6031726',
'6031728',
'6031729',
'6031731',
'6031732',
'6031733',
'6031734',
'6031735',
'6031736',
'6031738',
'6031740',
'6031741',
'6031742',
'6031743',
'6031744',
'6031745',
'6031747',
'6031748',
'6031750',
'6031751',
'6031752',
'6031753',
'6031754',
'6031755',
'6031757',
'6031758',
'6031760',
'6031761',
'6031762',
'6031763',
'6031764',
'6031765',
'6031767',
'6031769',
'6031770',
'6031771',
'6031772',
'6031773',
'6031774',
'6031776',
'6031778',
'6031779',
'6031780',
'6031781',
'6031782',
'6031783',
'6031785',
'6031787',
'6031788',
'6031789',
'6031790',
'6031791',
'6031792',
'6031794',
'6031795',
'6031797',
'6031798',
'6031799',
'6031800',
'6031801',
'6031802',
'6031804',
'6031805',
'6031806',
'6031808',
'6031809',
'6031810',
'6031811',
'6031812',
'6031813',
'6031815',
'6031816',
'6031817',
'6031819',
'6031820',
'6031821',
'6031822',
'6031823',
'6031824',
'6031826',
'6031827',
'6031829',
'6031830',
'6031831',
'6031832',
'6031833',
'6031834',
'6031836',
'6031837',
'6031839',
'6031840',
'6031841',
'6031842',
'6031843',
'6031844',
'6031846',
'6031847',
'6031849',
'6031850',
'6031851',
'6031852',
'6031853',
'6031854',
'6031856',
'6031857',
'6031859',
'6031860',
'6031861',
'6031862',
'6031863',
'6031864',
'6031866',
'6031867',
'6031869',
'6031870',
'6031871',
'6031872',
'6031873',
'6031874',
'6031876',
'6031878',
'6031879',
'6031880',
'6031881',
'6031882',
'6031883',
'6031885',
'6031887',
'6031888',
'6031889',
'6031890',
'6031891',
'6031892',
'6031894',
'6031896',
'6031897',
'6031898',
'6031899',
'6031900',
'6031901',
'6031903',
'6031904',
'6031906',
'6031907',
'6031908',
'6031909',
'6031910',
'6031911',
'6031913',
'6031914',
'6031915',
'6031917',
'6031918',
'6031919',
'6031920',
'6031921',
'6031922',
'6031924',
'6031925',
'6031927',
'6031928',
'6031929',
'6031930',
'6031931',
'6031932',
'6031934',
'6031936',
'6031937',
'6031938',
'6031939',
'6031940',
'6031941',
'6031943',
'6031945',
'6031946',
'6031947',
'6031948',
'6031949',
'6031950',
'6031952',
'6031954',
'6031955',
'6031956',
'6031957',
'6031958',
'6031959',
'6031961',
'6031963',
'6031964',
'6031965',
'6031966',
'6031967',
'6031968',
'6031970',
'6031971',
'6031973',
'6031974',
'6031975',
'6031976',
'6031977',
'6031978',
'6031980',
'6031981',
'6031982',
'6031984',
'6031985',
'6031986',
'6031987',
'6031988',
'6031989',
'6031991',
'6031992',
'6031993',
'6031995',
'6031996',
'6031997',
'6031998',
'6031999',
'6032000',
'6032002',
'6032003',
'6032004',
'6032006',
'6032007',
'6032008',
'6032009',
'6032010',
'6032011',
'6032013',
'6032014',
'6032016',
'6032017',
'6032018',
'6032019',
'6032020',
'6032021',
'6032023',
'6032025',
'6032026',
'6032027',
'6032028',
'6032029',
'6032030',
'6032032',
'6032034',
'6032035',
'6032036',
'6032037',
'6032038',
'6032039',
'6032041',
'6032042',
'6032044',
'6032045',
'6032046',
'6032047',
'6032048',
'6032049',
'6032051',
'6032052'
)
--COMMIT TRANSACTION
----ROLLBACK TRANSACTION
--*/