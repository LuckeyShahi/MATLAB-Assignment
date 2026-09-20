% Program 2: Second Largest Distinct Value with Report
% Finds the second largest DISTINCT value in an array without using
% sort(). Handles repeated maximum values correctly.

clear; clc;

arr = [12, 45, 45, 33, 45, 20, 33, 5];   % sample input (repeated max/values)

n = length(arr);

% ---- Find the largest value manually ----
largest = arr(1);
for i = 2:n
    if arr(i) > largest
        largest = arr(i);
    end
end

% ---- Find the second largest DISTINCT value ----
% Initialize to a sentinel that will be replaced by any value < largest.
secondLargest = -Inf;
found = false;

for i = 1:n
    if arr(i) ~= largest && arr(i) > secondLargest
        secondLargest = arr(i);
        found = true;
    end
end

lines = {};
lines{end+1} = 'SECOND LARGEST DISTINCT VALUE';
lines{end+1} = '=============================';
lines{end+1} = sprintf('Input array        : %s', mat2str(arr));
lines{end+1} = sprintf('Largest value       : %g', largest);

if found
    lines{end+1} = sprintf('Second largest (distinct) : %g', secondLargest);
else
    lines{end+1} = 'Second largest (distinct) : Not found (all elements are equal)';
end

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
