function y=circonv(x,h,N)

if N == 0
    N = length(x)+length(h)-1;
end
    
X = fft(x,N);
H = fft(h,N);
Y = X.*H;
y = ifft(Y,N);

end