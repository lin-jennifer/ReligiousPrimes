*May God's Grace Guide Me: Research on the Impact of Subliminal Religious Primes on Political Issue Attitudes and Voting Decisions
*Author: Jennifer Lin
*Data: Gathered via SurveyMonkey - saved under the NCF Psych Account as "JLin_Project"
*Analysis: Stata version 15.1
*Software: Mac OSX 10.13.6
*Data Gathered: May 4, 2018 using particpants from Amazon Mechanizal Turk
*Date Created: October 26, 2018
*Date Revised: October 26, 2018
*This DO File utilizes the cleaned data from the code generated under the Management file. This file is used to generate unstringed, numeric data for data analysis.

*read in the cleaned data
use "/Users/pebl/Desktop/Working/JLin_clean.dta", clear

*change working directory to a location easily acccessible on local computer
cd "/Users/pebl/Desktop/Working"

*recode answers to numbers as assigned by codebook

*Convert primes from words to numbers such that the answers from the questions show us the condition the participant was a part of
*Replace command multiplied to accommodate for the variations in data input. Used "edit" command to see the variation in data
*Neutral Prime
replace neutprime="." if missing(neutprime)
replace neutprime="0" if neutprime=="She was always worried"
replace neutprime="0" if neutprime=="She was always worried."
replace neutprime="0" if neutprime=="She was always worried. "
replace neutprime="0" if neutprime=="she was always worried"
replace neutprime="0" if neutprime=="she was always worried "
replace neutprime="0" if neutprime=="she always was worried"
replace neutprime="0" if neutprime=="She always was worried"
replace neutprime="0" if neutprime=="She always was worried."
replace neutprime="0" if neutprime=="yes"
replace neutprime="0" if neutprime=="doctor"
replace neutprime="0" if neutprime=="fall she was always worried"
replace neutprime="0" if neutprime=="she alwasy"
replace neutprime="0" if neutprime==" she was always worried"
replace neutprime="0" if neutprime=="she fall, was always worried"
replace neutprime="0" if neutprime=="she always fall worried"
replace neutprime="0" if neutprime=="SAD"
replace neutprime="0" if neutprime=="she always worried"
replace neutprime="0" if neutprime=="she was worried always fall"
replace neutprime="0" if neutprime=="she always was worried."
replace neutprime="0" if neutprime=="She was always worried "
replace neutprime="0" if neutprime=="She worried fall was always"
replace neutprime="0" if neutprime=="she was always worried."
replace neutprime="0" if neutprime=="she was worried allways"
replace neutprime="0" if neutprime=="she was worried always"
replace neutprime="0" if neutprime=="She always felt worried"
replace neutprime="0" if neutprime=="worried she always fall"

*Religious Prime recoded under same assumptions/methods as the neutral prime recode
replace religprime="." if missing(religprime)
replace religprime="1" if religprime=="he worships his idol"
replace religprime="1" if religprime=="He worships his idol"
replace religprime="1" if religprime=="Yeah"
replace religprime="1" if religprime=="He worships his idol."
replace religprime="1" if religprime=="he worships his bent idol"
replace religprime="1" if religprime=="He bent his idol."
replace religprime="1" if religprime=="He worships his bent idol."
replace religprime="1" if religprime=="he bend his idol"
replace religprime="1" if religprime=="He worships his idol "
replace religprime="1" if religprime=="his idol he worships"
replace religprime="1" if religprime=="He worships bent idol"
replace religprime="1" if religprime=="HE WORSHIPS HIS IDOL"
replace religprime="1" if religprime=="his idol worships bent"
replace religprime="1" if religprime=="He worships his bent idol"
replace religprime="1" if religprime=="he worships his idol "
replace religprime="1" if religprime=="he bent the idol"
replace religprime="1" if religprime=="He worships his idol. "
replace religprime="1" if religprime=="He bent his idol"
replace religprime="1" if religprime=="he worships bent idol"
replace religprime="1" if religprime=="he worships his idol bent"

replace religprime="1" if religprime=="he bent his idol worships"
replace religprime="1" if religprime=="He worships his idols"
replace religprime="1" if religprime=="worships his bent idol"
replace religprime="1" if religprime=="his worships bent idol he"
replace religprime="1" if religprime=="god"
replace religprime="1" if religprime=="GOOD"
replace religprime="1" if religprime=="yes"
replace religprime="1" if religprime=="he worship his idol"
replace religprime="1" if religprime=="he bent his idol"
replace religprime="1" if religprime=="he workships his idol"
replace religprime="1" if religprime=="he bent his idol worships"

