function out=GetVariantName(x)
if(isempty(inputname(1)))
throw(MException('MyComponent:inputError','название отсутствует, входной параметр должен быть массивом а не его элементом'));
end
out=inputname(1);
end