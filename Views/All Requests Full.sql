# View to show All Requests with Full Data.
# Created by Kevin Bimonte, Accountant 2019
CREATE or REPLACE View `All Requests` as
SELECT *
From `Complete Funding Request`

UNION

SELECT `Name of Club`,
       `Hearing Date`,
       fnc_FiscalYear(`Hearing Date`),
       `Agenda Number`,
       `Dot Number`,
       'Reclassification' as Description,
       null               as `Date of Event`,
       `Requested Class`  as `Amount Requested`,
       Decision,
       `Approved Class`   as `Amount Approved`,
       Notes,
       `Minutes Link`,
       null               as Appealed,
       null               as `Appeal Amount`,
       null               as `Appeal Decision`,
       null               as `Approved Appeal`,
       null               as `Appeal Minutes`,
       null               as `Spent Amount`,
       null               as `Report Form Status`,
       null               as `Report Form Approved Amount`,
       null               as `IDT Submitted`,
       null               as `Workday Approved`,
       null               as `Workday Approval Date`
From Reclassifications
         LEFT JOIN ReclassMinutes RM on Reclassifications.ID = RM.Reclass_ID

UNION

SELECT `Name of Club`,
       `Hearing Date`,
       fnc_FiscalYear(`Hearing Date`),
       `Agenda Number`,
       `Dot Number`,
       Concat('Reallocation: ', Description) as Description,
       null                                  as `Date of Event`,
       `Allocation Amount`                   as `Requested`,
       Decision,
       `Amount Approved`                     as `Approved`,
       Notes,
       `Minutes Link`,
       null                                  as Appealed,
       null                                  as `Appeal Amount`,
       null                                  as `Appeal Decision`,
       null                                  as `Approved Appeal`,
       null                                  as `Appeal Minutes`,
       null                                  as `Spent Amount`,
       null                                  as `Report Form Status`,
       null                                  as `Report Form Approved Amount`,
       null                                  as `IDT Submitted`,
       null                                  as `Workday Approved`,
       null                                  as `Workday Approval Date`
From Reallocations
         LEFT JOIN ReallocMinutes R on Reallocations.ID = R.Realloc_ID

ORDER BY `Hearing Date` DESC, `Dot Number` DESC