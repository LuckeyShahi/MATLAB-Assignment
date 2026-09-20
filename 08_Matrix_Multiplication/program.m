% Program 8: Validated Manual Matrix Multiplication
% Checks whether A*B is dimensionally valid; if so, computes the product
% manually with nested loops and compares it with MATLAB's built-in A*B.

clear; clc;

A = [1, 2, 3;
     4, 5, 6];        % 2x3

B = [7, 8;
     9, 10;
     11, 12];          % 3x2

[rA, cA] = size(A);
[rB, cB] = size(B);

lines = {};
lines{end+1} = 'VALIDATED MANUAL MATRIX MULTIPLICATION';
lines{end+1} = '=======================================';
lines{end+1} = sprintf('Matrix A is %dx%d, Matrix B is %dx%d', rA, cA, rB, cB);

if cA ~= rB
    lines{end+1} = 'Result: Multiplication A*B is NOT possible.';
    lines{end+1} = sprintf('Reason: Number of columns of A (%d) does not match number of rows of B (%d).', cA, rB);
else
    % ---- Manual multiplication using nested loops ----
    manualResult = zeros(rA, cB);
    for i = 1:rA
        for j = 1:cB
            s = 0;
            for k = 1:cA
                s = s + A(i, k) * B(k, j);
            end
            manualResult(i, j) = s;
        end
    end

    builtinResult = A * B;

    matches = isequal(manualResult, builtinResult);

    lines{end+1} = 'Result: Multiplication A*B is possible.';
    lines{end+1} = 'Manual result (nested loops):';
    for r = 1:rA
        lines{end+1} = sprintf('  %s', mat2str(manualResult(r, :))); %#ok<AGROW>
    end
    lines{end+1} = 'Built-in result (A*B):';
    for r = 1:rA
        lines{end+1} = sprintf('  %s', mat2str(builtinResult(r, :))); %#ok<AGROW>
    end
    if matches
        lines{end+1} = 'Comparison: Manual result MATCHES built-in A*B result.';
    else
        lines{end+1} = 'Comparison: Manual result DOES NOT match built-in A*B result.';
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
