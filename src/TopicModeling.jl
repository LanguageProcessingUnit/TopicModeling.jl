module TopicModeling

require("TextAnalysis")
using TextAnalysis

require("DimensionalityReduction")
using DimensionalityReduction

require("Clustering")
using Clustering

# Measures
include("measure/perplexity.jl")
include("measure/termscore.jl")

# LDA
include("lda/lda.jl")
include("lda/estimation.jl")
include("lda/inference.jl")
include("lda/newton_raphson.jl")
include("lda.jl")

# NMF
include("nmf.jl")

# LSI
include("lsa.jl")

# Types
include("types.jl")
include("topics.jl")

# Clustering
include("clustering.jl")

# methods
export lda, nmf, lsa, getTopics, cluster, topics, mixture

# types
export LDA, NMF, LSA, Topic

end # module
