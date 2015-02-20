%Brent Baker (.1173)
%Feras Deiratany (.1)
%acts like queue and stack 

classdef LinkedList < handle
	properties
    	next
    	prev
    	data
    	tail = 1
	end
    
	methods
    	function obj = LinkedList()
        	obj.next = obj;
        	obj.prev = obj;
        	obj.data = obj;
    	end
   	 
    	function add(obj, n)
        	 s = obj;
        	while(s.tail ~= 1)
            	s = s.next;
        	end
        	s.push(n);
    	end
   	 
    	function push(obj, n)
        	l = LinkedList();
        	l.data = obj.data;
        	l.next = obj.next;
        	l.tail = obj.tail;
        	obj.next = l;
        	obj.data = n;
        	obj.tail = 0;
    	end
   	 
    	function d = pop(obj)
        	d = obj.data;
        	if (obj.next ~= obj)
           	obj.data = obj.next.data;
        	else
           	obj.data = obj;
        	end
        	obj.tail = obj.next.tail;
        	l = obj.next;
        	l = l.next;
        	l.prev = obj;
        	obj.next = l;
    	end
   	 
    	function bool = isEmpty(obj)
        	bool = obj.tail;
end
	end
    
end


