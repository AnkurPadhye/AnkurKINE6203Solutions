%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Creator: Ankur Padhye
%Date: Sept 12, 2021
%Description: This program will allow you to play a game of TicTacToe with
%the computer. The computer will ask you to make the first move. This gives
%you chance to have the 'X's and the computer gets the 'O's. The one who
%gets 3'X's or 3'O's wins. If there is no way of getting 3'X's or 3'O's,
%and there are no open spaces on the board, it's a tie.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%A welcome prompt with a brief description of how to answer the question. 
disp(' ')
disp('Hello. Let''s play a game of Tic Tac Toe. The computer will ask you if you want to play. You may answer this with a simple ''Y'' or ''N''') 
disp(' ')
prompt = 'Would you like to play a game of Tic Tac Toe? ';
Ans = input(prompt,'s');

%Adding 's' after prompt, makes it a string input. No need for quotation
%marks. Also, saving the input outside the conditional reduces
%computational time. 
%A conditional for the answer for 'Do you want to play?' If the input is
%yes, the game will continue. If not, the program wont proceed.

if Ans =='N' | Ans == 'n';
    display 'Maybe another time'
end

%A while loof for the answer 'Y' is used so that after the game is
%complete, we can prompt for another round and the answer to that prompt will re-run this code until the answer is N.

while Ans =='Y' | Ans == 'y';
    disp(' ')
    disp('Our Tic Tac Toe game board is a bit different. We have a matrix with alphabets a to i, for each square.')
    disp('To place your move, you need to pick the alphabet in the box where you want to put your ''X''')
    disp(' ')

   board = [' a ' ' | ' ' b ' ' | ' ' c ';' - ' ' - ' ' - ' ' - ' ' - ';' d ' ' | ' ' e ' ' | ' ' f ';' - ' ' - ' ' - ' ' - ' ' - ';' g ' ' | ' ' h ' ' | ' ' i '];
   disp(board)

%A new variable validHumanMove is created outside the for loop for moves to
%define human move inputs. If this variable was not defined, the human
%could input anything on the keyboard and the game would still advance. 
%Having this variable outside the loop allows us to redefine it after every
%move to eliminate already occupied squares, thus limiting human move
%options with every human, as well as computer move.

   validHumanMove = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i'];

for M = 1:2
%Move 'X'
%move 1
prompt = 'Your turn ';
move = input(prompt,'s');

%The 'ismember' function checks for the input saved in variable move to be
%from the set 'validHumanMove'. If it does not belog to the set, it will
%prompt for a valid move. As we have defined validHumanMove outside the for
%loop, it get updated with every move.
%Also a while loop here allows to run the 'ismember function infinetly
%until the move is found to be from the defined set.

while ~ismember(move,validHumanMove);
    disp(' ')
    disp('If you enter an alphabet other than the ones in the boxes, the computer will ask you')
    disp('to enter a valid move. It will do the same if you try to move to a spot that is already taken.')
    disp(' ')
    move = input('Enter a valid move ', 's');
end

%Having multiple 'elseif' statements makes the code heavy. Using switch
%statement can help in narrating multiple scenarios.
switch move
    case 'a'
        board(1,2) = 'X'
    case 'b'
        board(1,8) = 'X'
    case 'c'
        board(1,14) = 'X'
    case 'd'
        board(3,2) = 'X'
    case 'e'
        board(3,8) = 'X'
    case 'f'
        board(3,14) = 'X'
    case 'g'
        board(5,2) = 'X'
    case 'h'
        board(5,8) = 'X'
    case 'i'
        board(5,14) = 'X'
end

validHumanMove = setdiff(validHumanMove,move);

%ComputerMove 'O'
disp(' ')
disp('It''s computer''s turn to make a move.')
disp(' ')

%move 2
%Current gameboard has spaces and lines as elements as well. The available
%letters (a,b,f,h,i) are at rows 1,3,5 and columns 2,8,14. Defining these
%spots will allow us to randomly choose from them for computer move.

rows = [1 3 5];
cols = [2 8 14];
r = rows(randi(numel(rows)));
c = cols(randi(numel(cols)));
computerMove = board(r,c);

%Move 'O'     
%Using 2 while loops, 1 for 'X' and 1 for 'O' does not work here. Use or
%statement (|) to run the loop if either of 'X' or 'O' conditions.
%Using a while loop will run the random selection for row and column
%infinetly until the spot for random r,c is free to move on the board.

while computerMove == 'X' | computerMove == 'O'
    r = rows(randi(numel(rows)));
    c = cols(randi(numel(cols)));
    computerMove = board(r,c);
