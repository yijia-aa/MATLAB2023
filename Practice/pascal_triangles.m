function E = pascal_triangles(n)

triangle = zeros(n);

if n == 1
    triangle(1,1) = 1;
elseif n == 2
    triangle(1,1) = 1;
    triangle(2,1) = 1;
    triangle(2,2) = 1;
else
    triangle(1,1) = 1;
    triangle(2,1) = 1;
    triangle(2,2) = 1;
    for r = 3:n
        triangle(r,1) = 1;
        triangle(r,n) = 1;
        if r > 2
            for c = 2:1:n-1 % for each column
                triangle(r,c) = triangle(r-1,c-1) + triangle(r-1,c);
            end
        else break
        end
    end
end

E = triangle
  
