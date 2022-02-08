function s = expsum3(x)
    pos_s = 0;
    neg_s = 0;
    i = 0;
    while (1)
        term = x ^ i / factorial(i);
        if (term > 0)
            if (pos_s == pos_s + term)
                break;
            end
            pos_s = pos_s + term;
        else
            if (neg_s == neg_s + term)
                break;
            end
            neg_s = neg_s + term;
        end
        i = i + 1;
    end
    % reason why cancellation cannot be avoid.
    % fprintf("pos_s: %e\n", pos_s);
    % fprintf("neg_s: %e\n", neg_s);
    s = pos_s + neg_s;
end