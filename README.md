# Calculate Robust OLS Errors 
Create a simple simulation dataset and recreate the "robust" standard errors from STATA. 

## Quick Use 

```bash 
$ git clone https://github.com/slee981/calculate-ols-robust-errors.git
$ cd calcualte-ols-robust-errors
```

If you don't have Octave installed, [visit their website to download](https://www.gnu.org/software/octave/download.html).

If you have Octave installed: 

```bash
$ octave-cli makeDataset.m
$ octave-cli main.m
```

If you have STATA, open the `main.do` file, edit the directory location and run. 

## Calculations

The relevant part of this exercise is in the file `functions/olsRobust.m`. This is where the standard and robust error calcuations are made. 