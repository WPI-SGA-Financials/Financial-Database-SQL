# Eligible for Reclassification
SELECT SOC.`Name of Club`,
       `Hearing Date`,
       `O C I`.`President Email`,
       FindMonths(`Hearing Date`) as `Months Since SOC`
From SOC
         INNER Join Organizations O on SOC.`Name of Club` = O.`Name of Club`
         INNER JOIN `Organizations Contact Info` `O C I` on O.`Name of Club` = `O C I`.`Name of Club`
WHERE FindMonths(`Hearing Date`) >= 12
  and FindMonths(`Hearing Date`) <= 18
  and Classification = 'Class 6 - Provisional'
ORDER BY `Hearing Date`;

# Not Eligible for Reclassification
SELECT SOC.`Name of Club`,
       `Hearing Date`,
       `O C I`.`President Email`,
       FindMonths(`Hearing Date`) as `Months Since SOC`
From SOC
         INNER Join Organizations O on SOC.`Name of Club` = O.`Name of Club`
         INNER JOIN `Organizations Contact Info` `O C I` on O.`Name of Club` = `O C I`.`Name of Club`
WHERE Not (FindMonths(`Hearing Date`) >= 12 and FindMonths(`Hearing Date`) <= 18)
  and Classification = 'Class 6 - Provisional'
  and `Inactive?` != 1
Order BY `Hearing Date`;