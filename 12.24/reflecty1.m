function newshape = reflecty1(a,shape)
% reflectx fucntion reflects the shape about the y axis to get the refelected shape

% Reflect the Shape
% Zhang Yannan

% Define the transformation matrix that represents the refletion about the
% y axis
Ry = [-1+2*a 0; 0 1];
% Define the function
newshape = Ry * shape;

end