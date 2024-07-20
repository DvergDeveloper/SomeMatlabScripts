function fullName=GetPathByName(name)
% получение полного имени с путем по имени блока
temporaryFolder=find_system(bdroot(gcb),'Name',name);
fullName=temporaryFolder{1};
end