end

  switch computerMove
        case 'a'
             board(1,2) = 'O'
        case 'b'
            board(1,8) = 'O'
        case 'c'
            board(1,14) = 'O'
        case 'd'
            board(3,2) = 'O'
        case 'e'
            board(3,8) = 'O'
        case 'f'
            board(3,14) = 'O'
        case 'g'
            board(5,2) = 'O'
        case 'h'
            board(5,8) = 'O'
        case 'i'
            board(5,14) = 'O'
  end
  
  validHumanMove = setdiff(validHumanMove,computerMove);
  
  disp(' ')
  disp('The computer has placed it''s ''O''')
  disp(' ')
end

for M = 1:2
%Check for winner. Condition for player 1 victory
%Move 'X'
prompt = 'Your turn ';
move = input(prompt,'s');
while ~ismember(move,validHumanMove);
    disp(' ')
    disp('If you enter an alphabet other than the ones in the boxes, the computer will ask you')
    disp('to enter a valid move. It will do the same if you try to move to a spot that is already taken.')
    disp(' ')
    move = input('Enter a valid move ', 's');
end

%Having multiple 'elseif' statements makes the code heavy. Using switch
%statement can help in narrating multiple scenarios.
switch move
    case 'a'
        board(1,2) = 'X'
    case 'b'
        board(1,8) = 'X'
    case 'c'
        board(1,14) = 'X'
    case 'd'
        board(3,2) = 'X'
    case 'e'
        board(3,8) = 'X'
    case 'f'
        board(3,14) = 'X'
    case 'g'
        board(5,2) = 'X'
    case 'h'
        board(5,8) = 'X'
    case 'i'
        board(5,14) = 'X'
end

validHumanMove = setdiff(validHumanMove,move);

%Condition for player 1 victory
%convert the board to a logical board so that only the locations of 'X' are
%true, which is '1' and rest all are false, which is '0'. Adding the 'X's
%will now be 3.

XwinBoard = board == 'X';

%check winning condition numbers for both moves. Check for all possible 'X'
%3 conditions for 3 rows, 3 conditions for 3 column, and 2 conditions for 2
%diagnonals.

      %a+b+c
      result(1) = XwinBoard(1,2) + XwinBoard(1,8) + XwinBoard(1,14);
      %d+e+f
      result(2) = XwinBoard(3,2) + XwinBoard(3,8) + XwinBoard(3,14);
      %g+h+i
      result(3) = XwinBoard(5,2) + XwinBoard(5,8) + XwinBoard(5,14);
      %a+d+g
      result(4) = XwinBoard(1,2) + XwinBoard(3,2) + XwinBoard(5,2);
      %b+e+h
      result(5) = XwinBoard(1,8) + XwinBoard(3,8) + XwinBoard(5,8);
      %c+f+i
      result(6) = XwinBoard(1,14) + XwinBoard(3,14) + XwinBoard(5,14);
      %a+e+i
      result(7) = XwinBoard(1,2) + XwinBoard(3,8) + XwinBoard(5,14);
      %c+e+g
      result(8) = XwinBoard(1,14) + XwinBoard(3,8) + XwinBoard(5,2);
      result = [result(1:8)];
      if any(result == 3);
          disp(' ')
          disp('Congratulations!!!. You won')          
          break
      else
         
%Continue moves, check for winner.
disp(' ')
disp('It''s computer''s turn to make a move.')
disp(' ')

%Move 'O'     
%'Find empty move' condition for computerMove. The conditional worked but
%code executed even if not needed. The 'O' move changed position to another
%empty spot even if the first spot was empty!

r = rows(randi(numel(rows)));
c = cols(randi(numel(cols)));
computerMove = board(r,c);

while computerMove == 'X' | computerMove == 'O'
    r = rows(randi(numel(rows)));
    c = cols(randi(numel(cols)));
    computerMove = board(r,c);
end
  switch computerMove
        case 'a'
             board(1,2) = 'O'
        case 'b'
            board(1,8) = 'O'
        case 'c'
            board(1,14) = 'O'
        case 'd'
            board(3,2) = 'O'
        case 'e'
            board(3,8) = 'O'
        case 'f'
            board(3,14) = 'O'
        case 'g'
            board(5,2) = 'O'
        case 'h'
            board(5,8) = 'O'
        case 'i'
            board(5,14) = 'O'
  end
  
 validHumanMove = setdiff(validHumanMove,computerMove);
 
 disp(' ')
 disp('The computer has placed it''s ''O''')
 disp(' ')
 
