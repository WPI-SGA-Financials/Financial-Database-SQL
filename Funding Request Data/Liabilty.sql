Set @FiscalYear = 'FY 20';
SELECT `Name of Club`,
       `Dot Number`,
       `Funding Date`,
       Description,
       `Amount Approved`,
       FRF.`Approved Amount`                                                 as `Report Form Approved Amount`,
       If(Status = 'Approved', FRF.`Approved Amount`, `Amount Approved`)     AS `Liability`,
       `Workday Approved`,
       If(`Workday Approved` = 'Yes', 0,
          If(Status = 'Approved', FRF.`Approved Amount`, `Amount Approved`)) AS `Workday Liability`
FROM `Funding Requests`
         Left JOIN FRReportForms FRF on `Funding Requests`.ID = FRF.FR_ID
WHERE `Amount Approved` > 0
  AND `Fiscal Year` = @FiscalYear
ORDER BY `Funding Date`, `Dot Number`;
