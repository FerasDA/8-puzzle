%Brent Baker (.1773) (%50)
%Feras Deiratany (.1) (%50)
%A* Search method


function puzzle = AStar(start,goal)
    s = PuzzleState();
    s.setState(start);
    s.setScore(PuzzleState.findScore(start))
    puzzle = s;
    knownStates = {};
    currentStates = LinkedList();
    knownStates = union(knownStates, {s.getState});
    currentStates.push(s);
    goalTest = strcmp(s.getState, goal);
    if(goalTest)
        return
    end
    while(~currentStates.isEmpty)
        
        s = currentStates.data;
        t = currentStates.next;
        while(~t.tail)
            if(t.data.getScore < s.getScore)
                s = t.data;
            end
            t = t.next;
        end
        
        newCurrentStates = LinkedList();
        while(~currentStates.isEmpty)
            t = currentStates.pop();
            equalTest = strcmp(s.getState,t.getState);
            if(~equalTest)
                newCurrentStates.push(t)
            end
        end
        currentStates = newCurrentStates;
            
        
        if(PuzzleState.canMoveUp(s.getState()))
            newState = PuzzleState();
            newStateStr = PuzzleState.moveUp(s.getState());
            newState.setState(newStateStr)
            newState.setParent(s)
            newState.setScore(PuzzleState.findScore(newStateStr))
            goalTest = strcmp(newState.getState, goal);
            if(goalTest)
                puzzle = newState;
                return
            elseif (PuzzleState.newState(knownStates, newStateStr))
                    currentStates.push(newState);
                    knownStates = union(knownStates, {newState.getState});
            end
        end
        
        if(PuzzleState.canMoveDown(s.getState()))
            newState = PuzzleState();
            newStateStr = PuzzleState.moveDown(s.getState());
            newState.setState(newStateStr)
            newState.setParent(s)
            newState.setScore(PuzzleState.findScore(newStateStr))
            goalTest = strcmp(newState.getState, goal);
            if(goalTest)
                puzzle = newState;
                return
            elseif (PuzzleState.newState(knownStates, newStateStr))
                    currentStates.push(newState);
                    knownStates = union(knownStates, {newState.getState});
            end
        end
        
        if(PuzzleState.canMoveLeft(s.getState()))
            newState = PuzzleState();
            newStateStr = PuzzleState.moveLeft(s.getState());
            newState.setState(newStateStr)
            newState.setParent(s)
            newState.setScore(PuzzleState.findScore(newStateStr))
            goalTest = strcmp(newState.getState, goal);
            if(goalTest)
                puzzle = newState;
                return
            elseif (PuzzleState.newState(knownStates, newStateStr))
                    currentStates.push(newState);
                    knownStates = union(knownStates, {newState.getState});
            end
        end
    
        if(PuzzleState.canMoveRight(s.getState()))
            newState = PuzzleState();
            newStateStr = PuzzleState.moveRight(s.getState());
            newState.setState(newStateStr)
            newState.setParent(s)
            newState.setScore(PuzzleState.findScore(newStateStr))
            goalTest = strcmp(newState.getState, goal);
            if(goalTest)
                puzzle = newState;
                return
            elseif (PuzzleState.newState(knownStates, newStateStr))
                    currentStates.push(newState);
                    knownStates = union(knownStates, {newState.getState});
            end
        end

    end
end

