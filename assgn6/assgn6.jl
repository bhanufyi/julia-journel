using LinearAlgebra
using Plots
using DSP # for convolution

# Given channel impulse response
c = [1.0, 0.7, -0.3, -0.1, 0.05]

# Length of impulse response
n = length(c)

# Construct the convolution matrix for c
C = zeros(n, n)
for i in 1:n
    C[i:n, i] .= c[1:(n - i + 1)]
end

# e1 is the first standard basis vector
e1 = zeros(n)
e1[1] = 1.0

# Solve the least squares problem
h = C \ e1

# Perform convolution using DSP.conv
hc = conv(h, c)

# Plot c (Channel Impulse Response)
p1 = plot(c, st=:stem, label="cₖ", lw=2, legend=:topright, xlabel="k", ylabel="Amplitude", markersize=6, title="Channel Impulse Response", marker=:circle)

# Plot h (Equalizer Impulse Response)
p2 = plot(h, st=:stem, label="hₖ", lw=2, legend=:topright, xlabel="k", ylabel="Amplitude", markersize=6, title="Equalizer Impulse Response", marker=:circle)

# Plot h * c (Convolution Result)
p3 = plot(hc[1:(n+4)], st=:stem, label="(c ∗ h)ₖ", lw=2, legend=:topright, xlabel="k", ylabel="Amplitude", markersize=6, title="Convolution (c ∗ h)", marker=:circle)

# Display all plots
plot(p1, p2, p3, layout=(1, 3), size=(900, 300))


 using LinearAlgebra
    A = rand(20,10);
    b = rand(20);
    #a.1
    x_cap_1 = A\b;
    println(x_cap_1,"\n");
    #a.2
    x_cap_2 = inv(A'A)A'b;
    println(x_cap_2,"\n");
    #a.3
    x_cap_3 = pinv(A)b;
    println(x_cap_3,"\n");
    
    println("Checking if the vectors are equal or not by printing it. One can see 
    that the vectors are similar upto 13 to 14 decimal places. Thus, they are equivalent.");


 A = rand(100000,100);
    b = rand(100000);
    @time x_cap = A\b;
    @time x_cap = A\b;
    @time x_cap = A\b;
    @time x_cap = A\b;
    @time x_cap = A\b;
    @time x_cap = A\b;
    @time x_cap = A\b;
