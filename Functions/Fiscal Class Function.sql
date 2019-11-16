Drop FUNCTION if EXISTS FiscalClass;

Create Function FiscalClass(
    amtProposed DECIMAL(10,2),
    amtAppealApproved DECIMAL(10,2)
)
returns VARCHAR(15)
DETERMINISTIC
BEGIN
    DECLARE Class varchar(15);
    DECLARE amtApproved DECIMAL(10,2);
    Set amtApproved = amtProposed + amtAppealApproved;

    if amtApproved > 0 and amtApproved < 1000 then # Between $0 and $1,000
        Set Class = 'Class A';
    elseif amtApproved >= 1000 and amtApproved < 5000 then # Between $1,000 and $5,000
        Set Class = 'Class B';
    elseif amtApproved >= 5000 and amtApproved < 10000 then # Between $5,000 and $10,000
        Set Class = 'Class C';
    elseif amtApproved >= 10000 and amtApproved < 50000 then # Between $10,000 and $50,000
        Set Class = 'Class D';
    elseif amtApproved >= 50000 and amtApproved < 100000 then # Between $50,000 and $100,000
        Set Class = 'Class E';
    elseif amtApproved >= 100000 then # Greater than $100,000
        Set Class = 'Class F';
    else
        Set Class = 'Not Budgeted';
    end if;

    return Class;
end;