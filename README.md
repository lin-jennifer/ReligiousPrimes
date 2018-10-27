# May God's Grace Guide Me: Research on the Impact of Subliminal Religious Primes on Political Issue Attitudes and Voting Decisions

The Data used for the data analysis after all the cleaning can be downloaded under "JLin_Analysis.dta". A .csv version of the data (entitled "JLin_Analysis.csv") can also be located in this repository.

The original survey used in this study can be accessed using the "Survey for Research.pdf"

The DO Files that contain the command for each of the analyses are contained in the "Analysis DO Files" folder, and its contents are described in the "DO Files Description" section of this README.

The codebook used to code the variables is available as a text file. The versions of the codebook are described in the "Codebook" section of this README.

The printout of results can be found the the "Results Printout" folder. The contents of each of the text files are described in the section "Results Printout Descriptions" of this README.

Any key graphs generated from the DO files can be found in the "Graphs" Folder of this repository. A description of them can also be found in the "Graphs Descriptions" section of this DO file.

## DO Files Descriptions

For all the DO files, look under the "Analysis DO Files\" folder.
Be sure to change the file path to replicate the data analysis
* Initial.do - initial copy and paste from .csv to .dta. This renames all the necessary variables for this analysis and creates the working.dta file for the Management DO files
* Management.do - drops all the other variables that are not necessary for the quantitative data analysis. This DO file does contain the same/similar contents as the Initual.do and also generates the clean.dta for use in the Unstring Data DO file.
* UnstringData.do - this file is dedicated to recoding the variables from their descriptive options from the original multiple choice style of the survey to the numeric coding for data analysis as described from the Codebook.txt file. This DO file generates the DataAnalysis.dta, which reflects the final cleaning of the data and its use in the data analysis DO file.
* DataAnalysis.do - DO file that contains data analysis code - the commands for all regressions whose data is included in the results folder can be found here.

## Codebook

There are two versions of the codebook in this repository:
* ReligiousPrimesCodebook.txt is the most original code for this dataset based on the original survey - see survey PDF file for the original wording of the questions
* Codebook.txt is the modified version of the data coding that is consistently updated based on any changes in the data coding

## Results Printout Descriptions

The results of the data analysis regressions are located in separate text files based on regression characteristics. The command used to generate the printouts as well as a brief description of the variables used are included.

* Regressions.txt - This contains the printout for the regression between agreement (Agree as DV) and condition as well as argument as IV. Interactive effects between the IVs are also considered in this file.
* RegOther.txt - This contains the regressions from the Regressions.txt file but adds the consideration of controlling for other variables (namely, age and party).
* ReligiousPPL.txt - The Religious people text file contains the regression analysis when considering how individual identification of religiosity influences their agreement with the message. Also considers how the interaction between condition and argument influence such opinions

## Graphs Descriptions

This folder contains the Stata graphs generated from commands in the DO files. They are saved here as PDF files.

* Religious.pdf graph - a bar graph of the distribution of responses to the question of the extent to which participants agree with the statement "I consider myself to be religious person"
