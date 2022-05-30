clc;
clear all;
close all;

player_guess_board = zeros(10);%guess board for player

fprintf('                       PLACE THE SHIPS                    \n');
computer_board = place_ships('C');%Building the computer board
player_board = place_ships('P'); %Building the player board

%% Outcomes
p_outcome = 0;
c_outcome = 0;

%% Scores
p_score =0;
c_score = 0;

%% Initial Playing Chance
p = 0;
c = 1;

%% Main Loop
fprintf('                         LET THE BATTLE BEGINS!!!              \n');
while p||c
    %% Input of Player
    if c
        row = input('Enter the row number: ');
        col = input('Enter the column number: ');
        
        if((row<1 || row>10) || (col<1 || col>10)) %battleMatrix out of proportion
            p_outcome=-97;
        else
           computer_board(row,col) = updating_battleMatrix(computer_board,row,col);
           player_guess_board(row,col) = computer_board(row,col);
           disp(player_guess_board);
           p_outcome = battleshipShotCheck(computer_board,row,col);
        end
        
       %% Score of player
        p_score = p_score+p_outcome;
        fprintf('Player Score: %d\n',p_score);
        c=0;
        p=1;
        
%% Input of Computer
    elseif p
        row = randsample(10,1);
        col = randsample(10,1);
        
        player_board(row,col) = updating_battleMatrix(player_board,row,col);
        disp(player_board);
        
        %% Score of Computer
        c_outcome = battleshipShotCheck(player_board,row,col);
        c_score = c_score+c_outcome;
        fprintf('Computer Score: %d\n',c_score);
        p=0;
        c=1;
        
    end
    
    %% Exit condition
    
    %The maximum score any player can earn is 544.
    
    if p_score==544 || c_score==544
        if p_score==544
            disp('PLAYER WINS!');
        else
            disp('COMPUTER WINS!');
        end
        break
    end
    
end