function P8_SrNum(num1,num2)
%
%P8_SrNum will take 2 numbers and return a series of consecutive numbers
%between the two.
%
if num1 > num2;
   disp([num2:num1]');
elseif num2 > num1
   disp([num1:num2]');
else
    disp(num1)
end
end
   

