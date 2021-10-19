function P7_graphIt(vec1,vec2)
%
%P7_graphIt function plots a graph of the 2 vectors. It matches the number of
%elements in the vector inputs before ploting a graph. If you get an error
%message, try to match the number of elements in each vector before running
%the function.
%
if length(vec1)~= length(vec2);
      error('Vector sizes do not match. Please match the array sizes and re-enter the vectors');
else
    plot(vec1,vec2)
    title('vec1 Vs vec2')
    xlabel('vec1')
    ylabel('vec2')
end
end

