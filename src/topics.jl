

function argsort(x)
    sort([1: length(x)], by = (i -> x[i]), rev = true)
end


function extractFromBeta(beta::Matrix, terms::Vector, t::Integer, w::Integer)
    topics = {}
    for i = 1:t
        sortedIndex = argsort(beta[i, :])[1:w]
        words = [terms[j] for j in sortedIndex]
        coeffs = [beta[i, j] for j in sortedIndex]
        push!(topics, Topic(words, coeffs))
    end
    topics
end


function getTopics(model::LDA, terms::Vector, nbtopics::Integer, topwords::Integer)
    extractFromBeta(computeTermScore(topics(model)), terms, nbtopics, topwords)
end


function getTopics(model::NMF, terms::Vector, nbtopics::Integer, topwords::Integer)
    extractFromBeta(topics(model), terms, nbtopics, topwords)
end
