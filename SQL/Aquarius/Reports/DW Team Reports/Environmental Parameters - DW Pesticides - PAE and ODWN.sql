/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ParameterCode]
      ,[WaterThemeCode]
      ,[ParameterDescription]
      ,[ChemicalFormula]
      ,[UnitOfMeasure]
      ,[ParameterTypeCode]
      ,[LowerVerificationLimit]
      ,[UpperVerificationLimit]
      ,[Multiline]
      ,[AllowTextResults]
      ,[DataTypeField]
      ,[MandatoryAudit]
      ,[MandatoryCheck]
      ,[DateDeleted]
      ,[DeletedStatus]
  FROM [Aquarius].[dbo].[tbParameter]
  WHERE [ParameterDescription] NOT IN (
'2,4-D',	
'2,4,5-T Acid Herbicide',			-- No Match
'2,4-Dichlorophenoxyacetic acid',	-- No Match
'2,6-dichlorobenzamide',	
'asulam',	
'atrazine',	
'Atrazine-Desethyl ',				-- No Match
'BAM',								-- No Match
'Bentazon',							-- No Match
'bentazone',	
'Bromacil ',	
'clopyralid',	
'cypermethrin',	
'Desethylatrazine',					-- No Match
'dichlobenil ',	
'dichlorprop',	
'diuron',	
'Fenpropidin',	
'glyphosate',	
'imazapyr',	
'isoproturon',	
'Lindane',							-- No Match
'linuron',	
'MCP',								-- No Match
'MCPA',	
'mecoprop',	
'metaldehyde',	
'Metoxuron',	
'propyzamide',	
'Prothioconazole',	
'simazine',	
'S-Metachlor ',						-- No Match
'Terbuthylazine',	
'tert–Amyl Methyl Ether'
)