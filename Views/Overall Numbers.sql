# Get's the Overall Numbers
Create or Replace View `Overall Numbers` as

Select 'Allocated Budget' AS `Title`,
       sum(`Amount_Proposed` + `Approved_Appeal`) AS `Amount`
FROM Budget B
         Inner Join Organizations O on B.`Name of Club` = O.`Name of Club`
         INNER JOIN BudgetSection BS on B.ID = B_ID
         Inner JOIN BudgetLineItem BLI on BS.ID = BLI.BS_ID
Where `Fiscal Year` like '%21'

Union

Select 'Allocated FR'                                 AS `Allocated FR`,
       sum(if(`Report Form Status` = 'Approved',
              `Report Form Approved Amount`,
              `Approved`)) AS `Amount`
From `Complete Funding Request`
Where `Fiscal Year` like '%21'

Union

Select 'Allocated MT' AS `Allocated MT`,
       sum(`Amount Approved`) AS `Amount`
From `Mandatory Transfers`
Where `Fiscal Year` like '%21'

Union

Select 'Active Clubs' AS `Active Clubs`,
       sum(if(`Inactive?` = 0, 1, 0)) AS `Amount`
From `Organizations`

Union

Select 'Inactive Clubs' AS `Inactive Clubs`,
       sum(if(`Inactive?` = 1, 1, 0)) AS `Amount`
From `Organizations`;
