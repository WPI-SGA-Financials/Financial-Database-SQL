SELECT `Organizations`.`Name of Club`,
       `Organizations`.`Account Number`,
       count(`Funding Requests`.`Dot Number`) as Amount
FROM `sgadb`.`Organizations`
         Inner Join `sgadb`.`Funding Requests` on `Organizations`.`Name of Club` = `Funding Requests`.`Name of Club`
Where `Organizations`.`Inactive?` = 0
Group By `Organizations`.`Name of Club`
Order BY count(`Funding Requests`.`Dot Number`) Desc;