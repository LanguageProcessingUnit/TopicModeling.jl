

type LDA{F <: FloatingPoint}
    alpha::Vector{F}
    beta::Matrix{F}
    gamma::Matrix{F}
    phi::Array{F, 3}
end


type Topic
    words::Vector{Any}
    coeffs::Vector{Any}
end


type Clustering
    documents
    clusters
end
