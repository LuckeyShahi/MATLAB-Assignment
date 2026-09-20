function [firstIndex, occurrences] = findValue(arr, target)
% findValue  Returns the first 1-based index of target in arr and the
% total number of occurrences. firstIndex is -1 if target is absent.
%
%   [firstIndex, occurrences] = findValue(arr, target)

    firstIndex = -1;
    occurrences = 0;

    for i = 1:length(arr)
        if arr(i) == target
            if firstIndex == -1
                firstIndex = i;
            end
            occurrences = occurrences + 1;
        end
    end
end
