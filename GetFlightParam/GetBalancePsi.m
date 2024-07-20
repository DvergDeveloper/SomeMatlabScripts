function psi=GetBalancePsi(alpha,beta,gamma,teta,pitch)
% функция расчета балансировочного угла раскания

%alpha - угол атаки
%beta - угол скольжения
%gamma - угол крена
%teta - угол наклона траектории
%pitch - угол тангажа


psi=real( 2*atan((-2*cos(alpha)*cos(beta)*cos(pitch)-2*cos(beta)*cos(gamma)*sin(alpha)*sin(pitch)...   
-2*sin(beta)*sin(gamma)*sin(pitch)-sqrt(-4*(-cos(teta)+cos(gamma)*sin(beta)-cos(beta)*sin(alpha)*sin(gamma))...
*(-cos(teta)-cos(gamma)*sin(beta)+cos(beta)*sin(alpha)*sin(gamma))+(2*cos(alpha)*cos(beta)*cos(pitch)+2*cos(beta)*cos(gamma)*sin(alpha)*sin(pitch)...
+2*sin(beta)*sin(gamma)*sin(pitch))^2))/(2*(-cos(teta)+cos(gamma)*sin(beta)-cos(beta)*sin(alpha)*sin(gamma)))));
end