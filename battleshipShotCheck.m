function outcome = battleshipShotCheck(battleMatrix,rowShot,colShot)
    
    %battleshipShotCheck(battleMatrix,rowShot,colShot) is used to determine
    %the outcome of the shot fired.
    %
    %It checks if the ship is totally sunk or not. It adds 100 to the
    %outcome if the ship is totally sunk.
    
    outcome = battleMatrix(rowShot,colShot)-100;

    flag = 0;
    for i=1:10
        for j=1:10
            if battleMatrix(i,j)==outcome
                flag = 1;
                break;
            end
        end
    end
    if flag==0
        outcome=outcome+100;
    end
    
    %% Error Conditions
    l = size(battleMatrix);
    if l(1)~=10 && l(2)~=10 %battleMatrix out of proportion
        outcome = -99;
    end

    for i=1:10 %battleMatrix contains one or more undefined values
        for j=1:10
            if ((battleMatrix(i,j)>5 && battleMatrix(i,j)< 100) || battleMatrix(i,j)> 105)
                outcome = -98;
                break;
            end
        end
    end
    
end