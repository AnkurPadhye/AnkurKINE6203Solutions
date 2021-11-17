function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Debugging- Ankur Padhye
%
%         DUE: November 18
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction
clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])


% Get level of play (1-3) from user
fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

while level ~= beginner && level ~= moderate && level ~= advanced 
    %CORRECTION 1: Infinite loop. Condition always met. If level == beginner, level ~= beginner is false, 
    %but level ~= moderate is true. While loop executed. Fixed by replacing '||' with '&&'.
fprintf('Sorry, that is not a valid level selection.\n')
level = input('Please re-enter a level of play (1-3): ');
end


% set highest secret number based on level selected
if level == beginner 
    %CORRECTION 2: Upon running the code, line 55 was marked in the error with a message to 
    %fix single '=' with double '=='.                    
    highest = beginnerHighest;
elseif level == moderate
    highest = moderateHighest;
else
    highest = advancedHighest; 
    %CORRECTION 3: Mis-spelled variable name. Error highlighted by MatLab.         
end


% randomly select secret number between 1 and highest for level of play
secretNumber = floor(rand() + 1 * highest);  


% initialize number of guesses and User_guess
numOfTries = 0; 
%CORRECTION 4: Start numOfTries was 1. Made it immpossible to reach the conditional of guessing 
%the number in the first try. Changed it to 0.
userGuess = 0;


% repeatedly get user's guess until the user guesses correctly
while userGuess ~= secretNumber

% get a valid guess (an integer from 1-Highest) from the user
    fprintf('\nEnter a guess (1-%d): ', highest);
    userGuess = input('');
    numOfTries = numOfTries + 1; 
    %CORRECTION 5: Included numOfTries in the loop to run it each time with the number of tries.

while userGuess < 1 || userGuess > highest 
    %CORRECTION 6: Greater than or equals highest made the secretNumber unreachable. Removed 
    %the equals sign.
    fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);
    userGuess = input('');
end % of guess validation loop

if userGuess < secretNumber
    %CORRECTION 7: Included this conditional in the loop to be able to display the hint. 
    fprintf('Sorry, %d is too low.\n', userGuess);
elseif userGuess > secretNumber 
    fprintf('Sorry, %d is too high.\n', userGuess);
elseif numOfTries == 1
    fprintf('\nLucky You!  You got it on your first try!\n\n');
else
    fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
    secretNumber,numOfTries);
%CORRECTION 8: The second %d does not specify any variable value to go in. Added
%numOfTries after secretNumber to correct it.

fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');
end
%CORRECTION 9: Error mesasge by Matlab missing END.
end  % of guessing while loop

%end of game