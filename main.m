%----------------------------------------------------------------------------
% read data

% skip headers column since Octave doesn't 
% imlement matlab table 
%
% headers = 'yHomo, yHetero, x1, x2, u, uHetero';
data = csvread('data/test-data.csv', 1, 0);

addpath(genpath(pwd));

%----------------------------------------------------------------------------
% setup Y and X variables 

yhomo = data(:, 1);
yhetero = data(:, 2);

X = data(:, [3, 4]); 

uhomo = data(:, 5);
uhetero = data(:, 6);

%----------------------------------------------------------------------------
% run ols on the data to try and match stata

fprintf('%% Results ---------------------------------------------------\n\n');
[betas, stdErr, robustErr] = olsRobust(yhomo, X)

fprintf('%% Results ---------------------------------------------------\n\n');
[betas, stdErr, robustErr] = olsRobust(yhetero, X)



