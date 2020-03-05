Drop PROCEDURE if exists dashBudgetAlloc;
Create PROCEDURE dashBudgetAlloc(IN FY integer(2))
SELECT concat('$', format(sum(`Amount Proposed` + `Approved Appeal`), 2)) as 'Total Budget'
FROM Budgets
WHERE `Fiscal Year` like concat('%', FY, '%');