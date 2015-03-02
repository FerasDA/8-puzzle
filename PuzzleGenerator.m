%Brent Baker (.1773) (%50)
%Feras Deiratany (.1) (%50)
%Generates 100 cofigurations for the puzzle

function puzzles = PuzzleGenerator()
    puzzles = {};
    
    for d = 1:5
        for c = 1:20
            depth = (d+1)*5;
            s = PuzzleState();
            s.setState('123456780');
            for m = 1:depth
                r = floor(rand(1)*4)+1;
                if( r == 1)
                    if(PuzzleState.canMoveDown(s.getState()))
                        newStateStr = PuzzleState.moveDown(s.getState());
                        s.setState(newStateStr);
                    else
                        m = m-1;
                    end
                elseif ( r==2 )
                    if(PuzzleState.canMoveUp(s.getState()))
                        newStateStr = PuzzleState.moveUp(s.getState());
                        s.setState(newStateStr);
                    else
                        m = m-1;
                    end
                elseif ( r==3 )
                    if(PuzzleState.canMoveLeft(s.getState()))
                        newStateStr = PuzzleState.moveLeft(s.getState());
                        s.setState(newStateStr);
                    else
                        m = m-1;
                    end
                else
                    if(PuzzleState.canMoveRight(s.getState()))
                        newStateStr = PuzzleState.moveRight(s.getState());
                        s.setState(newStateStr);
                    else
                        m = m-1;
                    end
                end                                   
            end
            state = s.getState;
            if(ismember(state,puzzles))
                c = c-1
            end
            puzzles = union(puzzles,{state});
        end
    end
end

