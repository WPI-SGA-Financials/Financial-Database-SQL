Set @FiscalYear = 'FY 19';
SELECT `Name of Club`,
       `Funding Date`,
       `Dot Number`,
       `Amount Approved`,
       `Report Form Approved Amount`,
       If(`Report Form Approved` = 'Yes', `Report Form Approved Amount`, `Amount Approved`)     AS Liability,
       If(`Workday Approved` = 'Yes', 0,
          If(`Report Form Approved` = 'Yes', `Report Form Approved Amount`, `Amount Approved`)) AS `Workday Liability`
FROM `Funding Requests`
WHERE `Amount Approved` > 0
  AND `Fiscal Year` = @FiscalYear
ORDER BY `Funding Date`;
