% Program 6: Row-wise Matrix Analyzer
% For every row: sum, average, maximum. Also identifies the row with the
% highest row-sum.

clear; clc;

M = [4, 8, 2, 6;
     9, 1, 5, 3;
     7, 7, 7, 7;
     2, 0, 11, 4];

[rows, cols] = size(M);

rowSums = zeros(1, rows);
rowAvgs = zeros(1, rows);
rowMaxs = zeros(1, rows);

for r = 1:rows
    s = 0;
    m = M(r, 1);
    for c = 1:cols
        s = s + M(r, c);
        if M(r, c) > m
            m = M(r, c);
        end
    end
    rowSums(r) = s;
    rowAvgs(r) = s / cols;
    rowMaxs(r) = m;
end

bestRow = 1;
for r = 2:rows
    if rowSums(r) > rowSums(bestRow)
        bestRow = r;
    end
end

lines = {};
lines{end+1} = 'ROW-WISE MATRIX ANALYZER';
lines{end+1} = '========================';
lines{end+1} = 'Input matrix:';
for r = 1:rows
    lines{end+1} = sprintf('  %s', mat2str(M(r, :))); %#ok<AGROW>
end
lines{end+1} = '------------------------';
for r = 1:rows
    lines{end+1} = sprintf('Row %d -> Sum: %g, Average: %.2f, Max: %g', ...
        r, rowSums(r), rowAvgs(r), rowMaxs(r)); %#ok<AGROW>
end
lines{end+1} = '------------------------';
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
