function [tang,gamma,psi]=ConvertQuaternionToEuler(q)
% q - ������������� ������ ����������
% ��������� ������������� ������ ������������
% ��������� ������ ������������ � ������(tang) ����(gamma) � ��������(psi) � ����
if length(q)~=4
    throw(MException('MyComponent:inputError','����������� ��������� ��������')); 
elseif (abs(sqrt(q(1)^2+q(2)^2+q(3)^2+q(4)^2))-1>0.01)
    throw(MException('MyComponent:inputError','������ ����������� �� ����������'));     
end

Ax=q(1)*q(1) + q(2)*q(2) - q(3)*q(3) - q(4)*q(4);
Bx=2*(q(2)*q(3) + q(1)*q(4));
By=q(1)*q(1) - q(2)*q(2) + q(3)*q(3) - q(4)*q(4);
Bz=2*(q(3)*q(4) - q(1)*q(2));
Dx= 2*(q(2)*q(4) - q(1)*q(3));
tang=180/pi*asin(Bx);
gamma=-180/pi*atan2(Bz,By);
psi=-180/pi*atan2(Dx,Ax);
end