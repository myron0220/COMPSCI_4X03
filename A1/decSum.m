function sum = decSum(input)
    des_input = input;
    des_input = sort(des_input, 'descend');
    sum = 0;
    for i = 1:1:size(input, 2)
        sum = sum + des_input(i);
    end
end