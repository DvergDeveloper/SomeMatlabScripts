function M=ConvertVprToM(H,Vpr)
% H - барометрическая высота в метрах; Vpr - приборная скорость в км/ч
% функция перевода приборной скорости [км/ч] в число М
if length(H)>1 || length(Vpr)>1
   throw(MException('MyComponent:inputError','аргументы должны быть сколярными величинами'));
end

M=fzero(@(x)ConvertMToVpr(H,x)-Vpr,Vpr/300/3.6);
end

