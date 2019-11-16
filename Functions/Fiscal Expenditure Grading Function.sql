Drop FUNCTION if EXISTS FEGrading;

Create Function FEGrading(amtProposed DECIMAL(10, 2),
                          amtAppealApproved DECIMAL(10, 2),
                          amtSpent DECIMAL(10, 2))
    returns VARCHAR(8)
    DETERMINISTIC
BEGIN
    DECLARE Class varchar(15);
    DECLARE ratio DECIMAL(10, 2);
    DECLARE Grade varchar(8);

    Set ratio = amtSpent / (amtProposed + amtAppealApproved);

    Set Class = FiscalClass(amtProposed, amtAppealApproved);

    if Class = 'Class A' then
        If ratio > 0.85 and ratio <= 1.0 Then
            Set Grade = 'A';
        elseif ratio > 0.70 and ratio <= 0.85 Then
            Set Grade = 'B';
        elseif ratio > 0.55 and ratio <= 0.70 Then
            Set Grade = 'C';
        else
            Set Grade = 'NR';
        end if;
    elseif Class = 'Class B' then
        If ratio > 0.90 and ratio <= 1.0 Then
            Set Grade = 'A';
        elseif ratio > 0.75 and ratio <= 0.90 Then
            Set Grade = 'B';
        elseif ratio > 0.60 and ratio <= 0.75 Then
            Set Grade = 'C';
        else
            Set Grade = 'NR';
        end if;
    elseif Class = 'Class C' then
        If ratio > 0.90 and ratio <= 1.0 Then
            Set Grade = 'A';
        elseif ratio > 0.80 and ratio <= 0.90 Then
            Set Grade = 'B';
        elseif ratio > 0.70 and ratio <= 0.80 Then
            Set Grade = 'C';
        else
            Set Grade = 'NR';
        end if;
    elseif Class = 'Class D' then
        If ratio > 0.95 and ratio <= 1.0 Then
            Set Grade = 'A';
        elseif ratio > 0.85 and ratio <= 0.95 Then
            Set Grade = 'B';
        elseif ratio > 0.75 and ratio <= 0.85 Then
            Set Grade = 'C';
        else
            Set Grade = 'NR';
        end if;
    elseif Class = 'Class E' then
        If ratio > 0.95 and ratio <= 1.0 Then
            Set Grade = 'A';
        elseif ratio > 0.85 and ratio <= 0.95 Then
            Set Grade = 'B';
        elseif ratio > 0.80 and ratio <= 0.85 Then
            Set Grade = 'C';
        else
            Set Grade = 'NR';
        end if;
    elseif Class = 'Class F' then
        If ratio > 0.95 and ratio <= 1.0 Then
            Set Grade = 'A';
        elseif ratio > 0.90 and ratio <= 0.95 Then
            Set Grade = 'B';
        elseif ratio > 0.85 and ratio <= 0.90 Then
            Set Grade = 'C';
        else
            Set Grade = 'NR';
        end if;
    else
        Set Grade = 'No Grade';
    end if;

    return Grade;
end;