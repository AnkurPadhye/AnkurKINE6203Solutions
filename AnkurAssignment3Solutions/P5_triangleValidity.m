function [Ans] = P5_triangleValidity(sides)
%
%P5_triangleValidity takes a vector of 3 elements and tests if the 3 elements
%can form a triangle.
%

if sides(1,1)+ sides(1,2) > sides(1,3) && sides(1,1)+ sides(1,3) > sides(1,2) && sides(1,2) + sides(1,3) > sides(1,1)
    Ans = true
    disp 'These sides can form a triangle'
else
    Ans = false
    disp 'These sides cannot form a triangle'
end
end



