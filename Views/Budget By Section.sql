# Displays budgets by section information
Create or Replace View `Budget By Section` as
Select `Name of Club`,
       `Fiscal Year`,
       BS.`Section_Name`          AS `Section Name`,
       count(BLI.`Line_Item_Name`) AS `Num of Items`,
       sum(BLI.`Amount_Request`) AS `Amount Requested`,
       sum(BLI.`Amount_Proposed`)  AS `Amount Proposed`,
       sum(BLI.`Approved_Appeal`)  AS `Approved Appeal`,
       sum(BLI.`Amount_Spent`)     AS `Amount Spent`
FROM Budget B
         INNER JOIN BudgetSection BS on B.ID = B_ID
         Inner JOIN BudgetLineItem BLI on BS.ID = BLI.BS_ID
Group by `Name of Club`, `Fiscal Year`, `Section Name`
Order by `Name of Club`, `Fiscal Year`;
