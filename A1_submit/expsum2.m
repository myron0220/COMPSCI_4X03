function s = expsum2(x)
    if (x >= 0)
        s = expsum1(x);
    else
        s = 1 / expsum1(-x);
    end
end