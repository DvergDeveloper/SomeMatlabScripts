function y=limitedInterpn(x1,x2,x3,x4,x5,x6,x7,x8,x9)
% Функция интерполяции с клипом выходящих значений. Работает как обычная
% interpn, но только до четырёхмерного массива
switch nargin
    case 9
        y=interpn(x1,x2,x3,x4,x5,Limit(x6,x1),Limit(x7,x2),Limit(x8,x3),Limit(x9,x4));
    case 7
        y=interpn(x1,x2,x3,x4,Limit(x5,x1),Limit(x6,x2),Limit(x7,x3));
    case 5
        y=interpn(x1,x2,x3,Limit(x4,x1),Limit(x5,x2));
    case 3
        y=interp1(x1,x2,Limit(x3,x1));
    otherwise
        throw(MException('MyComponent:inputError','допустимое кол-во аргументов: 3,5,7,9 ')); 
end
end