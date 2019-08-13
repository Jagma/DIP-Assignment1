function g = global_histeq(f)
    %applies global histogram equalization to an image
    img = imread(f);
    [M,N]= size(img);
    H=imhist(img); %just gets the nk for all the rk
    H=H/(M*N);
    C=zeros(256,1);
    %compute the mapping
    for k=1:256
        C(k)=uint8(sum(H(1:k))*255);
    end

    %perform mapping
    g = C(double(img)+1);%could be replaced with for loops
end

