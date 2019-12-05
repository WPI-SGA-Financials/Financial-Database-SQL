SELECT `Fiscal Year`, sum(`Amount Approved`) as 'Allocated', count(*) as 'Amount of Requests'
From `Funding Requests`
GROUP BY `Fiscal Year`
Order By `Fiscal Year`;

SELECT `Fiscal Year`, sum(`Amount Proposed` + `Approved Appeal`) as 'Allocated', count(*) as 'Amount of Requests'
From Budgets
GROUP BY `Fiscal Year`
Order By `Fiscal Year`;

SELECT `Fiscal Year`, sum(`Amount Approved`) as 'Allocated', count(*) as 'Amount of Requests'
From `Mandatory Transfers`
GROUP BY `Fiscal Year`
Order By `Fiscal Year`;

SELECT `Fiscal Year`, sum(`Amount Approved`) as 'Allocated', count(*) as 'Amount of Requests'
From `Funding Requests`
WHERE month(`Funding Date`) >= 7
GROUP BY `Fiscal Year`
Order By `Fiscal Year`;


