function Vist=ConvertVprToVist(H,Vpr)
% H - барометрическа€ высота в метрах; Vpr - приборна€ скорость в км/ч
% функци€ перевода приборной скорости [км/ч] в истинную [м/с]
if length(H)>1 || length(Vpr)>1 
   throw(MException('MyComponent:inputError','аргументы должны быть скол€рными величинами')); 
end

Vist=fzero(@(x)ConvertVistToVpr(H,x)-Vpr,Vpr/3.6);
end