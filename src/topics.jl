

function argsort(x)
    sort([1: length(x)], by = (i -> x[i]), rev = true)
end


function getTopics(model, terms, nbtopics, topwords)

    topics = {}
    for i = 1:nbtopics
        sortedIndex = argsort(model.beta[i, :])[1:topwords]
        words = [terms[j] for j in sortedIndex]
        coeffs = [model.beta[i, j] for j in sortedIndex]
        push!(topics, Topic(words, coeffs))
    end

    topics
end


#function getTopics(model::NMF, nbtopics::Int, topwords::Int)
#    Topic({}, {})
#end
