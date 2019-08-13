function g = log_Transform(i,c)
  %function performs log transformations of image i
  X = double(imread(i));
  Y = log(1+X); % +1 because log(0) is undefined
  Z = c*Y;
 % Z = exp(X/c)-1; inverse log 
  g=Z;
end