*argument condition
replace argument="0" if argument=="Abortion should be legal"
replace argument="1" if argument=="Abortion should be illegal"

***********
*Questions*
***********

*god
replace god="." if missing(god)
replace god="1" if god=="Strongly Disagree"
replace god="4" if god=="Neutral"
replace god="7" if god=="Strongly Agree"

*prayer
replace prayer="." if missing(prayer)
replace prayer="1" if prayer=="Strongly Disagree"
replace prayer="4" if prayer=="Neutral"
replace prayer="7" if prayer=="Strongly Agree"

*security
replace security="." if missing(security)
replace security="1" if security=="Strongly Disagree"
replace security="4" if security=="Neutral"
replace security="7" if security=="Strongly Agree"

*religious
replace religious="." if missing(religious)
replace religious="1" if religious=="Strongly Disagree"
replace religious="4" if religious=="Neutral"
replace religious="7" if religious=="Strongly Agree"

*routine
replace routine="." if missing(routine)
replace routine="1" if routine=="Strongly Disagree"
replace routine="4" if routine=="Neutral"
replace routine="7" if routine=="Strongly Agree"

*otherthings
replace otherthings="." if missing(otherthings)
replace otherthings="1" if otherthings=="Strongly Disagree"
replace otherthings="4" if otherthings=="Neutral"
replace otherthings="7" if otherthings=="Strongly Agree"

*interest
replace interest="." if missing(interest)
replace interest="1" if interest=="Strongly Disagree"
replace interest="4" if interest=="Neutral"
replace interest="7" if interest=="Strongly Agree"

*considerations
replace considerations="." if missing(considerations)
replace considerations="1" if considerations=="Strongly Disagree"
replace considerations="4" if considerations=="Neutral"
replace considerations="7" if considerations=="Strongly Agree"

******************************
****DEMOGRAPHIC VARIABLES*****
******************************

*partyid
replace partyid="." if missing(partyid)
replace partyid="." if partyid=="Other: _____________________"
replace partyid="0" if partyid=="Republican"
replace partyid="1" if partyid=="Democrat"
replace partyid="2" if partyid=="Independent"

*service
replace service="." if missing(service)
replace service="0" if service=="Not at all"
replace service="1" if service=="Sometimes"
replace service="2" if service=="Once a month"
replace service="3" if service=="Once a week"
replace service="4" if service=="Almost every day"

*gender
replace gender="." if missing(gender)
replace gender="0" if gender=="Male"
replace gender="1" if gender=="Female"

*education
replace education="." if missing(education)
replace education="0" if education=="Less than High School"
replace education="1" if education=="High School"
replace education="2" if education=="Some College"
replace education="3" if education=="Bachelor’s degree"
replace education="4" if education=="Master’s degree"
replace education="5" if education=="Professional or Doctoral Degree"

*Income
replace income="." if missing(income)
replace income="." if income=="Don't Know"
replace income="0" if income=="Less than $29,999"
replace income="1" if income=="$30,000 - $39,999"
replace income="2" if income=="$40,000 - $49,999"
replace income="3" if income=="$50,000 - $59,999"
replace income="4" if income=="$60,000 - $69,999"
replace income="5" if income=="$70,000 - $79,999"
replace income="6" if income=="$80,000 - $89,999"
replace income="7" if income=="$90,000 - $99,999"
replace income="8" if income=="$100,000 - $149,999"
replace income="9" if income=="$150,000 or more"

*race
replace race="." if missing(race)
replace race="0" if race=="White"
replace race="1" if race=="Black or African American"
replace race="2" if race=="Asian or Pacific Islander"
replace race="3" if race=="American Indian or Alaskan Native"

*ethnicity
replace ethnicity="." if missing(ethnicity)
replace ethnicity="0" if ethnicity=="Not Hispanic/Latino"
replace ethnicity="1" if ethnicity=="Hispanic/Latino"

*Stata read a lot of the variables as string variables - unstring the variables
destring neutprime, replace
destring religprime, replace
destring argument, replace
destring god, replace
destring prayer, replace
destring security, replace
destring religious, replace
destring routine, replace
destring otherthings, replace
destring interest, replace
destring considerations, replace
destring partyid, replace
destring service, replace
destring gender, replace
destring education, replace
destring income, replace
destring race, replace
destring ethnicity, replace


*Drop Affiliation for data analysis
drop affiliation

*Save a copy for daya analysis
save "JLin_Analysis.dta", replace

