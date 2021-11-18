function y=ola(x,h,N)

M = length(x);
P = length(h);
L = N+1-P;
r = mod(M,L);
if r ~= 0
    x = [x zeros(1,L-r)];
    M = length(x);
end
y = zeros(1,M+P-1);

H = fft(h,L+P-1);
i = 1;
while i<=M
    Xr = fft(x(i:i+L-1),L+P-1);
    Yr = H.*Xr;
    yr = ifft(Yr,L+P-1);
    y(i:i+L+P-2) = y(i:i+L+P-2)+yr;
    i=i+L;
end
if r ~= 0
    y(end-(L-r-1):end) = [];
end
end