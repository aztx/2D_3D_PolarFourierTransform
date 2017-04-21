function [ ev ] = gen12ev( t )
%GEN12EV  computes eigenvalues of the BCCB preconditioner
% t : the matrix generated by fcolrow.m, see A.9
% ev : all eigenvalues of the BCCB preconditioner

[n,m] = size(t);
n = n/2;
v = zeros (n,m);

v(1,:) = t(1,:);
for i = 2:n
    v(i,:) = ((n-(i-1))* t(i,:)+ (i-1)*t(n+i,:))/n;
end
v = fft(v);   % CB eigenvalues

v = v.';
m = m/2;
for i=2:m
    ev(i,:) = ((m-(i-1))*v(i,:) + (i-1)*v(m+i,:))/m;
end

if(min(n,m) >= 2)
    ev = fft(ev);
end
ev = ev.';
end

