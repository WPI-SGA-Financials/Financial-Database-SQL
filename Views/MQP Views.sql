--
-- Final view structure for view `Categories Club Membership`
--
Create or Replace VIEW `Categories Club Membership` AS select `Organization Membership Numbers`.`Fiscal Year` AS `Fiscal Year`,`Club Classifications`.`Category` AS `Category`,`Organization Membership Numbers`.`Active Members` AS `Active Members` from (`Organization Membership Numbers` join `Club Classifications` on((`Organization Membership Numbers`.`Name of Organization` = `Club Classifications`.`Name`))) order by `Organization Membership Numbers`.`Fiscal Year` desc;

--
-- Final view structure for view `Categories Total Budget`
--
Create or Replace VIEW `Categories Total Budget` AS select `Club Total Budget`.`Fiscal Year` AS `Fiscal Year`,`Club Total Budget`.`Category` AS `Category`,sum(`Club Total Budget`.`Total Budget`) AS `Total` from `Club Total Budget` group by `Club Total Budget`.`Fiscal Year`,`Club Total Budget`.`Category` order by `Club Total Budget`.`Fiscal Year`;

--
-- Final view structure for view `Club Total Budget`
--
Create or Replace VIEW `Club Total Budget` AS select `B`.`Fiscal Year` AS `Fiscal Year`,`B`.`Name of Club` AS `Name`,`Club Classifications`.`Category` AS `Category`,`B`.`Amount Approved` AS `Total Budget` from (`Budget By FY` `B` left join `Club Classifications` on((`B`.`Name of Club` = `Club Classifications`.`Name`))) group by `B`.`Name of Club`,`B`.`Fiscal Year` order by `B`.`Name of Club`,`B`.`Fiscal Year` desc;

--
-- Final view structure for view `Mandatory Transfers Total Budget`
--
Create or Replace VIEW `Mandatory Transfers Total Budget` AS select `Mandatory Transfers`.`Fiscal Year` AS `Fiscal Year`,`Mandatory Transfers`.`Parent Organization` AS `Parent Organization`,`Mandatory Transfers`.`Fund Name` AS `Fund Name`,`Mandatory Transfers`.`Amount Approved` AS `Total Budget` from `Mandatory Transfers` order by `Mandatory Transfers`.`Fiscal Year` desc;


--
-- Final view structure for view `Other Budget`
--
Create or Replace VIEW `Other Budget` AS select `Total Budget`.`Fiscal Year` AS `Fiscal Year`,`Total Budget`.`Other` AS `Other Budget`,`Liability`.`Total Liability` AS `Liability`,(`Total Budget`.`Other` - `Liability`.`Total Liability`) AS `Sponsorship/Rollbacks` from (`Total Budget` join `Liability` on((`Total Budget`.`Fiscal Year` = `Liability`.`Fiscal Year`))) order by `Total Budget`.`Fiscal Year` desc;


--
-- Final view structure for view `Selection Options`
--
Create or Replace VIEW `Selection Options` AS select `Club Total Budget`.`Fiscal Year` AS `Fiscal Year`,`Club Total Budget`.`Name` AS `Name`,`Club Total Budget`.`Category` AS `Category`,`Club Total Budget`.`Total Budget` AS `Total Budget`,`Organization Membership Numbers`.`Active Members` AS `Active Members` from (`Club Total Budget` join `Organization Membership Numbers` on(((`Club Total Budget`.`Name` = `Organization Membership Numbers`.`Name of Organization`) and (`Club Total Budget`.`Fiscal Year` = `Organization Membership Numbers`.`Fiscal Year`)))) order by `Club Total Budget`.`Category`;


--
-- Final view structure for view `Total Budget`
--
Create or Replace VIEW `Total Budget` AS select coalesce(`TLF`.`Fiscal Year`,`YCT`.`Fiscal Year`,`YMT`.`Fiscal Year`) AS `Fiscal Year`,`TLF`.`Total` AS `Total`,`YCT`.`Total` AS `Club Budget`,`YMT`.`Total` AS `Mandatory Transfers Budget`,((`TLF`.`Total` - `YCT`.`Total`) - `YMT`.`Total`) AS `Other` from ((`Total Life Fee Budget` `TLF` join `Yearly Club Total Budget` `YCT` on((`TLF`.`Fiscal Year` = `YCT`.`Fiscal Year`))) join `Yearly Mandatory Transfers Total Budget` `YMT` on((`TLF`.`Fiscal Year` = `YMT`.`Fiscal Year`))) order by `TLF`.`Fiscal Year` desc;

--
-- Final view structure for view `Total Life Fee Budget`
--
Create or Replace VIEW `Total Life Fee Budget` AS select `Student Life Fee`.`Fiscal Year` AS `Fiscal Year`,(`Student Life Fee`.`SLF Amount` * `Student Life Fee`.`Fall Student Amount`) AS `Total` from `Student Life Fee` order by `Student Life Fee`.`Fiscal Year` desc;

--
-- Final view structure for view `Yearly Club Total Budget`
--
Create or Replace VIEW `Yearly Club Total Budget` AS select `Club Total Budget`.`Fiscal Year` AS `Fiscal Year`,sum(`Club Total Budget`.`Total Budget`) AS `Total` from `Club Total Budget` group by `Club Total Budget`.`Fiscal Year` order by `Club Total Budget`.`Fiscal Year` desc;

--
-- Final view structure for view `Yearly Mandatory Transfers Total Budget`
--
Create or Replace VIEW `Yearly Mandatory Transfers Total Budget` AS select `Mandatory Transfers Total Budget`.`Fiscal Year` AS `Fiscal Year`,sum(`Mandatory Transfers Total Budget`.`Total Budget`) AS `Total` from `Mandatory Transfers Total Budget` group by `Mandatory Transfers Total Budget`.`Fiscal Year` order by `Mandatory Transfers Total Budget`.`Fiscal Year` desc;
