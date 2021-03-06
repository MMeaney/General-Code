USE [EdenMDS-PRD]

/*-------------------------------------
***** MDS Sample History / Audit  *****
-------------------------------------*/

DECLARE @Samp_Code	VARCHAR(25)		= NULL;
DECLARE @Org_Name	VARCHAR(100)	= NULL;
DECLARE @Ret_Type	VARCHAR(100)	= NULL;
DECLARE @Samp_Year	VARCHAR(4)		= NULL;

---- ****************************************************
---- *** Set input parameters,
---- *** e.g. Organisation, sample year, data type, etc.


SET	@Samp_Code	= '2016086'
--SET @Org_Name	= '%DONEGAL%'
--SET @Ret_Type	= '%WASTE%'
--SET @Samp_Year	= '2015'

SELECT DISTINCT
	SOR.Name					AS	[LA Name]
	, SOR.Code					AS	[LA Code]
	, MET.Name_met				AS	[Mon Ent Type]
	, MEN.NationalCode_men		AS	[Mon Ent Code]
	, MEN.Name_men				AS	[Mon Ent Name]
	, STA.NationalCode_sta		AS	[Station Code]
	, STA.Name_sta				AS	[Station Name]
	, SHT.SampleLabCode_sht
	, SHT.Deleted_sht
	, SHT.Version_sht
	, SHT.RevisionComment_sht
	, SHT.SampleHistoryId_sht
	, SHT.SampleID_sam
	, SHT.StationID_sta
	, SMT.Name_smt					AS [Sampling Method]
	, SAP.Name_sap					AS [Sample Purpose]
	, SAT.Description_sat			AS [Sample Type]
	, SHT.CompletionDate_sht
	, SHT.Date_sht
	, SHT.Details_sht
	, SHT.Sampler_sht
	, SHT.SourceSystem_lim
	, ULD.UploadDate_uld
	, SHT.ApprovalDate_sht
	, SHT.LastUpdateDate_sht
	, UAP.FirstName_usr + ' ' + UAP.LastName_usr 	 AS	[ApprovedBy]
	, ULB.FirstName_usr + ' ' + ULB.LastName_usr 	 AS	[LastUpdatedBy]
	, ULD.FileName_uld
	--, SHT.CommissionedByID_reg
	--, SHT.StatusAR_sht
	--, SHT.StatusMAC_sht
	--, SHT.StatusMRC_sht
	--, SHT.SubnetID_sht
	--, SHT.WaterBodyCode_sht
	--, SHT.PreapprovalDate_sht
	--, SHT.PreapprovedByEHO_usr
	--, SHT.SurrogateStation_sht
	--, SHT.SurrogateNorthing_sht
	--, SHT.SurrogateEasting_sht
	--, MEA.Result_mea
	--, ENP.Name_enp				AS	[Parameter]
	--, MEU.ShortDescription_meu	AS	[UOM]
	----, PTR.Name_ptr				AS	[Uploaded Parameter]

FROM		dbo.tblSampleHistory_sht			SHT
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta				= SHT.StationID_sta
LEFT JOIN	dbo.tblMeasurement_mea				MEA	ON	MEA.SampleID_sam				= SHT.SampleID_sam
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org			= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR	ON	SOR.Code						= ORG.StaticName_org
LEFT JOIN	dbo.tblUser_usr						ULB	ON	ULB.UserID_usr					= SHT.LastUpdatedBy_usr
LEFT JOIN	dbo.tblUser_usr						UAP	ON	UAP.UserID_usr					= SHT.ApprovedBy_usr
LEFT JOIN	dbo.tblMonitoredEntity_men			MEN ON	MEN.MonitoredEntityId_men		= STA.MonitoredEntityId_men
LEFT JOIN	dbo.tblMonitoredEntityType_met		MET ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblSamplePurpose_sap			SAP	ON	SAP.SamplePurposeID_sap			= SHT.SamplePurposeID_sap
LEFT JOIN	dbo.tblSampleType_sat				SAT	ON	SAT.SampleTypeID_sat			= SHT.SampleTypeID_sat
LEFT JOIN	dbo.tblSampleAuthorization_aut		AUT ON	AUT.SampleID_sam				= SHT.SampleID_sam
LEFT JOIN	dbo.tblAuthorizationPurpose_aup		AUP ON	AUP.AuthorizationPurposeID_aup	= AUT.AuthorizationPurposeID_aup
LEFT JOIN	dbo.tblUser_usr						UAT ON	UAT.UserID_usr					= AUT.LastUpdatedBy_usr
LEFT JOIN	dbo.tblSamplingMethod_smt			SMT	ON	SMT.SamplingMethodID_smt		= SHT.SamplingMethodID_smt
LEFT JOIN	dbo.tblUpload_uld					ULD	ON	ULD.UploadId_uld				= SHT.UploadId_uld
LEFT JOIN	dbo.tblMeasurementUnit_meu			MEU	ON	MEU.MeasurementUnitID_meu		= MEA.MeasurementUnitID_meu
LEFT JOIN	dbo.tblEnvironmentalParameter_enp	ENP	ON	ENP.EnvironmentalParameterID_enp = MEA.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblParameterTranslation_ptr		PTR ON	(
														PTR.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
														AND
														PTR.InstallationId_lim				= SHT.SourceSystem_lim
														)
LEFT JOIN	dbo.tblUser_usr								UPT	 ON	UPT.UserID_usr						= PTR.LastUpdatedBy_usr
LEFT JOIN	dbo.tblParameterMeasurementUnitMatrix_pmx	PMX	 ON	PMX.EnvironmentalParameterId_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblMeasurementUnit_meu					MEUX ON	MEUX.MeasurementUnitID_meu			= PMX.MeasurementUnitID_meu


WHERE	SHT.SampleLabCode_sht	LIKE @Samp_Code
OR		SOR.Name				LIKE @Org_Name
OR		MET.Name_met			LIKE @Ret_Type
OR		YEAR(SHT.Date_sht)		LIKE @Samp_Year

ORDER BY	SHT.SampleLabCode_sht
