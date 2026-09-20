% Program 20: Integrated Student Record Processor (Capstone)
%
% INPUT FORMAT (student_marks.txt):
%   Each line = <StudentName> <Mark>
%   e.g. "Aarav 78"
%   Marks outside 0-100 are treated as invalid and excluded from
%   calculations (their names are still listed with an "Invalid" tag).
%
% Combines arrays, loops, conditionals, a user-defined function
% (resultSummary) and file handling. Handles file-open failure and
% invalid marks safely, then writes a complete report to final_report.txt.

clear; clc;

fid = fopen('student_marks.txt', 'r');
if fid == -1
    error('Could not open student_marks.txt. Cannot proceed.');
end

names = {};
rawMarks = [];
tline = fgetl(fid);
while ischar(tline)
    parts = strsplit(strtrim(tline));
    if length(parts) >= 2
        names{end+1} = parts{1}; %#ok<AGROW>
        rawMarks(end+1) = str2double(parts{2}); %#ok<AGROW>
    end
    tline = fgetl(fid);
end
fclose(fid);

numEntries = length(names);

% ---- Validate marks (0-100) while keeping track per student ----
validMarks = [];
validFlag  = false(1, numEntries);
for i = 1:numEntries
    if rawMarks(i) >= 0 && rawMarks(i) <= 100
        validMarks(end+1) = rawMarks(i); %#ok<AGROW>
        validFlag(i) = true;
    end
end

% ---- Call the user-defined function for the class-wide summary ----
[total, average, highest, lowest, passCount, failCount, overallResult] = resultSummary(validMarks);

% ---- Build the report ----
lines = {};
lines{end+1} = 'INTEGRATED STUDENT RECORD PROCESSOR - FINAL REPORT';
lines{end+1} = '===================================================';
lines{end+1} = sprintf('%-10s %8s %10s', 'Name', 'Mark', 'Status');
lines{end+1} = '---------------------------------------';

for i = 1:numEntries
    if validFlag(i)
        if rawMarks(i) >= 40
            status = 'Pass';
        else
            status = 'Fail';
        end
        lines{end+1} = sprintf('%-10s %8g %10s', names{i}, rawMarks(i), status); %#ok<AGROW>
    else
        lines{end+1} = sprintf('%-10s %8g %10s', names{i}, rawMarks(i), 'Invalid'); %#ok<AGROW>
    end
end

lines{end+1} = '---------------------------------------';
lines{end+1} = sprintf('Total valid students   : %d (of %d entries)', length(validMarks), numEntries);
lines{end+1} = sprintf('Class total marks      : %g', total);
lines{end+1} = sprintf('Class average          : %.2f', average);
lines{end+1} = sprintf('Highest valid mark     : %g', highest);
lines{end+1} = sprintf('Lowest valid mark      : %g', lowest);
lines{end+1} = sprintf('Pass count             : %d', passCount);
lines{end+1} = sprintf('Fail count             : %d', failCount);
lines{end+1} = sprintf('Overall class result   : %s', overallResult);

for i = 1:length(lines)
    disp(lines{i});
end

fid = fopen('final_report.txt', 'w');
if fid == -1
    error('Could not open final_report.txt for writing.');
end
for i = 1:length(lines)
    fprintf(fid, '%s\n', lines{i});
end
fclose(fid);
