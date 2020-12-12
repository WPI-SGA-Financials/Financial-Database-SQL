Create or Replace View `Budget Line Items Readable` as
Select `Name of Club`,
       `Fiscal Year`,
       Section_Name   as `Section Name`,
       Line_Item_Name as `Line Item Name`,
       Amount_Request as `Amount Requested`,
       Amount_Proposed as `Amount Proposed`,
       Approved_Appeal as `Approved Appeal`,
       Amount_Spent as `Amount Spent`
From Budget
         Inner Join BudgetSection BS on Budget.ID = BS.B_ID
         Inner Join BudgetLineItem BLI on BS.ID = BLI.BS_ID
ORDER BY `Fiscal Year` Desc, `Name of Club`;
