
function graph = drawshape1(shape,colour)
% drawshape function will plot the shape with the required colour if the matrix of the path around
% the outside of a shape is given

% Drawing Shapes
% Zhang Yannan

% Extract x and y coordinates from the maxtrix that describes the shape
x = shape (1,:);
y = shape (2,:);

% Plot the shape
graph = plot (x,y,colour);
xlim([-50 50]);
ylim([0 100]);

end