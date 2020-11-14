# Implements the Financial Expenditure Grading Algorithm
# Created by Stephanie Racca, Chair of Fiscal Responsibility and Assistance 2019
# Programmed by Kevin Bimonte, Accountant 2019
CREATE or REPLACE View `Fiscal Expenditure Grades` As
SELECT B.ID,
       B.`Name of Club`,
       B.`Fiscal Year`,
       O.Classification,
       fnc_FiscalClass(`Amount_Proposed`, `Approved_Appeal`)               AS `Fiscal Class`,
       (`Approved_Appeal` + `Amount_Proposed`)                             AS `Amount Approved`,
       `Amount_Spent`,
       fnc_FEGrading(`Amount_Proposed`, `Approved_Appeal`, `Amount_Spent`) AS Grade
FROM Budget B
         Inner Join Organizations O on B.`Name of Club` = O.`Name of Club`
         INNER JOIN BudgetSection BS on B.ID = B_ID
         Inner JOIN BudgetLineItem BLI on BS.ID = BLI.BS_ID
GROUP BY `Name of Club`, `Fiscal Year`
ORDER BY `Name of Club`, `Fiscal Year`;
