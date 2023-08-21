function newArrow = translateShape1(arrow,a,b)
%translate function translates the shape of the original arrow by (a,b) to
%become the new arrow, i.e. it moves the shape to the right by a and up by
%b

% Define and Translate Shapes
% Zhang Yannan

% Extracts the x and y coordinates from the shape matrix
x = arrow (1,:);
y = arrow (2,:);

% Translation
x2 = x+a-x(1);
y2 = y+b-y(1);

% Define the function
newArrow = [x2;y2];
end