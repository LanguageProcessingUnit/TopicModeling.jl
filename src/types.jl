

type LDA{F <: FloatingPoint}
    alpha::Vector{F}
    beta::Matrix{F}
    gamma::Matrix{F}
    phi::Array{F, 3}
end


# Imported from DimensionalityReduction package
# - W::Matrix{Float64}
# - H::Matrix{Float64}
# - iterations::Int
# - accuracy::Float64
NMF = DimensionalityReduction.NMF


type LSA
    U::Matrix
    S::Vector
    V::Matrix
end


type Topic
    words::Vector
    coeffs::Vector
end


type Clustering
    documents::Vector
    clusters::Vector
end


# Accessors for mixture and topics
mixture(m::LDA) = m.gamma
mixture(m::NMF) = m.W
mixture(m::LSA) = m.U

topics(m::LDA) = m.beta
topics(m::NMF) = m.H
topics(m::LSA) = m.V'
