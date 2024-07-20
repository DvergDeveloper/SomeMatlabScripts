function [zabros,riseTime,setTime]=GetStepStats(yArray,tArray,tStart)
% yArray - массив значений; tArray - массив времени;
% функция вычисляет параметры переходного процесса

if length(yArray)~=length(tArray)
   throw(MException('MyComponent:inputError','массивы времени и значений разного размера')); 
elseif length(yArray)<2 
   throw(MException('MyComponent:inputError','аргументы не являются массивами'));      
end

% заброс относительный
k_10=fix(length(yArray) * 0.9):length(yArray); %вычисление индексов 10% последних точек 
dy_asimp=mean(yArray(k_10))-yArray(1);
zabros=(max(yArray-yArray(1))-dy_asimp)/dy_asimp;

% время срабатывания
ind_tsr=find(yArray-yArray(1)>0.95*dy_asimp,1);
riseTime=tArray(ind_tsr)-tArray(1)-tStart;

% время регулирования
for i=length(yArray):-1:1
dy=yArray(i)-yArray(1);
if (dy<dy_asimp*0.95 || dy>dy_asimp*1.05)
   break;
end
end
setTime=tArray(i)-tStart;

end