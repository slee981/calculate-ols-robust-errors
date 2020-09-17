% Make a simulation dataset to explore 
% "standard" standard errors and 
% "robust" white standard errors 
% 
% Stephen Lee, 2020

% seed random number generator 
randn('seed', 234)

%----------------------------------------------------------------------------
% STORAGE

saveFname = 'data/test-data.csv';
n = 20;

%----------------------------------------------------------------------------
% MAKE DEPENDENT VARIABLES 

x1 = (1:n)';
x2 = round(randn(n, 1) * 10);
c = ones(n, 1);

%----------------------------------------------------------------------------
% MAKE ERROR TERMS 

% u with homoskedastic errors 
uHomo = randn(n, 1);

% u with heteroskedastic errors 
uHetero = zeros(n, 1);
for i = 1:n

    % each error term has different variance 
    uHetero(i, 1) = randn(1) * i ;
end

%----------------------------------------------------------------------------
% THE TRUTH 
% y = 2 + 4x1 - 3x2

truth =  2 * c + 4 * x1 - 3 * x2;

% truth with errors
yHomo   = truth  + uHomo; 
yHetero = truth  + uHetero;

%----------------------------------------------------------------------------
% SAVE DATA 

headers = 'yHomo,yHetero,x1,x2,uHomo,uHetero';
data = [yHomo, yHetero, x1, x2, uHomo, uHetero];

% write headers
fid = fopen(saveFname,'w'); 
fprintf(fid, '%s\n', headers)
fclose(fid);

% write matrix data
dlmwrite(saveFname, data, '-append');

