function [y] = ConvFUNC(x,h)
    Nx = length(x);
    Nh = length(h);
    Ny = Nx + Nh - 1;
    y = zeros(1, Ny);
    
    for i = 1:Ny
        k = max(1, i+1-Nh):min(i, Nx);
        y(i) = sum(x(k) .* h(i-k+1));
    end
end