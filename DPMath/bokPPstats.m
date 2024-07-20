function [t_zat,freq_wy,m_zat]=bokPPstats(t_wy,wy,t_step_end)
k=0;
all_k=0;
for i=find(t_wy>t_step_end,1):length(t_wy)-1
    if(wy(i-1)<wy(i) && wy(i+1)<wy(i))
        k=k+1;
        positive_Am(k)=wy(i);
        t_positive_Am(k)=t_wy(i);
        all_k=all_k+1;
        all_Am(all_k)=wy(i);
        t_all_Am(all_k)=t_wy(i);
    end
end
k=0;
for i=find(t_wy>t_step_end,1):length(t_wy)-1
    if(wy(i-1)>wy(i) && wy(i+1)>wy(i))
        k=k+1;
        negative_Am(k)=wy(i);
        t_negative_Am(k)=t_wy(i);
        all_k=all_k+1;
        all_Am(all_k)=wy(i);
        t_all_Am(all_k)=t_wy(i);
    end
end

% пересобираем массив всех экстремумов по времени
[~,I]=sort(t_all_Am);
t_all_Am=t_all_Am(I);
all_Am=all_Am(I);

% РАСЧЕТ t_zat freq_wy m_zat
Am0=all_Am(1);
if (length(all_Am)>=200)
iAm05=find(0.05*Am0>abs(all_Am),1);
t_zat=t_all_Am(iAm05)-t_all_Am(1);
else
    y=abs(wy(find(t_wy>=t_all_Am(1),1):end)-wy(find(t_wy>=t_all_Am(1),1)));
    x=t_wy(find(t_wy>=t_all_Am(1),1):end);
%     plot(x,y)
 [~,~,t_zat]= GetStepStats(y,x,0);  
end
% disp(t_zat)
if (length(t_all_Am)>6)
freq_wy=1/(mean([t_all_Am(3)-t_all_Am(1)...
                 t_all_Am(4)-t_all_Am(2)...
                 t_all_Am(5)-t_all_Am(3)...
                 t_all_Am(6)-t_all_Am(4)]));

m_zat = mean([all_Am(1)/all_Am(3)...
              all_Am(2)/all_Am(4)...
              all_Am(3)/all_Am(5)...
              all_Am(4)/all_Am(6)]);
elseif (length(t_all_Am)==3)
freq_wy=1/(t_all_Am(3)-t_all_Am(1));
m_zat=all_Am(1)/all_Am(3);
else
freq_wy=0;
m_zat=0;
end
end