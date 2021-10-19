function [wordLength,first,last] = P9_charLength(word)
%
%P9_charLength takes a word as input and returns its first alphabet, last
%alphabet, and the length of the word. To use the function properly, enter
%a word using apostrophies ('-' or "-").
%

wordLength = strlength(word);
first = word(1,1);
last = word(1,wordLength);

end

