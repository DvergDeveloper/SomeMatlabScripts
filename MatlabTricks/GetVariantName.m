function out=GetVariantName(x)
if(isempty(inputname(1)))
throw(MException('MyComponent:inputError','�������� �����������, ������� �������� ������ ���� �������� � �� ��� ���������'));
end
out=inputname(1);
end