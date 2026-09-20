% Program 11: Multi-output Array Summary Function
% Calls arraySummary(arr) for two different arrays, including one that
% is entirely negative.

clear; clc;

arr1 = [4, 9, -2, 15, 6];
arr2 = [-8, -3, -19, -1, -25, -6];   % all-negative array

lines = {};
lines{end+1} = 'MULTI-OUTPUT ARRAY SUMMARY FUNCTION';
lines{end+1} = '====================================';

[t1, a1, mn1, mx1] = arraySummary(arr1);
lines{end+1} = sprintf('Array 1: %s', mat2str(arr1));
lines{end+1} = sprintf('  Total = %g, Average = %.2f, Min = %g, Max = %g', t1, a1, mn1, mx1);

[t2, a2, mn2, mx2] = arraySummary(arr2);
lines{end+1} = sprintf('Array 2: %s', mat2str(arr2));
lines{end+1} = sprintf('  Total = %g, Average = %.2f, Min = %g, Max = %g', t2, a2, mn2, mx2);

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
