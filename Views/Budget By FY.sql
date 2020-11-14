# Shows Budget info by FY from both Legacy and Current Budgets
create or replace view `Budget By FY` as
select `Name of Club`,
       `Fiscal Year`,
       sum(`Num of Items`)     AS `Num of Items`,
       sum(`Amount Requested`) AS `Amount Requested`,
       sum(`Amount Proposed`)  AS `Amount Proposed`,
       sum(`Approved Appeal`)  AS `Approved Appeal`,
       sum(`Approved Appeal` + `Amount Proposed`) as `Amount Approved`,
       sum(`Amount Spent`)     AS `Amount Spent`
from `Budget By Section`
group by `Name of Club`, `Fiscal Year`

Union

SELECT `Name of Club`,
       `Fiscal Year`,
       -1,
       `Amount Requested`,
       `Amount Proposed`,
       `Approved Appeal`,
       sum(`Approved Appeal` + `Amount Proposed`) as `Amount Approved`,
       `Amount Spent`
From Budget B INNER JOIN BudgetLegacy BL on B.ID = B_ID
group by `Name of Club`, `Fiscal Year`
order by `Name of Club`, `Fiscal Year`;
