function Kbt = DEMPFER_FindKbtViaDzi(numerator,denominator,dzi)
% numerator - ��������� ��-�������(������); % denominator - ����������� ��-�������(������); 
% dzi - �������� �������� ���������� ���������;
% ������� ��� ������ ������ �������� ������������ ����� � ������, ��� �������
% ������������ ������� ������� � ��������� �������� ����� ���������
% ��������� dzi. ����� ���������� ������� �������� �������
if length(numerator)>length(denominator)
    throw(MException('MyComponent:inputError','������� ��������� ��-������� ������ ������� �����������')); 
elseif length(dzi)>1
    throw(MException('MyComponent:inputError','�������� ��������� ��������� �� ����� ���� ��������')); 
end


a0=0.5;
b0=10;
delta=1;        % ��� ������� ����� delta - ������ ������� ������
while delta>0.001
    x1=a0+0.382*(b0-a0);
    x2=a0+0.618*(b0-a0);
    Wraz1=tf(x1*numerator, denominator); 
    Wzam1=feedback(Wraz1,1);
    [~,zeta1]=damp(Wzam1);
    f1=abs(zeta1(1)-dzi);
    Wraz2=tf(x2*numerator, denominator); 
    Wzam2=feedback(Wraz2,1);
    [~,zeta2]=damp(Wzam2);
    f2=abs(zeta2(1)-dzi);
    if f1>f2
        a0=x1;
    else
        b0=x2;
    end
    delta=abs(a0-b0);
end
Kbt = (a0+b0)/2;
end