%%	For this program, I have assumed that inputs is a cell array, 
%%	containing lots of data that isn't necessarily needed for this algorithm
clear
clc

inputs = struct('value', [1:10], 'parameterValues', [1,2,2,1], 'Grocery_list', {'milk', 'bread', 'oranges', 'eggs'});

Parameters = [1,5,3,4];

for i = numel(inputs)
	% Extract the values
	ciInput = inputs.value;
	ciLimits = inputs.parameterValues; % needs to be four of them
	newHiValue = 1; result = 5;	%initializes variables
	% Go through each limit
	
	for l = 4:-1:1 % 3:-1:0 in Java
		% Reset the previous valid limit value
		prevLimit = -1;
		% Make sure the limit is valid and active
		if ciLimits(l) > 0
			% Compare the value to the limit
			if ciInput(l) > ciLimits(l);
				if prevLimit < 0;
					newHiValue = l-1 + ciInput(l) - ciLimits(l); % l + ciInput - ciLimits(l) in Java
				else
					newHiValue = l-1 + (ciInput(l) - ciLimits(l))/(prevLimit-ciLimits(l)); % l + (ciInput - ciLimits(l))/(prevLimit-ciLimits(l))
				end
				break
			end
			% Note the valid limit value
			prevLimit = ciLimits(l);
		end
	end
	% Check if the new HI value is bigger than the old one
	% if newHiValue > result
		% % If it is, replace the old one with the new one
		 result = newHiValue;
	% end
end
 fprintf ('the new HI value is %d \n', newHiValue);