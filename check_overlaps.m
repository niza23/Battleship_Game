function check = check_overlaps(board,orientation,length_of_ship,row,col)

%check_overlaps(board,orientation,length_of_ship,row,col) helps us to check
%if the position of the ship overlaps with another ship which is already
%placed.
%
%The arguments for this functions are:
%board:- the board on which the ships are being placed.
%orientation:- orientation of the board, horizontal or vertical
%length_of_ship:- length of the ship to be place
%row:- row number of the position
%col:- column number of the position
%
%It will return 0 if the position of the ship is overlaps with another.

    if orientation == 1
        for i=col:col+length_of_ship-1
            if board(row,i)~=0
                check = 0;
                break
            else
                check = 1;
            end
        end
    else
        for i=row:row+length_of_ship-1
            if board(i,col)~=0
                check = 0;
                break
            else
                check = 1;
            end
        end
    end
end