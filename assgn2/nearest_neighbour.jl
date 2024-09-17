using LinearAlgebra

vec_a = [1, 3, 4]
mat_x = [[4, 3, 5], [0.4, 10, 50], [1, 4, 10], [30, 40, 50]]
distances = []
angles = []

for idx in 1:4
    dist_value = norm(vec_a - mat_x[idx])
    push!(distances, dist_value)
end

println("Smallest distance from vec_a to x1,...,x4 is ", string(minimum(distances)))

for idx in 1:4
    cos_theta = dot(vec_a, mat_x[idx]) / (norm(vec_a) * norm(mat_x[idx]))
    angle_value = acos(clamp(cos_theta, -1, 1))  # To ensure valid input for acos
    push!(angles, angle_value)
end

println("Smallest angle between vec_a and x1,...,x4 is ", string(minimum(angles)))
