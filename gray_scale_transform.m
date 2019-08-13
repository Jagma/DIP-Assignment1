function g = gray_scale_transform(f,min,max, change)
    r = size(f,1);
    c = size(f,2);

    for i=1:r
        for k=1:c
            if (f(i,k)<=max) && (f(i,k)>=min)
                f(i,k) = change;
            end
        end
    end
    g = f;
end

