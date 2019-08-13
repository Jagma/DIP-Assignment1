function g = gamma_correction(i,gamma)
    
    X = imread(i);
    XX = double(X);
    
  %  gamma = 2.5;
    Y = XX.^gamma;
    mxy = max(max(Y));

    c = 255/mxy;
    Z = c*XX.^gamma;
    g=Z;
end

