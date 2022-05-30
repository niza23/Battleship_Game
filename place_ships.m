function position_of_ships = place_ships(board)

%place_ships(board) helps us to place the ships at the correct locations
%There are two options for the arguments
%'C' is for the computer and 'P' is for the player
%It will throw an error if the position of ships either overlaps or is
%out of the board.
%
%eg. - player_board = place_ships('P');
%      computer_board = place_ships('C');

%% Main Board
    position_of_ships = zeros(10);
    
    %% Board For Computer
    if board=='C'
        i = 1;
        while i<=5
            
            row = randsample(10,1); %Randomly chooses the row number
            col = randsample(10,1); %Randomly chooses the column number
            orientation_choices = [1,0]; %Orientation options, Horizontal or Vertical
            length_of_ship = [2,3,3,4,5]; %length of all the ships available
            ship_number = [5,4,3,2,1]; %Ship number as per the problem statement
            
            orientation = orientation_choices(1,randsample(2,1)); %Randomly chooses the orientation of a ship
            
            if orientation==1 %if orientation is chosed as horizontal
                if check_position(orientation,length_of_ship(1,i),row,col)
                    if check_overlaps(position_of_ships,orientation,length_of_ship(1,i),row,col)
                        for j=col:col+length_of_ship(1,i)-1
                            position_of_ships(row,j) = ship_number(1,i);
                        end
                        i = i+1;
                    end
                    disp(position_of_ships) %It shows the position of the
                    %ships on the computer board
                end
            end
            
            if orientation==0 %if orientation is chosed as vertical
                if check_position(orientation,length_of_ship(1,i),row,col)
                    if check_overlaps(position_of_ships,orientation,length_of_ship(1,i),row,col)
                        for j=row:row+length_of_ship(1,i)-1
                            position_of_ships(j,col) = ship_number(1,i);
                        end
                        i = i+1;
                    disp(position_of_ships) %It shows the position of the
                    %ships on the computer board
                    end
                end
            end
        end
        
%% Board For Player
    elseif board =='P'
        i = 1;
        while i<=5
            
            de = 1;
            su = 1;
            cr = 1;
            ba = 1;
            ca = 1;
            
            row = input('Enter the row: ');
            col = input('Enter the column: ');
            orientation = input('Horizontal(1) or Vertical(0): ');
            ship_number = input('Ships available: Destroyer = 5, Submarine = 4, Cruiser = 3, Battleship = 2, Carrier = 1\nWhich kind of ship do you want to place(5,4,3,2,1): ');
            
            if ship_number==5 && de==1
                length_of_ship = 2;
                de = 0;
            elseif ship_number==4 && su==1
                length_of_ship = 3;
                su=0;
            elseif ship_number==3 && cr==1
                length_of_ship = 3;
                cr=0;
            elseif ship_number==2 && ba==1
                length_of_ship = 4;
                ba=0;
            elseif ship_number==1 && ca==1
                length_of_ship = 5;
                ca =0;
            else
                i = i-1;
                disp('Your choice is invalid')
            end
            
            if orientation==1
                if check_position(orientation,length_of_ship,row,col)
                    if check_overlaps(position_of_ships,orientation,length_of_ship,row,col)
                        for j=col:col+length_of_ship-1
                            position_of_ships(row,j) = ship_number;
                        end
                        i = i+1;
                        disp(position_of_ships)
                    else
                        disp('Overlapping. Enter correct position again.')
                    end
                else
                    disp('Invalid Position. Enter correct position again.')
                end
            end
            
            if orientation==0
                if check_position(orientation,length_of_ship,row,col)
                    if check_overlaps(position_of_ships,orientation,length_of_ship,row,col)
                        for j=row:row+length_of_ship-1
                           position_of_ships(j,col) = ship_number;
                        end
                        i = i+1;
                        disp(position_of_ships)
                    else
                        disp('Overlapping. Enter correct position again.')
                    end
                    
                else
                    disp('Invalid Position. Enter correct position again.')
                end
            end
        end
    end
end