%Image Processing -- Nathan DWEK (ULB)
function y = oddFilter(h,x)
    l = length(h);
    pad = floor(l/2);
    y = zeros(length(x),1);
    x = [zeros(pad,1); x; zeros(pad,1)];
    for indx = 1:length(x)-l
        products = h.*x(indx:indx+l-1);
        y(indx) = sum(products);
    end
end
