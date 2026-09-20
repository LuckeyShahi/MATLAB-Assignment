function [average, highest, passCount, failCount] = analyzeMarks(marks)
% analyzeMarks  Validates marks (0-100), then computes average and
% highest valid mark, plus Pass/Fail counts (pass mark = 40).
% Invalid marks do not affect the calculations.
%
%   [average, highest, passCount, failCount] = analyzeMarks(marks)

    passMarkValue = 40;
    validMarks = [];

    for i = 1:length(marks)
        if marks(i) >= 0 && marks(i) <= 100
            validMarks(end+1) = marks(i); %#ok<AGROW>
        end
    end

    n = length(validMarks);
    if n == 0
        average = 0;
        highest = NaN;
        passCount = 0;
        failCount = 0;
        return;
    end

    total = 0;
    highest = validMarks(1);
    for i = 1:n
        total = total + validMarks(i);
        if validMarks(i) > highest
            highest = validMarks(i);
        end
    end
    average = total / n;

    passCount = 0;
    failCount = 0;
    for i = 1:n
        if validMarks(i) >= passMarkValue
            passCount = passCount + 1;
        else
            failCount = failCount + 1;
        end
    end
end
