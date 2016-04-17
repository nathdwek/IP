%Image Processing -- Nathan DWEK (ULB)
x = random('norm', 0, 1, 100, 1);
t = 1:100;
h = [1/3;1/3;1/3];
figure;hold all;
plot(t,x);
plot(t,oddFilter(h,x),t,conv(x,h,'same'));
legend('original','filtered','filtered using matlab builtin')
