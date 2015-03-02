%Brent Baker (.1773) (%50)
%Feras Deiratany (.1) (%50)
%BFS Search method

function puzzle = BFS(start, goal)
    s = PuzzleState();
    s.setState(start);
    puzzle = s;
    knownStates = {};
    currentStates = LinkedList();
    knownStates = union(knownStates, {s.getState});
    currentStates.add(s);
    goalTest = strcmp(s.getState, goal);
    if(goalTest)
        return
    end
    while(~currentStates.isEmpty)
        s = currentStates.pop();
                
    	if(PuzzleState.canMoveUp(s.getState()))
        	newState = PuzzleState();
        	newStateStr = PuzzleState.moveUp(s.getState());
        	newState.setState(newStateStr)
        	newState.setParent(s)
        	goalTest = strcmp(newState.getState, goal);
        	if(goalTest)
            	puzzle = newState;
            	return
        	elseif (PuzzleState.newState(knownStates, newStateStr))
                	currentStates.add(newState);
                	knownStates = union(knownStates, {newState.getState});
        	end
    	end
   	 
    	if(PuzzleState.canMoveDown(s.getState()))
        	newState = PuzzleState();
        	newStateStr = PuzzleState.moveDown(s.getState());
        	newState.setState(newStateStr)
        	newState.setParent(s)
        	goalTest = strcmp(newState.getState, goal);
        	if(goalTest)
            	puzzle = newState;
            	return
        	elseif (PuzzleState.newState(knownStates, newStateStr))
                	currentStates.add(newState);
                	knownStates = union(knownStates, {newState.getState});
        	end
    	end
   	 
    	if(PuzzleState.canMoveLeft(s.getState()))
        	newState = PuzzleState();
        	newStateStr = PuzzleState.moveLeft(s.getState());
        	newState.setState(newStateStr)
        	newState.setParent(s)
        	goalTest = strcmp(newState.getState, goal);
        	if(goalTest)
            	puzzle = newState;
            	return
        	elseif (PuzzleState.newState(knownStates, newStateStr))
                	currentStates.add(newState);
                	knownStates = union(knownStates, {newState.getState});
        	end
    	end
    
    	if(PuzzleState.canMoveRight(s.getState()))
        	newState = PuzzleState();
        	newStateStr = PuzzleState.moveRight(s.getState());
        	newState.setState(newStateStr)
        	newState.setParent(s)
        	goalTest = strcmp(newState.getState, goal);
        	if(goalTest)
            	puzzle = newState;
            	return
        	elseif (PuzzleState.newState(knownStates, newStateStr))
                	currentStates.add(newState);
                	knownStates = union(knownStates, {newState.getState});
        	end
        end
    end
    
end



