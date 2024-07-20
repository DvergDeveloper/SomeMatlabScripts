function Number=GetNumberOrder(x,limits)
% x - �����; limits - ����������� �������� � ���� ������� 10-�
% ��������� ������� �����
if length(x)>1
    throw(MException('MyComponent:inputError','1-�� �������� �� ������ ���� ��������'));
elseif length(limits)~=2
    throw(MException('MyComponent:inputError','2-�� �������� ������ ���� �������� �� 2-� �����'));
end

for i=limits(2):-1:limits(1)
   if abs(x/10^i)>1
       Number=i;
       break;
   end
end
end