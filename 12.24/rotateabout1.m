function newshape = rotateabout1(shape, p,q,a)
% rotateabout function rotates a shape by an angle a, about a specified
% coordinate (p,q)

% Combining Functions
% Zhang Yannan

% translate the shape by (-p,-q)
newArrow = translateShape(shape,-p,-q);

% rotate by a
newArrow2 = rotateShape(newArrow,a);

% translate the new shape by (p,q)
newshape = translateShape(newArrow2,p,q);

end