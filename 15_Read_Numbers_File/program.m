% Program 15: Read and Analyze Numbers from File
% Reads numeric values from input.txt (checking that the file opened
% successfully), classifies them, and writes the analysis to output.txt.

clear; clc;

fid = fopen('input.txt', 'r');
if fid == -1
    error('Could not open input.txt. Make sure the file exists in this folder.');
end

data = fscanf(fid, '%f');
fclose(fid);

n = length(data);

posCount = 0; negCount = 0; zeroCount = 0;
total = 0;
minVal = data(1);
maxVal = data(1);

for i = 1:n
    v = data(i);
    total = total + v;

    if v > 0
        posCount = posCount + 1;
    elseif v < 0
        negCount = negCount + 1;
    else
        zeroCount = zeroCount + 1;
    end

    if v < minVal
        minVal = v;
    end
    if v > maxVal
        maxVal = v;
    end
end

average = total / n;

lines = {};
lines{end+1} = 'READ AND ANALYZE NUMBERS FROM FILE';
lines{end+1} = '===================================';
lines{end+1} = sprintf('Values read from input.txt : %s', mat2str(data'));
lines{end+1} = sprintf('Count of values             : %d', n);
lines{end+1} = sprintf('Positive count              : %d', posCount);
lines{end+1} = sprintf('Negative count              : %d', negCount);
lines{end+1} = sprintf('Zero count                  : %d', zeroCount);
lines{end+1} = sprintf('Sum                         : %g', total);
lines{end+1} = sprintf('Average                     : %.2f', average);
lines{end+1} = sprintf('Minimum                     : %g', minVal);
lines{end+1} = sprintf('Maximum                     : %g', maxVal);

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
