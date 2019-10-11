UPDATE Organizations, TempTable
SET Organizations.`Acronym 1` = TempTable.`Acronym 1`
WHERE Organizations.`Name of Club` = TempTable.`Name of Club`;