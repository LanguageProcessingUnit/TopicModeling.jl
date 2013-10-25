module TopicModeling

using TextAnalysis
using Clustering
using Devectorize

# LDA
include("lda/lda.jl")
include("lda/estimation.jl")
include("lda/inference.jl")
include("lda/newton_raphson.jl")
include("lda.jl")

# NMF
include("nmf/random_vcol.jl")
include("nmf/nmf.jl")
include("nmf.jl")

# LSI
include("lsa.jl")

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
export lda, nmf, lsa, getTopics, cluster, topics, mixture, perplexity

# types
export LDA, NMF, LSA, Topic

end # module
