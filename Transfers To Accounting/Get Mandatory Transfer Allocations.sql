Set @FiscalYear = 'FY 19';
SELECT `Parent Organization`, `Fund Name`, Worktag, `Amount Approved`
From `Mandatory Transfers`
Where `Fiscal Year` = @FiscalYear
Order By `Parent Organization`;