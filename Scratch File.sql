SELECT `Funding Requests`.`Name of Club`,
       `Funding Requests`.`Dot Number`,
       `Funding Requests`.Description,
       `Funding Date`,
       FRF.`Spent Amount`,
       FRF.Status,
       FRF.`Approved Amount`,
       FRF.`Approved Date`
From `Funding Requests`
         Left JOIN FRReportForms FRF on `Funding Requests`.ID = FRF.FR_ID
Where `Fiscal Year` = 'FY 20' and Decision <> 'Denied'
Order BY `Funding Date` DESC, `Dot Number` DESC