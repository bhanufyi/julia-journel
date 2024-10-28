using LinearAlgebra
function Vandermonde_generator(n,m)
    v = ones(length(m),n)
    for i in 1:n
        mnew = m.^(i-1)
        for j in 1:length(m)
            v[j,i] = mnew[j]
        end
    end
    display(v)
end
Vandermonde_generator(6,[6,7,8])
Vandermonde_generator(5,[7,8,6])