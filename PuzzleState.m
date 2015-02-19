classdef PuzzleState < handle
	properties
    	parent;
    	state = '123456780';
    	depth = 0;
    	score = 0;
	end
	methods
    	function setParent(obj,p)
        		obj.parent = p;
    	end
   	 
    	function p = getParent(obj)
       		p = obj.parent;
    	end
   	 
    	function setState(obj, s)
        		obj.state = s;
    	end
   	 
    	function s = getState(obj)
        		s = obj.state;
    	end
   	 
    	function setDepth(obj, d)
        		obj.depth = d;
    	end
   	 
    	function d = getDepth(obj)
        		d = obj.depth;
    	end
   	 
    	function setScore(obj, s)
        		obj.score = s;
    	end
   	 
    	function s = getScore(obj)
        		s = obj.score;
    	end
    end
    
    methods (Static = true)

    	%finds the score of the state passed in
    	function score = findScore(state)
        	score = 0;
        	for i = 1:9
            	c= state(i);
            	num = str2num(c);
            	if (num ~= 0)
               	xDif = (num-1)/3 - (i-1)/3;
               	yN = mod(num,3);
               	yI = mod(i,3);
               	if(yN==0)
                		yN=3;
               	end
               	if(yI ==0)
                		yI=3;
               	end
               	yDif = yI-yN;
               	dis = abs( xDif ) + abs( yDif );
               	score = score + dis ;
            	end           	 
        	end
    	end
   	 
    	%finds zero in state passed in
    	function index = zeroIndex(state)
        		index = strfind(state,'0');
    	end
   	 
    	%test to see if it can move in state passed in
    	function bool = canMoveUp(state)
        		zerol = PuzzleState.zeroIndex(state);
        		bool = (zerol>3);
    	end
   	 
    	function bool = canMoveDown(state)
        		zerol = PuzzleState.zeroIndex(state);
        		bool = (zerol<7);
    	end
   	 
    	function bool = canMoveLeft(state)
        		zerol = PuzzleState.zeroIndex(state);
        		bool = (mod(zerol,3) ~= 1);
    	end
   	 
    	function bool = canMoveRight(state)
        		zerol = PuzzleState.zeroIndex(state);
        		bool = (mod(zerol,3) ~= 0);
    	end
   	 
   	 
    	%makes a new states by moving
    	function state = moveUp(s)
        	state = s;
        	zerol = PuzzleState.zeroIndex(state);
        	temp = s(zerol -3);
        	state = strrep(state, temp, '9');
        	state = strrep(state, '0', temp);
        	state = strrep(state, '9', '0');
    	end
   	 
     	function state = moveDown(s)
        	state = s;
        	zerol = PuzzleState.zeroIndex(state);
        	temp = s(zerol +3);
        	state = strrep(state, temp, '9');
        	state = strrep(state, '0', temp);
        	state = strrep(state, '9', '0');
     	end
   	 
    	function state = moveRight(s)
        	state = s;
        	zerol = PuzzleState.zeroIndex(state);
        	temp = s(zerol +1);
        	state = strrep(state, temp, '9');
        	state = strrep(state, '0', temp);
        	state = strrep(state, '9', '0');
    	end
   	 
    	function state = moveLeft(s)
        	state = s;
        	zerol = PuzzleState.zeroIndex(state);
        	temp = s(zerol -1);
        	state = strrep(state, temp, '9');
        	state = strrep(state, '0', temp);
        	state = strrep(state, '9', '0');
    	end  	 
   	 
    	%sees if the state passed in is a new state
    	function bool = newState(knownStates, state)
        	bool = ~(ismember(state,knownStates));
    	end
	end
end


