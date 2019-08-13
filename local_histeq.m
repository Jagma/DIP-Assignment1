function g = local_histeq(f,m,n)
%Performs local histogram processing on an image as stated by G&W
   classin = class(f);
   f= im2uint8(f);
   
   %pad the borders
   [R C] = size(f);
   f = padarray(f,[m n], 'symmetric', 'both');
   
   xg = 0;
   den = m*n;
   for x = (m+1)/2 +1 : R + (m+1)/2
       xg = xg +1;
       yg =0;
       for y = (n+1)/2+1 : C + (n+1)/2
           yg= yg+1;
           subimage = f(x:x + m-1, y:y + n-1);
          % h = histeq(subimage);
           h = global_histeq2(subimage);
           g(xg, yg) = h((m+1)/2, (n+1)/2);
       end
   end
   
end

