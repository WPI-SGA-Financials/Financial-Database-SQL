Set @FiscalYear = 'FY 20';
SELECT `Parent Organization`, `Fund Name`, Worktag, `Amount Approved`
From `Mandatory Transfers`
Where `Fiscal Year` = @FiscalYear;