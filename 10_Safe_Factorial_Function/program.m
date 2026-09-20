% Program 10: Validated Factorial Function
% Calls the user-defined function safeFactorial(n) with at least three
% test cases, including one invalid case.

clear; clc;

testValues = [5, 0, -3, 4.5, 7];

lines = {};
lines{end+1} = 'VALIDATED FACTORIAL FUNCTION';
lines{end+1} = '============================';

for i = 1:length(testValues)
    n = testValues(i);
    r = safeFactorial(n);
    if r == -1
        lines{end+1} = sprintf('safeFactorial(%g) -> Invalid input, rejected.', n); %#ok<AGROW>
    else
        lines{end+1} = sprintf('safeFactorial(%g) -> %g', n, r); %#ok<AGROW>
    end
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
