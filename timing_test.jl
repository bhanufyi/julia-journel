# a = randn(10^8)
# b = randn(10^8)
# # Time the inner product calculation
# @time s = a' * b

# # Calculate Gflops/sec
# flops_per_inner_product = 2 * length(a)  # Each element requires a multiply and an add (2 flops)
# time_taken_seconds = @elapsed a' * b  # Measure the time taken for the inner product
# gflops = (flops_per_inner_product / time_taken_seconds) / 1e9  # Convert to Gflops

# # println("Estimated Gflops/sec: $gflops")


function calculate_time_and_gflops(vector_size, time_for_size)
    # Calculate number of FLOPs (2 * vector_size)
    flops = 2 * vector_size
    
    # Calculate GFLOPS
    gflops = flops / (time_for_size * 10^9)
    
    println("For vector size $vector_size:")
    println("FLOPs = $flops")
    println("GFLOPS = $gflops")
    
    return gflops
end

time_for_10_6 = 0.001
vector_size_10_6 = 10^6

gflops = calculate_time_and_gflops(vector_size_10_6, time_for_10_6)

vector_size_10_7 = 10^7
estimated_time_10_7 = (2 * vector_size_10_7) / (gflops * 10^9)

println("\nEstimated time for inner product of 10^7-vectors: $estimated_time_10_7 seconds")

