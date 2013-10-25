

function argsort(x)
    sort([1: length(x)], by = (i -> x[i]), rev = true)
end


function getTopics(model, terms::Vector, t::Integer, w::Integer)
    res = {}
    beta = computeTermScore(topics(model))
    for i = 1:t
        sortedIndex = argsort(beta[i, :])[1:w]
        words = [terms[j] for j in sortedIndex]
        coeffs = [beta[i, j] for j in sortedIndex]
        push!(res, Topic(words, coeffs))
    end
    res
end
