module TopicModeling

require("TextAnalysis")
using TextAnalysis

require("DimensionalityReduction")
using DimensionalityReduction

include("lda.jl")
include("nmf.jl")
include("types.jl")
include("topics.jl")

# methods
export lda, nmf, getTopics
# types
export LDA, Topic

end # module
