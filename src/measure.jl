
function perplexity(words::DocumentTermMatrix, model)
    perplexity(dtm(words, :dense), model)
end

function perplexity(words::Matrix, model)
    sum(perplexity(words, topics(model) + eps(Float32), mixture(model) + eps(Float32)))
end
