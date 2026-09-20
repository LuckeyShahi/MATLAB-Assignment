function [posCount, negCount, zeroCount, evenCount, oddCount] = classifyArray(arr)
% classifyArray  Returns counts of positive, negative, zero, even and odd
% integer elements of arr.
%
%   [posCount, negCount, zeroCount, evenCount, oddCount] = classifyArray(arr)

    posCount = 0; negCount = 0; zeroCount = 0;
    evenCount = 0; oddCount = 0;

    for i = 1:length(arr)
        v = arr(i);
        if v > 0
            posCount = posCount + 1;
        elseif v < 0
            negCount = negCount + 1;
        else
            zeroCount = zeroCount + 1;
        end

        if v == floor(v)
            if mod(v, 2) == 0
                evenCount = evenCount + 1;
            else
                oddCount = oddCount + 1;
            end
        end
    end
end
