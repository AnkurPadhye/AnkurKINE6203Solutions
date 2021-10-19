function [Ans] = P3_sumIdentify(number1,number2)
%
%P3_sumIdentify takes 2 numbers and checks if their sum is even of odd. If the
%sum is even, it will display 'Woo' and it will display 'Hah' if the sum is odd.
%

sum = number1+number2;
R = mod(sum,2);
if R == 0;
   Ans = ('Wooo');
else
   Ans = ('Hah');
end
    
end

