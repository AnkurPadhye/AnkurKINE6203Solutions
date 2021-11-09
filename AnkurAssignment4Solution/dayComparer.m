function [D1toD2] = dayComparer(SubjectID,D1,D2)
%
%dayComparer takes the SubjectID of the participant along with the weights 
%lifted on the individual days of strength training sessions and checks for
%an increase in the strength. It gives out 2 output matrices containing the 
%SubjectIDs of the participants that showed improvement in the strength 
%measurements.
%

for i = 1:25
    if D2(i) > D1(i)
       D1toD2(i) = SubjectID(i);
    else
       D1toD2{i} = 'NaN';
    end
end
end

