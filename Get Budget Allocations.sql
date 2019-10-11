SELECT Budgets.`Name of Club`, Organizations.`Account Number`, (Budgets.`Amount Proposed` + Budgets.`Approved Appeal`) as Allocation
From Budgets, Organizations
Where Budgets.`Fiscal Year` = 'FY 20'
  and Budgets.`Name of Club` = Organizations.`Name of Club`
  and (Budgets.`Amount Proposed` + Budgets.`Approved Appeal`) > 0;