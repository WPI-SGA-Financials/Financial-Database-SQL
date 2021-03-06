Drop FUNCTION if EXISTS fnc_FindMonths;

Create Function fnc_FindMonths(hearingDate DATE)
    returns int(4)
    DETERMINISTIC
BEGIN
    return (Month(CURDATE()) - Month(hearingDate)) + (Year(CURDATE()) - Year(hearingDate)) * 12;
end;