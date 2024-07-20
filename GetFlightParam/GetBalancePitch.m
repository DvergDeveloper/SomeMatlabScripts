function tang=GetBalancePitch(alpha,beta,gamma,teta)
% функция расчета балансировочного угла тангажа

% alpha - угол атаки [рад]
% beta - скольжение [рад]
% gamma - крен [рад]
% teta - угол наклона траектории [рад]

teta=-teta;
tang=real(-2*atan((cos(alpha)*cos(beta)+sqrt(cos(alpha)^2*cos(beta)^2+(cos(beta)*cos(gamma)*sin(alpha)+sin(beta)*sin(gamma))^2-sin(teta)^2))...
/(cos(beta)*cos(gamma)*sin(alpha)+sin(beta)*sin(gamma)-sin(teta)))+pi);
end