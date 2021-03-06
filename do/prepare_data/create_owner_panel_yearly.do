/*
Creates a firm-year panel showing if the firm has owners from CZ,SK,RO or RU 
Input:
	country_code.dta
Output:
	owner_panel_yearly.dta
*/

clear
set more off

local in "../$in_ext"
local out "../$in"

use "`in'/country_code.dta", clear
keep if country=="CZ" | country=="RO" | country=="SK" | country=="RU"
keep if year>=1992 & year<=2003
gen owner_=1
reshape wide owner_, i(tax_id year) j(country) string

save "`out'/owner_panel_yearly.dta"
