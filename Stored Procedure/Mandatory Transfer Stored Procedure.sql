DROP PROCEDURE if exists dashMTAllocation;
CREATE PROCEDURE dashMTAllocation(IN FY integer(2))
SELECT concat('$', format(sum(`Amount Approved`), 2)) as 'Total MT'
From `Mandatory Transfers`
Where `Fiscal Year` like concat('%', FY, '%');