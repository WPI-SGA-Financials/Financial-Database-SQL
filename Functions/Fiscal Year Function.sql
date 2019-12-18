Drop FUNCTION if EXISTS fnc_FiscalYear;

Create Function fnc_FiscalYear(
    hearingDate DATE
)
returns VARCHAR(5)
DETERMINISTIC
BEGIN
    DECLARE FiscalYear varchar(15);

    if Month(hearingDate) < 7 then
        Set FiscalYear = CONCAT('FY ', RIGHT(Year(hearingDate),2));
    else
        Set FiscalYear = Concat('FY ', RIGHT(Year(hearingDate),2) + 1);
    end if;

    return FiscalYear;
end;