%Condition for player 2 victory
%check winning condition numbers for both moves. 
%convert the board to a logical board so that only the locations of 'O' are
%true, which is '1' and rest all are false, which is '0'. Adding the 'O's
%will now be 3.


OwinBoard = board == 'O';
  
      %a+b+c
      result(1) = OwinBoard(1,2) + OwinBoard(1,8) + OwinBoard(1,14);
      %d+e+f
      result(2) = OwinBoard(3,2) + OwinBoard(3,8) + OwinBoard(3,14);
      %g+h+i
      result(3) = OwinBoard(5,2) + OwinBoard(5,8) + OwinBoard(5,14);
      %a+d+g
      result(4) = OwinBoard(1,2) + OwinBoard(3,2) + OwinBoard(5,2);
      %b+e+h
      result(5) = OwinBoard(1,8) + OwinBoard(3,8) + OwinBoard(5,8);
      %c+f+i
      result(6) = OwinBoard(1,14) + OwinBoard(3,14) + OwinBoard(5,14);
      %a+e+i
      result(7) = OwinBoard(1,2) + OwinBoard(3,8) + OwinBoard(5,14);
      %c+e+g
      result(8) = OwinBoard(1,14) + OwinBoard(3,8) + OwinBoard(5,2);
      result = [result(1:8)];
      if any(result == 3);
          disp(' ')
          disp('Oooops! Looks like the computer won')
          break
      end
      end
end

%Having a for loop for human move followed by a computer move creates room
%for a 10th computer move which is an infinite loop. To avoid that, the for
%loop was restricted to 8 moves and the 9th move, which is a human move,
%was added with a conditions. If the is no winner until the 9th move, only
%then this move will be executed. Else, it will be skipped and the code
%will end.

if any(result == 3);
    prompt = 'Play another round? ';
    Ans = input(prompt, 's');
else
    
%Check for winner. Condition for player 1 victory
%Move 'X'
prompt = 'Your turn ';
move = input(prompt,'s');

while ~ismember(move,validHumanMove);
    disp(' ')
    disp('If you enter an alphabet other than the ones in the boxes, the computer will ask you')
    disp('to enter a valid move. It will do the same if you try to move to a spot that is already taken.')
    disp(' ')
    move = input('Enter a valid move ', 's');
end

%Having multiple 'elseif' statements makes the code heavy. Using switch
%statement can help in narrating multiple scenarios.
switch move
    case 'a'
        board(1,2) = 'X'
    case 'b'
        board(1,8) = 'X'
    case 'c'
        board(1,14) = 'X'
    case 'd'
        board(3,2) = 'X'
    case 'e'
        board(3,8) = 'X'
    case 'f'
        board(3,14) = 'X'
    case 'g'
        board(5,2) = 'X'
    case 'h'
        board(5,8) = 'X'
    case 'i'
        board(5,14) = 'X'
end

%Condition for player 1 victory
%convert the board to a logical board so that only the locations of 'X' are
%true, which is '1' and rest all are false, which is '0'. Adding the 'X's
%will now be 3.

XwinBoard = board == 'X';

%check winning condition numbers for both moves. Check for all possible 'X'

      %a+b+c
      result(1) = XwinBoard(1,2) + XwinBoard(1,8) + XwinBoard(1,14);
      %d+e+f
      result(2) = XwinBoard(3,2) + XwinBoard(3,8) + XwinBoard(3,14);
      %g+h+i
      result(3) = XwinBoard(5,2) + XwinBoard(5,8) + XwinBoard(5,14);
      %a+d+g
      result(4) = XwinBoard(1,2) + XwinBoard(3,2) + XwinBoard(5,2);
      %b+e+h
      result(5) = XwinBoard(1,8) + XwinBoard(3,8) + XwinBoard(5,8);
      %c+f+i
      result(6) = XwinBoard(1,14) + XwinBoard(3,14) + XwinBoard(5,14);
      %a+e+i
      result(7) = XwinBoard(1,2) + XwinBoard(3,8) + XwinBoard(5,14);
      %c+e+g
      result(8) = XwinBoard(1,14) + XwinBoard(3,8) + XwinBoard(5,2);
      result = [result(1:8)];
      if any(result == 3);
          disp(' ')
          disp('Congratulations!!!. You won')
          prompt = 'Play another round? ';
          Ans = input(prompt, 's');
      else
          disp(' ')
          disp('It''s a tie')
          prompt = 'Play another round? ';
          Ans = input(prompt, 's');
      end
end
end