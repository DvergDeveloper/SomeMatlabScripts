function Vist=ConvertVprToVist(H,Vpr)
% H - ��������������� ������ � ������; Vpr - ��������� �������� � ��/�
% ������� �������� ��������� �������� [��/�] � �������� [�/�]
if length(H)>1 || length(Vpr)>1 
   throw(MException('MyComponent:inputError','��������� ������ ���� ���������� ����������')); 
end

Vist=fzero(@(x)ConvertVistToVpr(H,x)-Vpr,Vpr/3.6);
end