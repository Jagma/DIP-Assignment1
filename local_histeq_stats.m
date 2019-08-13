function g = local_histeq_stats(f,m,n,k0,k1,k2)
%Performs local histogram processing on an image as stated by G&W
   classin = class(f);
   f= im2uint8(f);
   
   %pad the borders
   [R C] = size(f);
   f = padarray(f,[m n], 'symmetric', 'both');
   m_global = mean(f(:));
   v_global = var(double(f(:)));
   xg = 0;
   den = m*n;
   for x = (m+1)/2 +1 : R + (m+1)/2
       xg = xg +1;
       yg =0;
       for y = (n+1)/2+1 : C + (n+1)/2
           yg= yg+1;
           subimage = f(x:x + m-1, y:y + n-1);
          % h = histeq(subimage);
           m_local = mean(subimage(:));
           v_local = var(double(subimage(:)));
           if (m_local <= m_global*k0) &&(k1*v_global <= v_local) && (v_local <= k2*v_global)%(v_local <= k1*v_global)
               h = global_histeq2(subimage);
           else
               h = subimage;
           end
        %   h = global_histeq2(subimage);
           g(xg, yg) = h((m+1)/2, (n+1)/2);
       end
   end
   
end
