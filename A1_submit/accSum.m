function sum = accSum(input)
    vpa_input = input;
    vpa_input = vpa(vpa_input);
    sum = 0;
    for i = 1:1:size(input, 2)
        sum = sum + vpa_input(i);
    end
end