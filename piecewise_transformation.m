function g = piecewise_transformation(f,r1,s1,r2,s2)
    [m,n] = size(f);
    slope = r1/s1;
    slope2 = (s2-s1)/(r2-r1);
    slope3 = (255-s2)/(255-s2);

    inter1= s1-slope2*r1;
    inter2= s2-slope3*r2;

    temp = zeros(m,n);

    for i=1:m
        for j=1:n
            if (0<f(i,j)) && (f(i,j)<r1)
                temp(i,j) = slope*f(i,j);
            elseif(r1<f(i,j)) && (f(i,j)<r2)
                temp(i,j) = slope2*f(i,j)+inter1;
            elseif(r2<f(i,j)) && (f(i,j)<255)
                temp(i,j) = slope3*f(i,j)+inter2;
            end
        end
    end
    g = temp;
end

