% Program 18: Matrix File Analyzer
% Reads a numeric matrix from matrix.txt, finds the overall maximum and
% minimum (with 1-based positions) using nested loops, computes each
% row's sum, identifies the row with the highest sum, and saves the
% analysis to output.txt.

clear; clc;

M = load('matrix.txt');   % reads whitespace-separated numeric matrix

[rows, cols] = size(M);

% ---- Overall max/min via nested loops ----
maxVal = M(1, 1); maxRow = 1; maxCol = 1;
minVal = M(1, 1); minRow = 1; minCol = 1;

for r = 1:rows
    for c = 1:cols
        if M(r, c) > maxVal
            maxVal = M(r, c);
            maxRow = r;
            maxCol = c;
        end
        if M(r, c) < minVal
            minVal = M(r, c);
            minRow = r;
            minCol = c;
        end
    end
end

% ---- Row sums ----
rowSums = zeros(1, rows);
for r = 1:rows
    s = 0;
    for c = 1:cols
        s = s + M(r, c);
    end
    rowSums(r) = s;
end

bestRow = 1;
for r = 2:rows
    if rowSums(r) > rowSums(bestRow)
        bestRow = r;
    end
end

lines = {};
lines{end+1} = 'MATRIX FILE ANALYZER';
lines{end+1} = '=====================';
lines{end+1} = sprintf('Matrix read from matrix.txt (%dx%d):', rows, cols);
for r = 1:rows
    lines{end+1} = sprintf('  %s', mat2str(M(r, :))); %#ok<AGROW>
end
lines{end+1} = '---------------------';
lines{end+1} = sprintf('Overall maximum : %g at Row %d, Column %d', maxVal, maxRow, maxCol);
lines{end+1} = sprintf('Overall minimum : %g at Row %d, Column %d', minVal, minRow, minCol);
lines{end+1} = '---------------------';
for r = 1:rows
    lines{end+1} = sprintf('Row %d sum : %g', r, rowSums(r)); %#ok<AGROW>
end
lines{end+1} = sprintf('Row with highest sum : Row %d (Sum = %g)', bestRow, rowSums(bestRow));

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
