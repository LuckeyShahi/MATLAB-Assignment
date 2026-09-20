function result = safeFactorial(n)
% safeFactorial  Computes factorial of n using a loop, after validating
% that n is a non-negative integer. Returns -1 for invalid input.
%
%   result = safeFactorial(n)

    if n < 0 || n ~= floor(n)
        fprintf('Invalid input (%g): factorial is only defined for non-negative integers.\n', n);
        result = -1;
        return;
    end

    result = 1;
    for i = 2:n
        result = result * i;
    end
end
