function sum = incSum(input)
    inc_input = input;
    inc_input = sort(inc_input, 'ascend');
    sum = 0;
    for i = 1:1:size(input, 2)
        sum = sum + inc_input(i);
    end
end