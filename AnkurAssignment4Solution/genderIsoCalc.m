function [maleIsoIndMean,femaleIsoIndMean, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(t)
%
%genderIsoCalc sorts the mean Individual strength of 3 days based on the gender
%of the participant. It also calculates the mean of the 3 day mean of the strength 
%all the male and the female participants. It stores the data in 4 variables 
%maleIsoIndMean, femaleIsoIndMean, maleGroupIsoMean, and
%femaleGroupIsoMean.
%

Sex = cell2mat(t.Gender);
meanStrength = t.meanStrength;
G = findgroups(Sex);
for i = 1:25
    if G(i) == 1
       femaleMean(i) = meanStrength(i);
       maleMean(i) = 0;
    else
       femaleMean(i) = 0;
       maleMean(i) = meanStrength(i);
    end
end

maleIsoIndMean = nonzeros(maleMean);
femaleIsoIndMean = nonzeros(femaleMean);

Y = splitapply(@mean, meanStrength, G);
maleGroupIsoMean = Y(2,1);
femaleGroupIsoMean = Y(1,1);
end
