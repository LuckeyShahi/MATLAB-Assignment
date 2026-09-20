function [total, average, minVal, maxVal] = arraySummary(arr)
% arraySummary  Returns total, average, minimum and maximum of arr.
% Minimum and maximum are found manually (min()/max() are not used).
%
%   [total, average, minVal, maxVal] = arraySummary(arr)

    n = length(arr);
    total = 0;
    for i = 1:n
        total = total + arr(i);
    end
    average = total / n;

    minVal = arr(1);
    maxVal = arr(1);
    for i = 2:n
        if arr(i) < minVal
            minVal = arr(i);
        end
        if arr(i) > maxVal
            maxVal = arr(i);
        end
    end
end
