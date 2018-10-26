*May God's Grace Guide Me: Research on the Impact of Subliminal Religious Primes on Political Issue Attitudes and Voting Decisions
*Author: Jennifer Lin
*Data: Gathered via SurveyMonkey - saved under the NCF Psych Account as "JLin_Project"
*Analysis: Stata version 15.1
*Software: Mac OSX 10.13.6
*Data Gathered: May 4, 2018 using particpants from Amazon Mechanizal Turk
*Date Created: October 26, 2018
*Date Revised: October 26, 2018
*This DO File is the most original DO File used to generate the "working.dta" file. This renames the key variables that will be used in the data analysis.

*The original data from SurveyMonkey cannot be downloaded as a Stata file. Therefore, to import the data to Stata, download the file as a .csv and copy/paste the interested values into the Stata file window using the "edit" command. Save the file as a .dta for use in Stata.

*Read in data and clear whatever was in the Stata window beforehand
use "/Users/pebl/Desktop/JLin_data.dta", clear

*change working directory to a location accessible on current computer
cd "/Users/pebl/Desktop/Working"

*There were many of the variables that were named arbitrarily during the copy-paste process. Rename variables according to how they appear in the codebook (Assessible in the ReligiousPrimes git repository as a  .txt file) 
*Delete [x] "weight variables" in rename command for variable names in order for this to work if copying from data editor
rename Beforemovingonwedliketoaskyouify argument
rename Regardlessofyouropinionsontheiss quality
rename onascaleof1to7with1beingstrongly agree
rename pleaserateyourpreferencesoneachi god
rename var29 prayer
rename var30 security
rename var31 religious
rename var32 routine
rename var33 otherthings
rename var34 interest
rename var35 considerations
rename pleaseindicateyourpartyaffiliati partyid
rename pleaseindicateyourreligiousaffil affiliation
rename howofteninthepastmonthhaveyoupar service
rename pleaseindicateyourgenderidentity gender
rename whatisyourage age
rename whatisyourhighesteducationlevel education
rename whatisyourincomelevel income
rename whatisyourracialidentity race
rename whatisyourethnicidentity ethnicity

*generate Prime Condition variable - generated using the second item under each condition - those who participated all answered the second question. First prime item was universal throughout
*Neutral prime 
rename fallwasworriedshealways neutral
rename neutral neutprime

*Religious prime
rename hisworshipsbentidolhe religprime

*Save a working copy of the data
save "JLin_working.dta", replace

*use working data
use "JLin_working.dta", replace
