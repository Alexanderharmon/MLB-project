*Batting.csv from Lahman Baseball Database
*Rerun lines 12 through 69 AFTER hitting do
import delimited "/Users/alexharmon/Documents/School/Fall 2017/Econometrics 3/baseballdatabank-2017.1/core/Batting.csv", encoding(ISO-8859-1)
bysort yearid teamid: gen uniqteams = _n == 1
by yearid: replace uniqteams = sum(uniqteams)
by yearid: replace uniqteams = uniqteams[_N] 
gen total_hr = hr
collapse (max) hr (mean) uniqteams (sum) total_hr, by (yearid)
rename hr maxhr 
gen mlbg = 0
replace mlbg = 1238 in 1
replace mlbg = 1241 in 2
replace mlbg = 1430 in 3
replace mlbg = 1621 in 4
replace mlbg = 1619 in 5
replace mlbg = 1626 in 6
replace mlbg = 1623 in 7
replace mlbg = 1615 in 8
replace mlbg = 1620 in 9
replace mlbg = 1625 in 10
replace mlbg = 1946 in 11
replace mlbg = 1944 in 12
replace mlbg = 1938 in 13
replace mlbg = 1859 in 14
replace mlbg = 1943 in 15
replace mlbg = 1945 in 16
replace mlbg = 1934 in 17
replace mlbg = 1939 in 18
replace mlbg = 2103 in 19
replace mlbg = 2102 in 20
replace mlbg = 2099 in 21
replace mlbg = 2105 in 22
replace mlbg = 1394 in 23
replace mlbg = 2107 in 24
replace mlbg = 2109 in 25
replace mlbg = 2105 in 26
replace mlbg = 2103 in 27
replace mlbg = 2103 in 28
replace mlbg = 2105 in 29
replace mlbg = 2100 in 30
replace mlbg = 2106 in 31
replace mlbg = 2105 in 32
replace mlbg = 2104 in 33
replace mlbg = 2106 in 34
replace mlbg = 2269 in 35
replace mlbg = 1599 in 36
replace mlbg = 2016 in 37
replace mlbg = 2270 in 38
replace mlbg = 2265 in 39
replace mlbg = 2431 in 40
replace mlbg = 2430 in 41
replace mlbg = 2429 in 42
replace mlbg = 2429 in 43
replace mlbg = 2426 in 44
replace mlbg = 2430 in 45
replace mlbg = 2430 in 46
replace mlbg = 2431 in 47
replace mlbg = 2429 in 48
replace mlbg = 2431 in 49
replace mlbg = 2428 in 50
replace mlbg = 2430 in 51
replace mlbg = 2430 in 52
replace mlbg = 2429 in 53
replace mlbg = 2430 in 54
replace mlbg = 2431 in 55
replace mlbg = 2430 in 56
replace mlbg = 2429 in 57
replace mlbg = 2428 in 58
rename uniqteams teams
rename total_hr mlbhr
drop if yearid < 1959 
*drop if yearid > 2004
reg mlbhr teams mlbg maxhr
capture program drop lfols
program lfols
  version 10.1
  args lnf xb lnsigma
  local y "$ML_y1"
  quietly replace `lnf' = ln(normalden(`y', `xb',exp(`lnsigma')))
end 

 ml model lf lfols (xb: mlbhr = teams mlbg maxhr) (lnsigma:)
 ml maximize
 display exp([lnsigma]_cons)
