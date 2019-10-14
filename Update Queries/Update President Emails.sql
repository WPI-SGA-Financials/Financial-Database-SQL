UPDATE `Organizations Contact Info`, `Presidents Update`, `Techsync Names`
SET `Organizations Contact Info`.`President Email` = `Presidents Update`.`Campus Email`
WHERE (((`Organizations Contact Info`.`Name of Club`) =`Techsync Names`.`Name of Club`) AND
       ((`Techsync Names`.`Techsync Name`) =`Presidents Update`.`Organization Name`));
