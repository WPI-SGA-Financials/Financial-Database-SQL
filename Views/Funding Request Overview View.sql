CREATE or REPLACE View `Complete Funding Request` As
SELECT `Name of Club`,
       `Funding Date`,
       fnc_FiscalYear(`Funding Date`) as `Fiscal Year`,
       FM.`Agenda Number`,
       `Dot Number`,
       FR.Description,
       `Amount Requested`,
       FR.Decision,
       `Amount Approved`,
       FM.`Minutes Link`,
       if(FA.FR_ID is Null, 'No', 'Yes')             as `Appealed`,
       if(FA.FR_ID is Null, 0, FA.`Appeal Amount`) as `Appeal Amount`,
       if(FA.FR_ID is Null, '', FA.`Decision`) as `Appeal Decision`,
       if(FA.FR_ID is Null, 0, FA.`Approved Appeal`) as `Approved Appeal`,
       if(FA.FR_ID is Null, '', FA.`Minutes Link`) as `Appeals Minutes`,
       FRF.`Spent Amount`,
       FRF.Status                                    as `Report From Status`,
       FRF.`Approved Amount`                         as `Report Form Approved Amount`,
       FWI.`IDT Submitted`,
       FWI.`Workday Approved`,
       FWI.`Workday Approval Date`
From `Funding Requests` FR
         LEFT JOIN FRReportForms FRF on FR.ID = FRF.FR_ID
         LEFT JOIN FRWorkdayIDT FWI on FR.ID = FWI.FR_ID
         LEFT JOIN FRAppeals FA on FR.ID = FA.FR_ID
         LEFT JOIN FRMinutes FM on FR.ID = FM.FR_ID
ORDER BY `Funding Date` DESC, `Dot Number` DESC