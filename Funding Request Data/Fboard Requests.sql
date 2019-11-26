SELECT `Name of Club`,
       `Fiscal Year`,
       `Funding Date`,
       `Dot Number`,
       `Funding Requests`.`Description`,
       `Amount Requested`,
       `Funding Requests`.Decision,
       `Amount Approved`,
       if(FA.FR_ID is Null, 'No', 'Yes') as `Appealed`,
       if(FA.FR_ID is Null, 0, FA.`Approved Appeal`) as `Approved Appeal`,
       FRF.`Approved Amount` as `Report Form Approved Amount`
FROM `Funding Requests`
    Left Join FRReportForms FRF on `Funding Requests`.ID = FRF.FR_ID
    Left Join FRAppeals FA on `Funding Requests`.ID = FA.FR_ID
WHERE ((If(Left(`Dot Number`, 1) = 'F', True, False) = True))
ORDER BY `Fiscal Year` DESC, `Funding Date` DESC;