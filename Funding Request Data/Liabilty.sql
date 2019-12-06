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

Set @FiscalYear = 'FY 20';
Select count(*)                                                                   as `Heard Requests`,
       sum(`Amount Approved`)                                                     as `Total Approved`,
       sum(FRF.`Approved Amount`)                                                 as `RF Approved Amt`,
       sum(If(Status = 'Approved', FRF.`Approved Amount`, `Amount Approved`))     AS `Total Liability`,
       sum(if(`Workday Approved` = 'Yes', 1, 0))                                as `Approved Requests`,
       sum(If(`Workday Approved` = 'Yes', 0,
              If(Status = 'Approved', FRF.`Approved Amount`, `Amount Approved`))) AS `Total Workday Liability`
From `Funding Requests`
         Left JOIN FRReportForms FRF on `Funding Requests`.ID = FRF.FR_ID
WHERE `Amount Approved` > 0
  AND `Fiscal Year` = @FiscalYear