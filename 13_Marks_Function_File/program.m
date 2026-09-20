% Program 13: Marks Analysis Function + File Output
% Calls analyzeMarks(marks) and writes the complete analysis to
% result.txt using file handling.

clear; clc;

marks = [55, 102, 38, 76, -10, 90, 40, 61];

[average, highest, passCount, failCount] = analyzeMarks(marks);

lines = {};
lines{end+1} = 'MARKS ANALYSIS REPORT';
lines{end+1} = '======================';
lines{end+1} = sprintf('Marks entered   : %s', mat2str(marks));
lines{end+1} = sprintf('Average (valid) : %.2f', average);
lines{end+1} = sprintf('Highest (valid) : %g', highest);
lines{end+1} = sprintf('Pass count      : %d', passCount);
lines{end+1} = sprintf('Fail count      : %d', failCount);

for i = 1:length(lines)
    disp(lines{i});
end

fid = fopen('result.txt', 'w');
if fid == -1
    error('Could not open result.txt for writing.');
end
for i = 1:length(lines)
    fprintf(fid, '%s\n', lines{i});
end
fclose(fid);
