function result = DiscreteIntegrator(func, arr, stepSize, start)
sum = 0;
result = zeros(1,length(arr));

    for n = 1:1:length(arr)   
    for currentStep = start : stepSize : arr(n)
        sum = sum + func(currentStep) * stepSize;
    end
    result(n) = sum;
    sum = 0;
    end
