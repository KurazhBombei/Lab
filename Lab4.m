%I*R = U
%  +I1(R1+R2+R3)   -I2(R2)         +I3(0)        =E1
%  -I1(R2)         +I2(R4+R5+R2)   -I3(R5)       =E2
%   I1(0)          -I2(R5)         +I3(R5+R6+R7) =E3
% E - spriguma avoti.

R1 = 1;
R2 = 2;
R3 = 3;
%...
r = [1 2 3 6 8 9 3];
t=0:0.01:5;
E1 = sin(2*pi*2*t);
E2 = cos(2*pi*2*t);
E3 = 1.5*ones(size(t));
R = [sum(r(1:3)), -r(2), 0 ; 
     -r(2), sum(r([4, 5, 2])), -r(5) ;
     0, -r(5), sum(r([5, 6, 7]))
    ];
Ein = [E1; -E2; -E3];

I = R\Ein;

Ur5 = r(5).*(I(2, :)-I(3, :));
Pr5 = Ur5.*(I(2, :)-I(3, :));
KSpL = r(4)*I(2, :) + Ur5 +E2 + r(2)*(I(2, :)-I(1, :));

plot(t, Ur5)
hold on 
plot(t, Pr5)
hold on
plot(t, KSpL)
axis([0 5 -1 1])
xlabel('t, s')
ylabel('U, V')
grid
