SELECT `Name of Club`,
       `Fiscal Year`,
       `Funding Date`,
       `Dot Number`,
       `Description`,
       `Amount Requested`,
       Decision,
       `Amount Approved`,
       `Report Form Approved Amount`
FROM `Funding Requests`
WHERE ((If(Left(`Dot Number`, 1) = 'F', True, False) = True))
ORDER BY `Fiscal Year` DESC, `Funding Date` DESC;
