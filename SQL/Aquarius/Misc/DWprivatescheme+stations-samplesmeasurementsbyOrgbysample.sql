SELECT     sample.Samp_ID, returntypes.rettyp_code,org_name,Sample.Samp_Code as Samp_Code, Sample.Samp_Date as Samp_Date, SampleType.SamTyp_Desc AS SampType_Desc, 
					  MonitoredLocation.MonitoredLocation_Code as MonitoredLocation_Code, Measurements.Meas_Result as Meas_Result, 
					  Measurements.Meas_TextResult as Meas_TextResult, resultstring,Parameter.Prm_Code as Prm_Code, 
					  Parameter.Prm_Desc as Prm_Desc, UnitOfMeasure.Unit_Code as Unit_Code, UnitOfMeasure.Unit_Name as Unit_Name, 
					   schemestation.Station_Name as StationName,
					  Measurements.ConfidenceInterval as ConfidenceInterval, 
                      Sample.Samp_LabName, Scheme.sch_name as entName
FROM         Sample INNER JOIN
                     SampleType ON Sample.SampTyp_ID = SampleType.SamTyp_id INNER JOIN
                     MonitoredLocation ON Sample.MonLoc_ID = MonitoredLocation.MonitoredLocation_ID INNER JOIN
                     schemeStation on schemeStation.Station_ID = MonitoredLocation.fkSchemeStation_ID inner join 
                     Measurements ON Sample.Samp_ID = Measurements.Samp_ID INNER JOIN
					 Parameter ON Measurements.Prm_ID = Parameter.Prm_id INNER JOIN
                     UnitOfMeasure ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID INNER JOIN
                     MonitoredEntity ON sample.MonEnt_ID = monitoredentity.monent_id  inner join
                     scheme on  monitoredentity.fkScheme_ID = Scheme.Sch_id inner join
					organisations ON Organisations.Org_Id = Monitoredlocation.Org_ID  inner join
					ReturnTypes on ReturnTypes.RetTyp_ID = Sample.RetTyp_ID
 WHERE     
 --(Organisations.Org_Code = '1500')
--and 
samp_code = '14340694'
and sch_code = '1600PUB0009'
--and returntypes.rettyp_id = 5
--ORDER BY Samp_Code, Prm_Code
order by prm_desc