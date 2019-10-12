# Implements the Financial Expenditure Grading Algorithm
# Created by Stephanie Racca, Chair of Fiscal Responsibility and Assistance 2019
# Programmed by Kevin Bimonte, Accountant 2019
SELECT Budgets.`Name of Club`,
       Organizations.Classification,
       Class                                                   AS `Fiscal Class`,
       (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) AS `Amount Approved`,
       Budgets.`Amount Spent`,
       If(Class = 'Class A',
          If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.851 And
             `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 1.0, 'A',
             If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.701 And
                `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 0.85, 'B',
                If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.551 And
                   `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 0.70, 'C',
                   'NR'))),
          If(Class = 'Class B',
             If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.901 And
                `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 1.0, 'A',
                If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.751 And
                   `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 0.9,
                   'B',
                   If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.601 And
                      `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 0.75, 'C',
                      'NR'))),
             If(Class = 'Class C',
                If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.901 And
                   `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 1.0, 'A',
                   If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.801 And
                      `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 0.9, 'B',
                      If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.701 And
                         `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 0.8, 'C',
                         'NR'))),
                If(Class = 'Class D',
                   If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.951 And
                      `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 1.0, 'A',
                      If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.851 And
                         `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 0.95,
                         'B', If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.751 And
                                 `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 0.85, 'C',
                                 'NR'))),
                   If(Class = 'Class E',
                      If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.951 And
                         `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 1.0, 'A',
                         If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.851 And
                            `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 0.95,
                            'B',
                            If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 0.801 And
                               `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <= 0.85, 'C',
                               'NR'))),
                      If(Class = 'Class F', If(
                                          `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >=
                                          0.951 And
                                          `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <=
                                          1.0, 'A',
                                          If(`Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >=
                                             0.901 And
                                             `Amount Spent` / (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <=
                                             0.95, 'B', If(
                                                                 `Amount Spent` /
                                                                 (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >=
                                                                 0.851 And
                                                                 `Amount Spent` /
                                                                 (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) <=
                                                                 0.9, 'C', 'NR'))),
                         'No Grade'))))))                      AS Grade
FROM Budgets,
     Organizations,
     `Fiscal Class`
WHERE Budgets.`Fiscal Year` = 'FY 19'
  And (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) > 0
  AND Budgets.`Name of Club` = Organizations.`Name of Club`
  AND Budgets.`Name of Club` = `Fiscal Class`.`Name of Club`
ORDER BY `Fiscal Class`, `Name of Club`;
