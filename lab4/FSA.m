function [fsCoeffs] = FSAnalysis(x, k)
fsCoeffs = zeros(1,2*k+1);
stepSize = 0.001;
sum = 0;
T = (length(x) - 1) * stepSize;
k_arr = -k : 1 : k;
t = 0:stepSize:T;

for n = 1:1:length(fsCoeffs)
    k_used =  k_arr(n);
    for currentStep = 0 : stepSize : T            
    x_index = int64(currentStep * (length(x)-1)/T + 1);        
    sum = sum + ( x(x_index) * exp(-1i*k_used*2*pi*currentStep/T) * stepSize);          
    end
    fsCoeffs(n) = sum / T;
    sum = 0;
end
