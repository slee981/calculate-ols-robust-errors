/* TEST ROBUST ERRORS */

/* setup */

clear
cd "YOUR_PATH/calculate-ols-robust-errors/"
log using "stata-results"

/* import */

import delimited using "data/test-data.csv"

/* regress the homoskedastic error data */

reg yhomo x
reg yhomo x, r 

/* regress the heteroskedastic error data */

reg yhetero x
reg yhetero x, r

log close
translate stata-results.smcl stata-results.pdf