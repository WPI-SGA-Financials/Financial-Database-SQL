Set @FiscalYear = 'FY 21';
SELECT Budgets.`Name of Club`,
       `Account Number`,
       (Budgets.`Amount Proposed` + Budgets.`Approved Appeal`) as Allocation
From Budgets INNER Join Organizations O on Budgets.`Name of Club` = O.`Name of Club`
Where Budgets.`Fiscal Year` = @FiscalYear
  and (Budgets.`Amount Proposed` + Budgets.`Approved Appeal`) > 0;