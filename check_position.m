function op = check_position(orientation,length_of_ship,row,col)

%check_position(orientation,length_of_ship,row,col) helps us to check if the
%location is not out of the bounds of the board.
%
%The arguments for this functions are:
%orientation:- orientation of the board, horizontal or vertical
%length_of_ship:- length of the ship to be place
%row:- row number of the position
%col:- column number of the position
%
%It will return 0 if the position of the ship is out of the board.

    if orientation==1
        if col+length_of_ship>11
            op = 0;
        else
            op = 1;
        end
    else
        if row+length_of_ship>11
            op = 0;
        else
            op = 1;
        end
    end
end