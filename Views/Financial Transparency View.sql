# Creates the Financial Transparency View. In order to change fiscal year, change 'FY 20' to desired Fiscal Year
# Created by Kevin Bimonte, Accountant 2019
CREATE Or REPLACE VIEW `Financial Transparency` AS
Select Organizations.`Name of Club`,
       Classification,
       IF(`Active Members` Is Null or `Active Members` = '', 'Not Provided', `Active Members`) AS 'Active Members',
       If(sum(`F R`.`Amount Approved`) Is NULL, 0,
          sum(`F R`.`Amount Approved`))                                                        As 'Funding Requests',
       If((Amount_Proposed + Approved_Appeal) Is Null, 0,
          (Amount_Proposed + Approved_Appeal))                                         As 'Budget'
From Organizations
         LEFT JOIN `Organization Membership Numbers`
                   on Organizations.`Name of Club` = `Organization Membership Numbers`.`Name of Organization` And
                      `Organization Membership Numbers`.`Fiscal Year` = 'FY 20'
         LEFT JOIN Budget B on Organizations.`Name of Club` = B.`Name of Club` AND B.`Fiscal Year` = fnc_FiscalYear(now())
         Left JOIN BudgetSection on B.ID = BudgetSection.B_ID
         Left Join BudgetLineItem on BudgetSection.ID = BudgetLineItem.BS_ID
         LEFT JOIN `Funding Requests` `F R`
                   on Organizations.`Name of Club` = `F R`.`Name of Club` AND `F R`.`Fiscal Year` = fnc_FiscalYear(now())
Where `Inactive?` = 0
  And Organizations.Classification <> 'Department'
  And Organizations.Classification <> 'Graduate'
  And Organizations.Classification <> 'Mandatory Transfer'
GROUP BY Organizations.`Name of Club`;

# Create a formatted Financial Transparency output (Cannot be sorted by number in this config but nice for displaying)
Select Organizations.`Name of Club`,
       Classification,
       IF(`Active Members` Is Null or `Active Members` = '', 'Not Provided', `Active Members`) AS 'Active Members',
       If(sum(`F R`.`Amount Approved`) Is NULL, concat('$', format(0, 2)),
          concat('$', format(sum(`F R`.`Amount Approved`), 2)))                                As 'Funding Requests',
       If((Amount_Proposed + Approved_Appeal) Is Null, concat('$', format(0, 2)),
          concat('$', format(sum(Amount_Proposed + Approved_Appeal), 2)))              As 'Budget'
From Organizations
         LEFT JOIN `Organization Membership Numbers`
                   on Organizations.`Name of Club` = `Organization Membership Numbers`.`Name of Organization` And
                      `Organization Membership Numbers`.`Fiscal Year` = 'FY 20'
         LEFT JOIN Budget B on Organizations.`Name of Club` = B.`Name of Club` AND B.`Fiscal Year` = fnc_FiscalYear(now())
         Left JOIN BudgetSection on B.ID = BudgetSection.B_ID
         Left Join BudgetLineItem on BudgetSection.ID = BudgetLineItem.BS_ID
         LEFT JOIN `Funding Requests` `F R`
                   on Organizations.`Name of Club` = `F R`.`Name of Club` AND `F R`.`Fiscal Year` = fnc_FiscalYear(now())
Where `Inactive?` = 0
  And Organizations.Classification <> 'Department'
  And Organizations.Classification <> 'Graduate'
  And Organizations.Classification <> 'Mandatory Transfer'
GROUP BY Organizations.`Name of Club`;
