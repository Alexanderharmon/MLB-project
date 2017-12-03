import delimited "/Users/alexharmon/Documents/School/Fall 2017/Econometrics 3/baseballdatabank-2017.1/core/Batting.csv", encoding(ISO-8859-1)clear
drop if yearid < 1959
*drop if yearid > 2004
drop if ab < 200
*histogram hr, discrete
keep playerid yearid hr
