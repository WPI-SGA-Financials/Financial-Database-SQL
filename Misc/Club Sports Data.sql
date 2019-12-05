# Club Sports Budget Allocation
SELECT `Fiscal Year`,
       sum((`Amount Proposed` + `Approved Appeal`)) as `Allocated`
From Budgets
         Left JOIN Organizations O on Budgets.`Name of Club` = O.`Name of Club`
WHERE Classification = 'Class 2 - Club Sports'
   or `Type of Club` = 'Sport'
GROUP BY `Fiscal Year`;

# Club Sports Funding Request Allocation
SELECT `Fiscal Year`,
       sum(`Amount Approved`) as `Allocated`
From `Funding Requests`
         Left JOIN Organizations O on `Funding Requests`.`Name of Club` = O.`Name of Club`
WHERE Classification = 'Class 2 - Club Sports'
   or `Type of Club` = 'Sport'
GROUP BY `Fiscal Year`;

# Club Sports Mandatory Transfer Allocation
SELECT `Fiscal Year`,
       sum(`Amount Approved`) as `Allocated`
From `Mandatory Transfers`
WHERE `Parent Organization` = 'Club Sports Administration'
GROUP BY `Fiscal Year`;

# Alpine & Nordic Ski Team Budget Allocation
SELECT `Fiscal Year`,
       sum((`Amount Proposed` + `Approved Appeal`)) as `Allocated`
From Budgets
         Left JOIN Organizations O on Budgets.`Name of Club` = O.`Name of Club`
WHERE O.`Name of Club` = 'Alpine & Nordic Ski Team'
GROUP BY `Fiscal Year`;

# Alpine & Nordic Ski Team Funding Request Allocation
SELECT `Fiscal Year`,
       sum(`Amount Approved`) as `Allocated`
From `Funding Requests`
         Left JOIN Organizations O on `Funding Requests`.`Name of Club` = O.`Name of Club`
WHERE O.`Name of Club` = 'Alpine & Nordic Ski Team'
GROUP BY `Fiscal Year`;