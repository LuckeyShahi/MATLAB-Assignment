% Program 5: Search with First Position and Occurrence Count
% Finds the first position of a value using a loop + break, then counts
% total occurrences. MATLAB indexing starts at 1.

clear; clc;

arr = [8, 3, 5, 3, 9, 3, 2, 7];
target = 3;

firstPos = -1;   % -1 means "not found"
n = length(arr);

for i = 1:n
    if arr(i) == target
        firstPos = i;
        break;
    end
end

occurrences = 0;
for i = 1:n
    if arr(i) == target
        occurrences = occurrences + 1;
    end
end

lines = {};
lines{end+1} = 'MANUAL SEARCH - FIRST POSITION AND OCCURRENCES';
lines{end+1} = '===============================================';
lines{end+1} = sprintf('Array           : %s', mat2str(arr));
lines{end+1} = sprintf('Target value    : %g', target);

if firstPos == -1
    lines{end+1} = 'Result          : Value not found in the array.';
else
    lines{end+1} = sprintf('First position  : %d (1-based index)', firstPos);
    lines{end+1} = sprintf('Total occurrences : %d', occurrences);
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
