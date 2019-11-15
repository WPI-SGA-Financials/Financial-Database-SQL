UPDATE `Organizations Contact Info`, `Treasurers Update`, `Techsync Names`
SET `Organizations Contact Info`.`Treasurer Email` = `Treasurers Update`.`Campus Email`
WHERE `Organizations Contact Info`.`Name of Club` =`Techsync Names`.`Name of Club` AND
       `Techsync Names`.`Techsync Name` =`Treasurers Update`.`Organization Name`;