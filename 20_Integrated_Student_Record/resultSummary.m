function [total, average, highest, lowest, passCount, failCount, overallResult] = resultSummary(marks)
% resultSummary  Given a vector of VALID marks (already filtered by the
% caller), computes total, average, highest, lowest, Pass/Fail counts
% (pass mark = 40), and an overall class result string.
%
%   [total, average, highest, lowest, passCount, failCount, overallResult] = resultSummary(marks)

    passMarkValue = 40;
    n = length(marks);

    if n == 0
        total = 0; average = 0; highest = NaN; lowest = NaN;
        passCount = 0; failCount = 0;
        overallResult = 'No valid marks to evaluate';
        return;
    end

    total = 0;
    highest = marks(1);
    lowest  = marks(1);
    for i = 1:n
        total = total + marks(i);
        if marks(i) > highest
            highest = marks(i);
        end
        if marks(i) < lowest
            lowest = marks(i);
        end
    end
    average = total / n;

    passCount = 0;
    failCount = 0;
    for i = 1:n
        if marks(i) >= passMarkValue
            passCount = passCount + 1;
        else
            failCount = failCount + 1;
        end
    end

    if failCount == 0
        overallResult = 'All students passed';
    elseif passCount == 0
        overallResult = 'All students failed';
    else
        overallResult = 'Mixed result (some passed, some failed)';
    end
end
