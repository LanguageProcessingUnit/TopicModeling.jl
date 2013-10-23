module TopicModeling

require("TextAnalysis")
using TextAnalysis

require("DimensionalityReduction")
using DimensionalityReduction

require("Clustering")
using Clustering

# LDA
include("lda/lda.jl")
include("lda/estimation.jl")
include("lda/inference.jl")
include("lda/newton_raphson.jl")
include("lda.jl")

# NMF
include("nmf.jl")

# Types
include("types.jl")
include("topics.jl")

# Measures
include("measure/perplexity.jl")
include("measure/termscore.jl")
include("measure.jl")

# Clustering
include("clustering.jl")

# methods
export lda, nmf, getTopics, cluster, topics, mixture, perplexity

# types
export LDA, NMF, Topic

end # module
