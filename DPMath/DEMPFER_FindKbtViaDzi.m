function Kbt = DEMPFER_FindKbtViaDzi(numerator,denominator,dzi)
% numerator - числитель пф-функции(вектор); % denominator - знаменатель пф-функции(вектор); 
% dzi - желаемое значение декремента затухания;
% Функция для поиска такого значения коэффициента Кбета с точкой, при котором
% передаточная функция самолёта с демпфером рысканья имела декремент
% затухания dzi. Поиск проводится методом золотого сечения
if length(numerator)>length(denominator)
    throw(MException('MyComponent:inputError','порядок числителя пф-функции больше порядка знаменателя')); 
elseif length(dzi)>1
    throw(MException('MyComponent:inputError','желаемый декремент затухания не может быть массивом')); 
end


a0=0.5;
b0=10;
delta=1;        % для первого цикла delta - размер отрезка поиска
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