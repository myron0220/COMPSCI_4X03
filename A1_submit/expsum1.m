function s = expsum1(x)
    s = 0;
    i = 0;
    while (1)
        term = x ^ i / factorial(i);
        if (s == s + term)
            break;
        end
        s = s + term;
        i = i + 1;
    end
end