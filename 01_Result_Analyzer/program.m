% Program 1: Student Result Analyzer
% Accepts a vector of marks, validates range 0-100, ignores invalid
% entries, and computes total/average/highest/lowest of valid marks
% along with Pass/Fail counts using loop-based classification.

clear; clc;

marks = [45, 78, -5, 92, 33, 105, 60, 0, 88, 40];   % sample input (contains invalid entries)

passMark = 40;                 % pass condition: valid mark >= 40

validMarks = [];                % will hold only valid (0-100) marks

% ---- Validation ----
for i = 1:length(marks)
    if marks(i) >= 0 && marks(i) <= 100
        validMarks(end+1) = marks(i); %#ok<AGROW>
    end
end

n = length(validMarks);

% ---- Totals ----
total = 0;
for i = 1:n
    total = total + validMarks(i);
end

if n > 0
    average = total / n;
else
    average = 0;
end

% ---- Highest / Lowest (manual scan) ----
if n > 0
    highest = validMarks(1);
    lowest  = validMarks(1);
    for i = 2:n
        if validMarks(i) > highest
            highest = validMarks(i);
        end
        if validMarks(i) < lowest
            lowest = validMarks(i);
        end
    end
else
    highest = NaN;
    lowest  = NaN;
end

% ---- Pass/Fail classification using loop ----
passCount = 0;
failCount = 0;
for i = 1:n
    if validMarks(i) >= passMark
        passCount = passCount + 1;
    else
        failCount = failCount + 1;
    end
end

% ---- Build summary text ----
lines = {};
lines{end+1} = 'STUDENT RESULT ANALYZER';
lines{end+1} = '========================';
lines{end+1} = sprintf('Original marks entered : %s', mat2str(marks));
lines{end+1} = sprintf('Valid marks used        : %s', mat2str(validMarks));
lines{end+1} = sprintf('Invalid entries ignored : %d', length(marks) - n);
lines{end+1} = '------------------------';
lines{end+1} = sprintf('Total valid students    : %d', n);
lines{end+1} = sprintf('Total marks             : %g', total);
lines{end+1} = sprintf('Average marks           : %.2f', average);
lines{end+1} = sprintf('Highest mark            : %g', highest);
lines{end+1} = sprintf('Lowest mark             : %g', lowest);
lines{end+1} = sprintf('Pass count (>= %d)      : %d', passMark, passCount);
lines{end+1} = sprintf('Fail count              : %d', failCount);

% ---- Display on console ----
for i = 1:length(lines)
    disp(lines{i});
end

% ---- Write to output.txt using file handling ----
fid = fopen('output.txt', 'w');
if fid == -1
    error('Could not open output.txt for writing.');
end
for i = 1:length(lines)
    fprintf(fid, '%s\n', lines{i});
end
fclose(fid);
