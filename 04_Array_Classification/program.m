% Program 4: Array Classification and Summary
% Classifies a numeric array into positive/negative/zero and even/odd
% (for integer values), then reports sums and the dominant category.

clear; clc;

arr = [4, -7, 0, 15, -3, 8, 0, -12, 7, 10];

posCount = 0; negCount = 0; zeroCount = 0;
evenCount = 0; oddCount = 0;
posSum = 0; negSum = 0;

for i = 1:length(arr)
    v = arr(i);

    if v > 0
        posCount = posCount + 1;
        posSum = posSum + v;
    elseif v < 0
        negCount = negCount + 1;
        negSum = negSum + v;
    else
        zeroCount = zeroCount + 1;
    end

    if v == floor(v)              % only classify integer values as even/odd
        if mod(v, 2) == 0
            evenCount = evenCount + 1;
        else
            oddCount = oddCount + 1;
        end
    end
end

% ---- Determine category with highest count (positive/negative/zero) ----
categories = {'Positive', 'Negative', 'Zero'};
counts = [posCount, negCount, zeroCount];
maxIdx = 1;
for i = 2:length(counts)
    if counts(i) > counts(maxIdx)
        maxIdx = i;
    end
end

lines = {};
lines{end+1} = 'ARRAY CLASSIFICATION AND SUMMARY';
lines{end+1} = '================================';
lines{end+1} = sprintf('Input array          : %s', mat2str(arr));
lines{end+1} = sprintf('Positive count       : %d', posCount);
lines{end+1} = sprintf('Negative count       : %d', negCount);
lines{end+1} = sprintf('Zero count           : %d', zeroCount);
lines{end+1} = sprintf('Even value count     : %d', evenCount);
lines{end+1} = sprintf('Odd value count      : %d', oddCount);
lines{end+1} = sprintf('Sum of positives     : %g', posSum);
lines{end+1} = sprintf('Sum of negatives     : %g', negSum);
lines{end+1} = sprintf('Dominant category    : %s (%d values)', categories{maxIdx}, counts(maxIdx));

for i = 1:length(lines)
    disp(lines{i});
end

fid = fopen('output.txt', 'w');
if fid == -1
    error('Could not open output.txt for writing.');
end
for i = 1:length(lines)
    fprintf(fid, '%s\n', lines{i});
end
fclose(fid);
