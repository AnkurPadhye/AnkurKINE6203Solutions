function [ans] = P6_primeCheck(number)
%
%P6_primeCheck will check if the entered input number is a Prime number. It
%will retrun a logical 'true' if the number is Prime, or a logical 'false' if
%the number is not a Prime number.
%
ans = isprime(number)
if ans == 1
    disp 'True. Number is prime.'
else
    disp 'False. Number is not prime.'
end
end

