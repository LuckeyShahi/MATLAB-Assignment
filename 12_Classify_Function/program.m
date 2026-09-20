% Program 12: Reusable Array Classification Function
% Calls classifyArray(arr) for two different arrays and prints a
% formatted comparison of the returned results.

clear; clc;

arrA = [3, -4, 0, 8, -1, 0, 5];
arrB = [10, 21, -30, -7, 0, 6, 15];

[pA, nA, zA, eA, oA] = classifyArray(arrA);
[pB, nB, zB, eB, oB] = classifyArray(arrB);

lines = {};
lines{end+1} = 'REUSABLE ARRAY CLASSIFICATION FUNCTION';
lines{end+1} = '=======================================';
lines{end+1} = sprintf('Array A: %s', mat2str(arrA));
lines{end+1} = sprintf('Array B: %s', mat2str(arrB));
lines{end+1} = '---------------------------------------';
lines{end+1} = sprintf('%-12s %10s %10s', 'Category', 'Array A', 'Array B');
lines{end+1} = sprintf('%-12s %10d %10d', 'Positive', pA, pB);
lines{end+1} = sprintf('%-12s %10d %10d', 'Negative', nA, nB);
lines{end+1} = sprintf('%-12s %10d %10d', 'Zero', zA, zB);
lines{end+1} = sprintf('%-12s %10d %10d', 'Even', eA, eB);
lines{end+1} = sprintf('%-12s %10d %10d', 'Odd', oA, oB);

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
