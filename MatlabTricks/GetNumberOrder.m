function Number=GetNumberOrder(x,limits)
% x - число; limits - ограничения отрезков в виде степени 10-и
% вычисляет порядок числа
if length(x)>1
    throw(MException('MyComponent:inputError','1-ый аргумент не должен быть массивом'));
elseif length(limits)~=2
    throw(MException('MyComponent:inputError','2-ой аргумент должен быть массивом из 2-х чисел'));
end

for i=limits(2):-1:limits(1)
   if abs(x/10^i)>1
       Number=i;
       break;
   end
end
end