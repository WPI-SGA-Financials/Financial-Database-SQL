DROP PROCEDURE if Exists dashMembership;
Create PROCEDURE dashMembership()
SELECT sum(if(`Inactive?` = false, 1, 0)) as 'Active', sum(if(`Inactive?` = true, 1, 0)) as 'Inactive'
From Organizations;