using LinearAlgebra
using Statistics

#a

a = zeros(10)
a[5] = 1

x = rand(10)
# we can transpose(a) * x
result_a = dot(a,x)

# transpose(a) * x extracts the 5th entry of 10-vector x 
println("Result for (a):", result_a, " (should be equal to x[5]):",x[5])

# b 

a = [0.3, 0.4, 0.3]

x = rand(3)

result_b = dot(a,x)
expected_b = 0.3 * x[1] + 0.4 * x[2] + 0.3 * x[3]
println("Result for (b): ", result_b, " (should be the weighted average of x): ", expected_b)


# c 

a = zeros(22)

for i in 1:22
	if i % 4 == 0
		a[i] = 1
	elseif i % 7 == 0
		a[i] = -1
	end
end

x = rand(22)

result_c = transpose(a) * x

expected_c = sum(x[i] for i in 1:22 if i % 4 == 0) - sum(x[i] for i in 1:22 if i % 7 == 0)
println("Result for (c): ", result_c, " (expected result): ", expected_c)

#d 

a = zeros(11)
@. a[4:8] = 1 / 5

x = rand(11)

result_d = dot(a,x)

expected_d = mean(x[4:8])

println("Result for (d): ", result_d, " (expected average of x[4:8]): ", expected_d)