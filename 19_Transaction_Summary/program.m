% Program 19: Mini Transaction Summary
% Reads transactions.txt (positive = credit, negative = debit,
% zero = no change) and computes total credits/debits, net balance,
% transaction counts, and the largest credit/debit magnitude.

clear; clc;

fid = fopen('transactions.txt', 'r');
if fid == -1
    error('Could not open transactions.txt.');
end
data = fscanf(fid, '%f');
fclose(fid);

n = length(data);

totalCredits = 0;
totalDebits  = 0;
creditCount  = 0;
debitCount   = 0;
largestCredit = 0;
largestDebit  = 0;   % stored as a positive magnitude

for i = 1:n
    v = data(i);
    if v > 0
        totalCredits = totalCredits + v;
        creditCount = creditCount + 1;
        if v > largestCredit
            largestCredit = v;
        end
    elseif v < 0
        totalDebits = totalDebits + v;
        debitCount = debitCount + 1;
        if abs(v) > largestDebit
            largestDebit = abs(v);
        end
    end
    % v == 0 -> no change, not counted as credit or debit
end

netBalance = totalCredits + totalDebits;

lines = {};
lines{end+1} = 'MINI TRANSACTION SUMMARY';
lines{end+1} = '========================';
lines{end+1} = sprintf('Transactions read      : %s', mat2str(data'));
lines{end+1} = sprintf('Total transactions     : %d', n);
lines{end+1} = '------------------------';
lines{end+1} = sprintf('Total credits          : %g', totalCredits);
lines{end+1} = sprintf('Total debits           : %g', totalDebits);
lines{end+1} = sprintf('Net balance            : %g', netBalance);
lines{end+1} = sprintf('Number of credits      : %d', creditCount);
lines{end+1} = sprintf('Number of debits       : %d', debitCount);
lines{end+1} = sprintf('Largest credit amount  : %g', largestCredit);
lines{end+1} = sprintf('Largest debit magnitude: %g', largestDebit);

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
