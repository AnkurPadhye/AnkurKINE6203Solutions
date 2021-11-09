function [tbl] = importfile(fileName)
%
%importfile takes a file name as input and imports the data in the file
%as a Table. The specified output variable will be a matrix of the same
%number of rows X columns as in the file. Please enter appropriate file
%type and include the extension (.txt or .csv) in the file name. Also, the
%fileName input is a string type of variable. Please use appostrophies ('
%') while entering the file name.
%

check = contains(fileName, '.csv');
if check == 0
   error ('File type not right. Please enter an Excel file or try including the extension (.csv)')
end

tbl = readtable(fileName) %'ReadRowNames', true);
end

