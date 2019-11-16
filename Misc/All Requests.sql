Create Or Replace View `All Requests` as
SELECT ID,
       `Name of Club`,
       `Funding Date`                                                       As `Hearing Date`,
       `Dot Number`,
       Description,
       'Funding Request'                                                    AS Type,
       If(LEFT(`Dot Number`, 1) = 'F', 'Financial Board',
          IF(LEFT(`Dot Number`, 1) = 'E', 'Exec',
             IF(LEFT(`Dot Number`, 1) = 'S', 'Senate',
                If(LEFT(`Dot Number`, 2) = 'CE', 'Chair Exec',
                   IF(LEFT(`Dot Number`, 2) = 'C.', 'Cabinet', 'No se'))))) As `Hearing Body`
FROM `Funding Requests`

UNION

SELECT ID,
       `Name of Club`,
       `Hearing Date`,
       `Dot Number`,
       Description,
       'Reallocation'                                                       AS Type,
       If(LEFT(`Dot Number`, 1) = 'F', 'Financial Board',
          IF(LEFT(`Dot Number`, 1) = 'E', 'Exec',
             IF(LEFT(`Dot Number`, 1) = 'S', 'Senate',
                If(LEFT(`Dot Number`, 2) = 'CE', 'Chair Exec',
                   IF(LEFT(`Dot Number`, 2) = 'C.', 'Cabinet', 'No se'))))) As `Hearing Body`
FROM Reallocations

UNION
SELECT ID,
       `Name of Club`,
       `Hearing Date`,
       `Dot Number`,
       Concat(`Original Class`,' to ', `Approved Class`)                         AS Description,
       'Reclassification'                                                   AS Type,
       If(LEFT(`Dot Number`, 1) = 'F', 'Financial Board',
          IF(LEFT(`Dot Number`, 1) = 'E', 'Exec',
             IF(LEFT(`Dot Number`, 1) = 'S', 'Senate',
                If(LEFT(`Dot Number`, 2) = 'CE', 'Chair Exec',
                   IF(LEFT(`Dot Number`, 2) = 'C.', 'Cabinet', 'No se'))))) As `Hearing Body`
FROM Reclassifications
ORDER BY `Dot Number`;

Select *
From `All Requests`
Where `Hearing Date` = '2019-10-02' And `Hearing Body` = 'Financial Board' ;