% Program 9: Selective Processing with continue
% Uses "continue" to skip non-positive values, then computes count, sum
% and average of ONLY the positive values.

clear; clc;

arr = [5, -3, 0, 8, -12, 0, 15, -1, 9];

count = 0;
total = 0;

for i = 1:length(arr)
    if arr(i) <= 0
        continue;    % skip zeros and negative values
    end
    count = count + 1;
    total = total + arr(i);
end

lines = {};
lines{end+1} = 'SELECTIVE PROCESSING WITH CONTINUE';
lines{end+1} = '===================================';
lines{end+1} = sprintf('Input array          : %s', mat2str(arr));

if count > 0
    average = total / count;
    lines{end+1} = sprintf('Positive value count : %d', count);
    lines{end+1} = sprintf('Sum of positives     : %g', total);
    lines{end+1} = sprintf('Average of positives : %.2f', average);
else
    lines{end+1} = 'No positive values found in the array.';
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
