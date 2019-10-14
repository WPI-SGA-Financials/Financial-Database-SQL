UPDATE `Organizations Contact Info`, `Treasurer Update`, `Techsync Names`
SET `Organizations Contact Info`.`Treasurer Email` = `Treasurer Update`.`Campus Email`
WHERE `Organizations Contact Info`.`Name of Club` =`Techsync Names`.`Name of Club` AND
       `Techsync Names`.`Techsync Name` =`Treasurer Update`.`Organization Name`;