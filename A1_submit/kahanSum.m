function sum = kahanSum(input)
    sum = 0;
    c = 0;
    for i = 1:1:size(input, 2)
        y = input(i) - c;
        t = sum + y;
        c = (t - sum) - y;
        sum = t;
    end
end