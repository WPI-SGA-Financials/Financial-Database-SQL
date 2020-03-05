Drop PROCEDURE if exists dashFRAllocation;
Create PROCEDURE dashFRAllocation(IN FY integer(2))
SELECT concat('$', format(sum(If(Status = 'Approved', FRF.`Approved Amount`, `Amount Approved`)), 2)) as 'Total FR'
From `Funding Requests`
         LEFT JOIN FRReportForms FRF on `Funding Requests`.ID = FRF.FR_ID
Where `Fiscal Year` like concat('%', FY, '%');