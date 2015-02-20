%Brent Baker (.1773)
%Feras Deiratany (.1)
%IDS Search method

function puzzle = IDS(start,goal)
    depth = 0;
    maxDepth = 10;
	s = PuzzleState();
	s.setState(start);
    s.setDepth(depth);
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
    	s = currentStates.pop();
        depth = s.getDepth() + 1;
        if(depth < maxDepth)
            if(PuzzleState.canMoveUp(s.getState()))
                newState = PuzzleState();
                newStateStr = PuzzleState.moveUp(s.getState());
                newState.setState(newStateStr)
                newState.setParent(s)
                newState.setDepth(depth)
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
                newState.setDepth(depth)
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
                newState.setDepth(depth)
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
                newState.setDepth(depth)
                goalTest = strcmp(newState.getState, goal);
                if(goalTest)
                    puzzle = newState;
                    return
                elseif (PuzzleState.newState(knownStates, newStateStr))
                        currentStates.push(newState);
                        knownStates = union(knownStates, {newState.getState});
                end
            end
        elseif(currentStates.isEmpty)
            maxDepth = maxDepth + 1;
            knownStates = {};
            currentStates = LinkedList();
            s = PuzzleState();
            s.setState(start);
            s.setDepth(0);
            currentStates.push(s);
        end
    end
end



