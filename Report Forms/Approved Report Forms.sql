SELECT `Funding Requests`.`Name of Club`,
       `Funding Requests`.`Dot Number`,
       `FRReportForms`.Status,
       `FRReportForms`.`Approved Amount`,
       `Funding Requests`.`Funding Date`
FROM `Funding Requests`,
     FRReportForms
WHERE FRReportForms.Status = 'Approved'
  AND `Funding Requests`.`Fiscal Year` = 'FY 20'
  and `Funding Requests`.ID = FRReportForms.FR_ID
ORDER BY `Funding Requests`.`Funding Date`;
