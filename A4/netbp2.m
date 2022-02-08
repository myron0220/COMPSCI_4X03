function cost = netbp2(neurons, data, labels, niter, lr, file)

% Initialize weights and biases 
rng(5000);
W2 = 0.5*randn(neurons(1),2); W3 = 0.5*randn(neurons(2),neurons(1)); W4 = 0.5*randn(2,neurons(2));
b2 = 0.5*randn(neurons(1),1); b3 = 0.5*randn(neurons(2),1); b4 = 0.5*randn(2,1);

cost = zeros(niter,1); % value of cost function at each iteration
[~, n] = size(data);
for counter = 1:niter
    k = randi(n);
    x = data(:, k);
    % Forward pass
    a2 = activate(x,W2,b2);
    a3 = activate(a2,W3,b3);
    a4 = activate(a3,W4,b4);
    % Backward pass
    delta4 = a4.*(1-a4).*(a4-labels(:,k));
    delta3 = a3.*(1-a3).*(W4'*delta4);
    delta2 = a2.*(1-a2).*(W3'*delta3);
    % Gradient step
    W2 = W2 - lr*delta2*x';
    W3 = W3 - lr*delta3*a2';
    W4 = W4 - lr*delta4*a3';
    b2 = b2 - lr*delta2;
    b3 = b3 - lr*delta3;
    b4 = b4 - lr*delta4;
    % Monitor progress
    costval = costfunc(W2,W3,W4,b2,b3,b4) ;  % display cost to screen
    cost(counter) = costval;
    % fprintf("i=%d  %e\n", counter, newcost); 
end

% save file
save(file, 'W2', 'W3', 'W4', 'b2', 'b3', 'b4');

% nested cost function
    function costval = costfunc(W2,W3,W4,b2,b3,b4)
         costvec = zeros(n,1); 
         for i = 1:n
             x = data(:, i);
             a2 = activate(x,W2,b2);
             a3 = activate(a2,W3,b3);
             a4 = activate(a3,W4,b4);
             costvec(i) = norm(labels(:,i) - a4,2);
         end
         costval = norm(costvec,2)^2;
    end % of nested function

end
