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
end


