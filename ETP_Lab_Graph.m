U=[380 300 280 255 250 230 200 170 130].*1e-3;;
R=[1900 900 800 700 600 500 400 300 200];
I=U./R;
V=min(R):20:max(R);

C=polyfit(R, U, 3)
I =polyval(C, V); % C(1)*V.^2 + C(2)*V.^1 + C(3)*V.^0;


plot(R, U, "o-", V, I)
xlabel('R, \Omega')
ylabel('U, V')
title('U(R)')
grid on