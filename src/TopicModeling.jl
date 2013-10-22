module TopicModeling

require("TextAnalysis")
using TextAnalysis

require("DimensionalityReduction")
using DimensionalityReduction

# Measures
include("measure/perplexity.jl")

# LDA
include("lda/lda.jl")
include("lda/estimation.jl")
include("lda/inference.jl")
include("lda/newton_raphson.jl")
include("lda/term_score.jl")
include("lda.jl")

# NMF
include("nmf.jl")

# Types
include("types.jl")
include("topics.jl")

# methods
export lda, nmf, getTopics

# types
export LDA, Topic

end # module
