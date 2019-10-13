Set @FiscalYear = 'FY 19';
CREATE Or REPLACE View `Fiscal Class` AS
SELECT `Name of Club`,
       IF(((Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) > 0 And
           (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) < 1000), 'Class A',
          If(((Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 1000 And
              (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) < 5000), 'Class B',
             If(((Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 5000 And
                 (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) < 10000), 'Class C',
                If(((Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 10000 And
                    (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) < 50000), 'Class D',
                   If(((Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 50000 And
                       (Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) < 100000), 'Class E',
                      If(((Budgets.`Approved Appeal` + Budgets.`Amount Proposed`) >= 100000), 'Class F',
                         'Not budgeted')))))) AS Class
From Budgets
WHERE `Fiscal Year` = @FiscalYear;