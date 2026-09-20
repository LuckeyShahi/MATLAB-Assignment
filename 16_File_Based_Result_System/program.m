% Program 16: File-based Student Result System
%
% INPUT FORMAT (marks.txt):
%   Each line = <StudentName> <Mark1> <Mark2> <Mark3>
%   e.g.  "Aarav 78 65 82"
%   Names must not contain spaces. Three subject marks per student.
%
% Reads marks.txt, computes each student's total/average/Pass-Fail
% status (pass = average >= 40), and writes a formatted report to
% result.txt.

clear; clc;

fid = fopen('marks.txt', 'r');
if fid == -1
    error('Could not open marks.txt.');
end

names = {};
allMarks = [];
lineNum = 0;

tline = fgetl(fid);
while ischar(tline)
    lineNum = lineNum + 1;
    parts = strsplit(strtrim(tline));
    if length(parts) >= 4
        names{end+1} = parts{1}; %#ok<AGROW>
        m1 = str2double(parts{2});
        m2 = str2double(parts{3});
        m3 = str2double(parts{4});
        allMarks(end+1, :) = [m1, m2, m3]; %#ok<AGROW>
    end
    tline = fgetl(fid);
end
fclose(fid);

numStudents = length(names);
passMarkAvg = 40;

lines = {};
lines{end+1} = 'FILE-BASED STUDENT RESULT SYSTEM';
lines{end+1} = '=================================';
lines{end+1} = sprintf('%-10s %8s %8s %10s', 'Name', 'Total', 'Average', 'Status');
lines{end+1} = '-----------------------------------------';

for i = 1:numStudents
    total = 0;
    for j = 1:3
        total = total + allMarks(i, j);
    end
    average = total / 3;

    if average >= passMarkAvg
        status = 'Pass';
    else
        status = 'Fail';
    end

    lines{end+1} = sprintf('%-10s %8g %8.2f %10s', names{i}, total, average, status); %#ok<AGROW>
end

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
