function a=LimitByArray(x,xm)
% x - �����; xm - ������
% ������� �������������� �������� � �������� ���������� ������� xm
if length(x)>1
    throw(MException('MyComponent:inputError','1-�� �������� �� ������ ���� ��������'));
elseif length(xm)<2
    throw(MException('MyComponent:inputError','����������� 2-��� ��������� �������'));
end

if max(xm)<x
   a=max(xm); 
elseif min(xm)>x
   a=min(xm);
else
   a=x;
end
end