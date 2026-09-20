% Program 3: Number Digit Analysis
% Uses a while loop (no string conversion) to compute digit count,
% digit sum, even/odd digit counts, reversed number, and palindrome check.

clear; clc;

num = 15421;              % sample positive integer input
original = num;

digitCount = 0;
digitSum   = 0;
evenCount  = 0;
oddCount   = 0;
reversed   = 0;

temp = num;
while temp > 0
    d = mod(temp, 10);

    digitCount = digitCount + 1;
    digitSum   = digitSum + d;

    if mod(d, 2) == 0
        evenCount = evenCount + 1;
    else
        oddCount = oddCount + 1;
    end

    reversed = reversed * 10 + d;

    temp = floor(temp / 10);
end

isPalindrome = (reversed == original);

lines = {};
lines{end+1} = 'NUMBER DIGIT ANALYSIS';
lines{end+1} = '======================';
lines{end+1} = sprintf('Original number     : %d', original);
lines{end+1} = sprintf('Number of digits     : %d', digitCount);
lines{end+1} = sprintf('Sum of digits        : %d', digitSum);
lines{end+1} = sprintf('Even digit count     : %d', evenCount);
lines{end+1} = sprintf('Odd digit count      : %d', oddCount);
lines{end+1} = sprintf('Reversed number      : %d', reversed);
if isPalindrome
    lines{end+1} = 'Palindrome check     : YES, the number is a palindrome';
else
    lines{end+1} = 'Palindrome check     : NO, the number is not a palindrome';
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
