function [ y ] = tx( tev,v )
%TX multiplies the BTTB matrix T_{mn} with vector v.
% tev: the matrix generated by gentev.m, see A.11;
% y output vector


[n1,m1] = size(tev);
m = m1/2;

n = n1/2;
v = reshape (v,n,m);


ev = zeros (n1,m1);
ev(1:n,1:m) = v;

y = fft2(ev);
y = tev.* y;
y = ifft2(y);
y = y(1:n,1:m);
y = reshape (y, m*n,1);


end

