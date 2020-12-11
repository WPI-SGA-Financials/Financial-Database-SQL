CREATE or replace View `Operating Account` As
SELECT MLI.ID,
       MLI.`Line Item`,
       Amount,
       cast(if(sum(`O E`.Spent) is null, 0, sum(`O E`.Spent)) as Decimal(10, 2))          as Spent,
       cast(Amount - if(sum(`O E`.Spent) is null, 0, sum(`O E`.Spent)) as DECIMAL(10, 2)) as Remaining,
       count(`O E`.ID)                                                                    as Charges
From `Mandatory Transfers`
         LEFT JOIN MTLineItems MLI on `Mandatory Transfers`.ID = MLI.MT_ID
         LEFT JOIN `Operating Expenses` `O E` on MLI.ID = `O E`.MTLI_ID
Where `Fund Name` = 'Operating Account'
  and `Parent Organization` = 'Student Government Association'
  and `Fiscal Year` = fnc_FiscalYear(now())
GROUP BY `Line Item`
