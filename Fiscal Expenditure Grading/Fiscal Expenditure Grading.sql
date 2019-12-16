# Implements the Financial Expenditure Grading Algorithm
# Created by Stephanie Racca, Chair of Fiscal Responsibility and Assistance 2019
# Programmed by Kevin Bimonte, Accountant 2019
CREATE or REPLACE View `Fiscal Expenditure Grades` As
SELECT Budgets.ID,
       Budgets.`Name of Club`,
       Budgets.`Fiscal Year`,
       Organizations.Classification,
       fnc_FiscalClass(Budgets.`Amount Proposed`, `Approved Appeal`) AS `Fiscal Class`,
       (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`)   AS `Amount Approved`,
       Budgets.`Amount Spent`,
       fnc_FEGrading(Budgets.`Amount Proposed`, Budgets.`Approved Appeal`, Budgets.`Amount Spent`)  AS Grade
FROM Budgets,
     Organizations
WHERE Budgets.`Fiscal Year` = 'FY 19'
  AND Budgets.`Name of Club` = Organizations.`Name of Club`
ORDER BY `Name of Club`;