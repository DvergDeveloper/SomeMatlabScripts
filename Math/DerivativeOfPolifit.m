function dy=DerivativeOfPolifit(P,x)
% ������� �������������� ��������� �������� �������� � ����� �
dy=0;

if length(P)<2
    return
end

prev=fliplr(P);
for i=2:length(P)
deg = i-1;    
dy = dy+prev(i)*x.^(deg-1)*deg;
end

end