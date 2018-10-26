# ReligiousPrimes

The Data used for the data analysis after all the cleaning can be downloaded under "JLin_Analysis.dta"

The original survey used in this study can be accessed using the "Survey for Research.pdf"

## DO Files Descriptions

For all the DO files, look under the "Analysis DO Files\" folder.
Be sure to change the file path to replicate the data analysis
* Initial.do - initial copy and paste from .csv to .dta. This renames all the necessary variables for this analysis and creates the working.dta file for the Management DO files
* Management.do - drops all the other variables that are not necessary for the quantitative data analysis. This DO file does contain the same/similar contents as the Initual.do and also generates the clean.dta for use in the Unstring Data DO file.
* UnstringData.do - this file is dedicated to recoding the variables from their descriptive options from the original multiple choice style of the survey to the numeric coding for data analysis as described from the Codebook.txt file. This DO file generates the DataAnalysis.dta, which reflects the final cleaning of the data and its use in the data analysis DO file.
* DataAnalysis.do - DO file that contains data analysis and output code

## Codebook

There are two versions of the codebook in this repository:
* ReligiousPrimesCodebook.txt is the most original code for this dataset based on the original survey - see survey PDF file for the original wording of the questions
* Codebook.txt is the modified version of the data coding that is consistently updated based on any changes in the data coding
