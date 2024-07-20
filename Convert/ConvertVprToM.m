function M=ConvertVprToM(H,Vpr)
% H - ��������������� ������ � ������; Vpr - ��������� �������� � ��/�
% ������� �������� ��������� �������� [��/�] � ����� �
if length(H)>1 || length(Vpr)>1
   throw(MException('MyComponent:inputError','��������� ������ ���� ���������� ����������'));
end

M=fzero(@(x)ConvertMToVpr(H,x)-Vpr,Vpr/300/3.6);
end

