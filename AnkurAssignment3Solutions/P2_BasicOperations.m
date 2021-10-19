function [Sum,Diff,Product,Max] = P2_BasicOperations(num1,num2)
%
%P2_BasicOperations uses 2 number inputs and returns 4 outputs of their
%sums, difference, product and the higher number of the 2.
%
Sum = num1+num2;
%disp (Sum)
if num1 > num2
    Diff = num1-num2;
    Max = num1;
elseif num2>num1
    Diff = num2-num1;
    Max = num2;
else 
    Diff = 0;
    Max = disp ('Both numbers are equal')
end
Product = (num1)*(num2);
disp (table(Sum,Diff,Product,Max))
end

