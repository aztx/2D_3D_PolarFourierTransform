function [ y ] = l2cinvx( ev,d )

%L2CINVX solves the preconditioning system Cy = d with BCCB preconditioner
% ev: the matrix generated by genl2ev.m, see A. 17;
% d : the right hand side vector; 
% y : the output solution


[n,m] = size (ev);
rex = reshape (d,n,m);
rex = fft2(rex);
rex =  rex./ ev;
rex = ifft2(rex);
y = reshape (rex, m*n,1);
end

