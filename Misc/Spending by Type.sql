Select `Fiscal Year`,
       `Type of Club`,
       count(`Type of Club`)                           as `Count`,
       If((B.`Amount Proposed` + B.`Approved Appeal`) Is Null, 0,
          (B.`Amount Proposed` + B.`Approved Appeal`)) As 'Budget'
From Organizations
         LEFT JOIN Budgets B on Organizations.`Name of Club` = B.`Name of Club`
Where `Type of Club` != ''
  and `Type of Club` is not Null
  and `Fiscal Year` is not Null
GROUP BY `Type of Club`, B.`Fiscal Year`
ORDER BY `Type of Club`;

Select `Fiscal Year`,
       `Type of Club`,
       count(`Type of Club`)            as `Count`,
       If(sum(`F R`.`Amount Approved`) Is NULL, 0,
          sum(`F R`.`Amount Approved`)) As 'Funding Requests'
From Organizations
         LEFT JOIN `Funding Requests` `F R` on Organizations.`Name of Club` = `F R`.`Name of Club`
Where `Type of Club` != ''
  and `Type of Club` is not Null
  and `Fiscal Year` is not Null
GROUP BY `Type of Club`, `F R`.`Fiscal Year`
ORDER BY `Type of Club`;