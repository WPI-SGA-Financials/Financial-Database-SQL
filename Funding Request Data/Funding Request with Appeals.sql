Set @FiscalYear = 'FY 20';
SELECT `Funding Requests`.`Name of Club`,
       `Funding Requests`.`Fiscal Year`,
       `Funding Requests`.`Dot Number`,
       `Funding Requests`.`Amount Requested`,
       `Funding Requests`.Decision,
       `Funding Requests`.`Amount Approved`,
       If(FRAppeals.`Appeal Date` IS NULL, 0, 1) AS `Appealed`,
       IF(FRAppeals.`Appeal Date` IS NULL, 0, FRAppeals.`Appeal Date`) AS `Appeal Date`,
       IF(FRAppeals.`Appeal Amount` Is NUll, 0, FRAppeals.`Appeal Amount`) AS `Appeal Amount`,
       If(FRAppeals.`Decision` Is Null, '', FRAppeals.Decision) AS `Decision`,
       If(FRAppeals.`Approved Appeal` Is Null, 0, FRAppeals.`Approved Appeal`) AS `Approved Appeal`,
       If(FRAppeals.Notes Is NUll, '', FRAppeals.Notes) AS `Appeal Notes`
From `Funding Requests`
     LEFT JOIN FRAppeals on `Funding Requests`.ID = FR_ID
WHERE `Fiscal Year` = @FiscalYear;