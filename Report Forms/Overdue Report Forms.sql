SELECT `Funding Requests`.`Name of Club`,
       `Funding Requests`.Description,
       `Funding Requests`.`Date of Event`,
       `Funding Requests`.`Dot Number`,
       `Funding Requests`.`Amount Requested`,
       `Funding Requests`.`Amount Approved`,
       `Organizations Contact Info`.`Treasurer Email`,
       FRReportForms.Status
FROM (Organizations INNER JOIN `Funding Requests` ON Organizations.`Name of Club` = `Funding Requests`.`Name of Club`)
         INNER JOIN `Organizations Contact Info`
                    ON (`Funding Requests`.`Name of Club` = `Organizations Contact Info`.`Name of Club`) AND
                       (Organizations.`Name of Club` = `Organizations Contact Info`.`Name of Club`)
         LEFT JOIN `FRReportForms` on `Funding Requests`.ID = FR_ID
WHERE `Funding Requests`.`Date of Event`
    < CURRENT_DATE - 7
    AND `Funding Requests`.`Fiscal Year` = 'FY 20'
    AND `Funding Requests`.Decision = 'Approved'
ORDER BY `Funding Requests`.`Date of Event` DESC;