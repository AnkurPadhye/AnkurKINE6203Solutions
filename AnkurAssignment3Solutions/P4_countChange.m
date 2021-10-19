function [dollarAmount] = P4_countChange(pennies,nickles,dimes,quarters)
%
%P4_changeCount will take pennies, nickles, dimes, and quarters and returns
%the total dollar amount.
%
Pennies = abs(pennies);
Nickles = abs(nickles);
Dimes = abs(dimes);
Quarters = abs(quarters);
a = 5*Nickles;
b = 10*Dimes;
c = 25*Quarters;
d = a+b+c+Pennies;
dollarAmount = d/100;
ans = table(Pennies,Nickles,Dimes,Quarters, dollarAmount)

end

