

function argsort(x)
    sort([1: length(x)], by = (i -> x[i]), rev = true)
end


function extractFromBeta(beta, terms, nbtopics, topwords)
    topics = {}
    for i = 1:nbtopics
        sortedIndex = argsort(beta[i, :])[1:topwords]
        words = [terms[j] for j in sortedIndex]
        coeffs = [beta[i, j] for j in sortedIndex]
        push!(topics, Topic(words, coeffs))
    end
    topics
end


function getTopics(model::LDA, terms, nbtopics, topwords)
    extractFromBeta(model.beta, terms, nbtopics, topwords)
end


function getTopics(model::NMF, terms, nbtopics, topwords)
    extractFromBeta(model.H, terms, nbtopics, topwords)
end
