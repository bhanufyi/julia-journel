module Kmeans

export kmeans

using SparseArrays
using LinearAlgebra
using Statistics

function kmeans(data_points, num_clusters)
    tolerance = 1e-6
    iteration_losses = Float64[]
    num_data_points = length(data_points)
    dim = length(data_points[1])
    centroids, cluster_assignments = initialize_centroids(data_points, num_clusters)
    
    while true
        cluster_assignments = assign_clusters(data_points, centroids)
        centroids = compute_new_centroids(data_points, cluster_assignments, num_clusters, centroids)
        push!(iteration_losses, compute_loss(data_points, centroids, cluster_assignments))
        
        if length(iteration_losses) >= 2 && abs(iteration_losses[end] - iteration_losses[end-1]) <= tolerance
            break
        end
    end
    
    return centroids, cluster_assignments, iteration_losses
end

# Assigns each data point to the nearest centroid
function assign_clusters(data_points, centroids)
    cluster_assignments = Int[]
    for i in 1:length(data_points)
        # calculate the Euclidean distance from the i-th data point to each centroid
        distances_to_centroids = compute_distances(data_points[i], centroids)
        # find the closest centroid
        _, nearest_centroid_idx = findmin(distances_to_centroids)
        push!(cluster_assignments, nearest_centroid_idx)
    end
    return cluster_assignments
end

# Computes new centroids as the mean of assigned data points
function compute_new_centroids(data_points, cluster_assignments, num_clusters, previous_centroids)
    new_centroids = Vector[]
    for cluster_id in 1:num_clusters
        # get data points assigned to this centroid
        points_in_cluster = data_points[cluster_assignments .== cluster_id]
        
        # if points are assigned, update the centroid to the mean
        if length(points_in_cluster) > 0
            push!(new_centroids, mean(points_in_cluster))
        else
            # if no points are assigned, keep the old centroid
            push!(new_centroids, previous_centroids[cluster_id])
        end
    end
    return new_centroids
end

# Computes the total loss for the clustering (sum of squared distances)
function compute_loss(data_points, centroids, cluster_assignments)
    num_data_points = length(data_points)
    total_sos_distance = 0.0
    for i in 1:num_data_points
        total_sos_distance += norm(data_points[i] - centroids[cluster_assignments[i]])^2
    end
    return total_sos_distance / num_data_points
end

# Initializes centroids by randomly assigning points to clusters
function initialize_centroids(data_points, num_clusters)
    num_data_points = length(data_points)
    dim = length(data_points[1])
    random_assignments = rand(1:num_clusters, num_data_points)
    initial_centroids = compute_new_centroids(data_points, random_assignments, num_clusters, [zeros(dim) for _ in 1:num_clusters])
    return initial_centroids, random_assignments
end

# Computes the Euclidean distance between a vector and all centroids
function compute_distances(point, centroids)
    return [norm(point - centroids[i]) for i in 1:length(centroids)]
end

end
