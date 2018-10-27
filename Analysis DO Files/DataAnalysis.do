*May God's Grace Guide Me: Research on the Impact of Subliminal Religious Primes on Political Issue Attitudes and Voting Decisions
*Author: Jennifer Lin
*Data: Gathered via SurveyMonkey - saved under the NCF Psych Account as "JLin_Project"
*Analysis: Stata version 15.1
*Software: Mac OSX 10.13.6
*Data Gathered: May 4, 2018 using particpants from Amazon Mechanizal Turk
*Date Created: October 26, 2018
*Date Revised: October 27, 2018
*This DO File utilizes the cleaned data from the code generated under the Management file and the unstringed data generated under the unstring data DO file.
*This DO File will be dedicated towards the analysis of data.

*read in the cleaned data
*The Analysis data is available in the GIT repository for download and use
*A .csv version of the Analysis data is also available in the GIT Repository which (hopefully) will facilitate rerunning this analysis in SPSS or SAS in the future.
 use "/Users/pebl/Desktop/Working/ReligiousPrimes/JLin_Analysis.dta", clear

*change working directory to a location easily acccessible on local computer
cd "/Users/pebl/Desktop/Working"

*Generate a condition variable - Previously, the condition variables were separately coded.
recode neutprime (0 =1) (. =0), generate (neucond)
recode religprime (1 =2) (. =0), generate (religcond)
generate cond=neucond+religcond

*In this case, the condition variable reflects a different dimension as the prime variables. This was done in order for Stata to add the values such that prime will be under one variable in the analysis. Now that I have the condition variable coded, I recode the condition so that it returns to the previsous code, as established in the codebook.
recode cond (2 =1) (1 =0) (0 =.), generate (condition)

*I am interested in the relationship between a religious/neutural prime and conservative voting (as measured here using reactions to a liberal/conservative abortion message)

*What does the data look like?
sum agree condition argument, detail

*Regression 1: THe influence of religious primes on attitudes, controlling for message condition
regress agree condition argument

*Regression 2: The influence of religious primes on attitudes, interaction between condition and argument
*Here, I treat condition as a dichotomous dummy variable such that the base group is the people receiving the neutral prime.
*Argument is also dichotomous because participants either saw a liberal (0) or conservative (1) prime. 
regress agree condition#argument
regress agree i.condition##i.argument

*A look at the margins of the variables
margins, dydx(condition) at(argument)
marginsplot
margins, dydx(argument) at(condition)
marginsplot

*Regression 3: Holding some other variables constant: Party

*Look at the Party variable
tab partyid

*Regression of agree, condition, argument and party
regress agree i.condition##i.argument party
regress agree condition argument party

*Regression 4: Party and age

*Look at the Age variable
tab age
graph box age

*Regression of agree, condition, argument, party and age
regress agree i.condition##i.argument party age
regress agree condition argument party age

************************************************

*So if there is no significance in condition (might be because of the subtleness in prime), what about religious people? 

*tabulate religious matrix
*otherthings is reverse coded
tab god 
tab prayer
tab security
tab religious
tab routine
tab otherthings
tab interest
tab considerations

*Graph of the religious variable to see how many people consider themselves to be religious
*The religious variable is used as the basis for evaluating the interaction between religiosity and condition on agreement with the statement on abortion
 graph bar (count), over(religious, label (labcolor("black"))) ytitle(Frequencies) title(I Consider Myself to be a Religious Person)

*Regression 1: Influence of religiosity on agreement with abortion
regress agree religious

*Regression 2: Interaction of religiosity on condition on agreement with message
*Religiosity is a continuous variable here
regress agree religious condition
regress agree c.religious##i.condition

margins, dydx(religious) at(condition)

*What about controlling for the argument
regress agree religious condition argument
regress agree religious i.condition##i.argument


