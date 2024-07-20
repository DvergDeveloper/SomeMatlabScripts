function a=LimitByArray(x,xm)
% x - число; xm - массив
% функция ограничивающая значение х крайними значениями массива xm
if length(x)>1
    throw(MException('MyComponent:inputError','1-ый аргумент не должен быть массивом'));
elseif length(xm)<2
    throw(MException('MyComponent:inputError','размерность 2-ого аргумента неверна'));
end

if max(xm)<x
   a=max(xm); 
elseif min(xm)>x
   a=min(xm);
else
   a=x;
end
end