# Creates the Financial Transparency View. In order to change fiscal year, change the @FiscalYear Variable
# Created by Kevin Bimonte, Accountant 2019
Set @FiscalYear = 'FY 19';
CREATE Or REPLACE VIEW `Financial Transparency` AS
Select Organizations.`Name of Club`,
       Classification,
       IF(`Active Members` Is Null, 'Not Provided', `Active Members`) AS 'Active Members',
       If(sum(`F R`.`Amount Approved`) Is NULL, 0,
          sum(`F R`.`Amount Approved`))                               As 'Funding Requests',
       If((B.`Amount Proposed` + B.`Approved Appeal`) Is Null, 0,
          (B.`Amount Proposed` + B.`Approved Appeal`))                As 'Budget'
From Organizations
         LEFT JOIN `Organization Membership Numbers`
                   on Organizations.`Name of Club` = `Organization Membership Numbers`.`Name of Organization` And
                      `Organization Membership Numbers`.`Fiscal Year` = @FiscalYear
         LEFT JOIN Budgets B on Organizations.`Name of Club` = B.`Name of Club` AND B.`Fiscal Year` = @FiscalYear
         LEFT JOIN `Funding Requests` `F R`
                   on Organizations.`Name of Club` = `F R`.`Name of Club` AND `F R`.`Fiscal Year` = @FiscalYear
Where `Inactive?` = 0
  And Organizations.Classification <> 'Department'
GROUP BY Organizations.`Name of Club`;