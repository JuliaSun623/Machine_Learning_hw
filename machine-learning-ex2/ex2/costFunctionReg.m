function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


%compute J(theta)
predictions = sigmoid(X*theta);							%predictions of hypothesis on all m examples
temp = -y.*log(predictions)-(1-y).*log(1-predictions)
J = 1/m*sum(temp) + lambda/(2*m)*(theta'*theta-theta(1)^2);

%compute gradient
temp = (predictions-y)' * X;
grad(1) = 1/m * temp(1);		
i = 2;
for i = 2:size(theta),
	grad(i) = 1/m * temp(i) + lambda/m*theta(i);
end;





% =============================================================

end