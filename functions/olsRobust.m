function [betas, stdErr, whiteErr] = olsRobust(Y, X)
%OLS is an opinionated version of ols
% with basically no input checking
% 
% Stephen Lee, 2020 

% check input length
if (length(Y) ~= size(X, 1))
    error('Hey dummy, wrong size inputs');
else 
    n = length(Y);
    c = ones(n, 1);    % the constant

    % add intercept to front of X
    Xc = [X c];
end

betas = inv(Xc' * Xc) * (Xc' * Y);

% find residuals 
resid = Y - Xc * betas; 

% "standard" standard error 
k = size(Xc, 2) ;
s = sum( resid .^ 2) / (n - k); 
stdVar = s * inv(Xc' * Xc);
stdErr = diag( stdVar .^ 0.5);

% "white" standard error 
omega = diag( resid .^ 2);
whiteVar = inv(Xc' * Xc) * Xc' * omega * Xc * inv(Xc' * Xc) * (n / (n - k));
whiteErr = diag( whiteVar .^ 0.5);
end