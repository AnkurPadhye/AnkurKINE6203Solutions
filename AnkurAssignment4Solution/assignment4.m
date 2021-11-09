%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Name: Ankur Padhye
%Date: November 5th 2021
%Description: This program uses custom made functions to give means,
%weight normalized means, group seperations of data based on gender, and 
%even checks for increase in strength during the program. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Getting data from a file. Importfile functions takes filename (with the
%extension) as input and imports the entire table and its data in MatLab to
%be used in further calculations.
tbl = importfile('isok_data_6803.csv');
disp(tbl)

%Assigning variable names. As the entire table is imported, assigning
%variable names as per our convenience is a must as it saves some time and
%makes the variables easier to remember while calling them.
SubID = tbl.SubjectID;
Age = tbl.Age;
Gender = tbl.Gender;
Sex = cell2mat(tbl.Gender);
Weight = tbl.Weight;
Day1 = tbl.Day1;
Day2 = tbl.Day2;
Day3 = tbl.Day3;

%Calculating mean of the 3 days and adding it as a variable. Using dot
%notation, a function of choice (in this case 'mean') could be directly
%applied over specified rows and columns. 
tbl.meanStrength = mean(tbl{:,5:end},2);
disp(tbl)
meanStrength = tbl.meanStrength;

%Sorting mean strength by Gender and calculating group mean of male and
%female groups. GebderIsoCalc function seperates the meanstrength data
%based on the gender of the participant and returns a mean value of the
%individual as well as a group mean value of males and females for
%comparison of strength measures across the gender.
[maleIsoIndMean,femaleIsoIndMean, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(tbl)

%Comparing individual days of strength training to see increase in strength
%over the 3 day span. DayComparer function takes any 2 consecutive days as
%input and returns the Subject ID of the participant if they show increase
%in strength over the 2 days in consideration. If there is no positive
%incriment, it returns a NaN output.

day1toDay2 = dayComparer(SubID, Day1, Day2);

day2toDay3 = dayComparer(SubID, Day2, Day3);

%Weight normalizing data. Weight normalizing is used to calculate pound per
%pound strength of an individual. To get a weight normalized data, the
%strength measurements for each day and every Subject, should be divided by
%their weight.
for i = 1:25
    normDay1(i) = Day1(i)/Weight(i);
    normDay2(i) = Day2(i)/Weight(i);
    normDay3(i) = Day3(i)/Weight(i);
end

normDay1mean = mean(normDay1)
normDay2mean = mean(normDay2)
normDay3mean = mean(normDay3)

%Exporting results. Due to uneven lengths of the elements, a cell with all
%the variables that need to be exported needs to be created. It can then be
%converted to a table. The table variable can be opened and modified with
%each variable as a column and with different lengths of the rows. It needs
%to be saved as a '.mat' file as the original table variable will only have
%1 row. This saved variable can then be called and exported as a '.csv'
%file which will have all the variable names as headers, and different
%number of rows.
R = {SubID,meanStrength,maleIsoIndMean,femaleIsoIndMean,maleGroupIsoMean,femaleGroupIsoMean,day1toDay2',day2toDay3',normDay1mean,normDay2mean,normDay3mean};
Result = cell2table(R,'VariableNames',{'SubID','meanStrength','maleIsoIndMean','femaleIsoIndMean','maleGroupIsoMean','femaleGroupIsoMean','day1toDay2','day2toDay3','normDay1mean','normDay2mean','normDay3mean'});
load('Results.mat')
writetable(Result, 'iso_results.csv')



