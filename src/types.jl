

type LDA{F <: FloatingPoint}
    alpha::Vector{F}
    beta::Matrix{F}
    gamma::Matrix{F}
    phi::Array{F, 3}
end


# Imported from DimensionalityReduction package
NMF = DimensionalityReduction.NMF
#type NMF
#    W::Matrix{Float64}
#    H::Matrix{Float64}
#    iterations::Int
#    accuracy::Float64
#end


type Topic
    words::Vector{Any}
    coeffs::Vector{Any}
end


type Clustering
    documents
    clusters
end
