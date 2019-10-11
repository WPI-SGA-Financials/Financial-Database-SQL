Select Organizations.`Name of Club`,
       Classification,
       `Active Members`,
       sum(`F R`.`Amount Approved`)                As `Funding Requests`,
       (B.`Amount Proposed` + B.`Approved Appeal`) As Budget
From Organizations
         LEFT JOIN `Organization Membership Numbers`
                   on Organizations.`Name of Club` = `Organization Membership Numbers`.`Name of Organization` And
                      `Organization Membership Numbers`.`Fiscal Year` = 'FY 19'
         LEFT JOIN Budgets B on Organizations.`Name of Club` = B.`Name of Club` AND B.`Fiscal Year` = 'FY 19'
         LEFT JOIN `Funding Requests` `F R`
                   on Organizations.`Name of Club` = `F R`.`Name of Club` AND `F R`.`Fiscal Year` = 'FY 19'
Where `Inactive?` = 0
  And Not (Organizations.Classification = 'Department')
GROUP BY Organizations.`Name of Club`;