% Program 17: Function-based Search + Report File
% Reads an array from numbers.txt, defines a target value, calls
% findValue(arr, target), and saves the search result to output.txt.

clear; clc;

fid = fopen('numbers.txt', 'r');
if fid == -1
    error('Could not open numbers.txt.');
end
arr = fscanf(fid, '%f')';
fclose(fid);

target = 22;   % value to search for

[firstIndex, occurrences] = findValue(arr, target);

lines = {};
lines{end+1} = 'FUNCTION-BASED SEARCH + REPORT';
lines{end+1} = '==============================';
lines{end+1} = sprintf('Array (from numbers.txt) : %s', mat2str(arr));
lines{end+1} = sprintf('Target value             : %g', target);

if firstIndex == -1
    lines{end+1} = 'Result                   : Value not found (first index = -1).';
else
    lines{end+1} = sprintf('First index (1-based)    : %d', firstIndex);
    lines{end+1} = sprintf('Total occurrences        : %d', occurrences);
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
