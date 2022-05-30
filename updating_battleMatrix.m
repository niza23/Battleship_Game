function updated_battleMatrix = updating_battleMatrix(battleMatrix,rowShot,colShot)

    %updating_battleMatrix(battleMatrix,rowShot,colShot) is used to update
    %the value of battleMatrix after a shot is fired.
    %
    %It checks if any shot is already fired on a specific position or not.
    %It warns the user if the shot is fired on the same position again.
    
    if battleMatrix(rowShot,colShot)<100
        updated_battleMatrix = battleMatrix(rowShot,colShot)+100;
    else
        updated_battleMatrix = battleMatrix(rowShot,colShot);
        disp('You have already shot here. Wait for your next turn.')
    end
    
end