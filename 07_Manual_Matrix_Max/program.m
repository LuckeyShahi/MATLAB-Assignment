% Program 7: Manual Matrix Maximum with Position
% Finds the maximum element and its 1-based row/column position using
% nested loops (no max()). Works correctly even if all elements are negative.

clear; clc;

M = [-5, -12, -3;
     -8,  -1, -20;
     -9,  -4,  -2];

[rows, cols] = size(M);

maxVal = M(1, 1);
maxRow = 1;
maxCol = 1;

for r = 1:rows
    for c = 1:cols
        if M(r, c) > maxVal
            maxVal = M(r, c);
            maxRow = r;
            maxCol = c;
        end
    end
end

lines = {};
lines{end+1} = 'MANUAL MATRIX MAXIMUM WITH POSITION';
lines{end+1} = '====================================';
lines{end+1} = 'Input matrix:';
for r = 1:rows
    lines{end+1} = sprintf('  %s', mat2str(M(r, :))); %#ok<AGROW>
end
lines{end+1} = '------------------------------------';
lines{end+1} = sprintf('Maximum value : %g', maxVal);
lines{end+1} = sprintf('Position      : Row %d, Column %d (1-based)', maxRow, maxCol);

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
