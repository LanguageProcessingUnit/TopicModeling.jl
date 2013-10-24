perplexity(words::DocumentTermMatrix, model::LDA) = sum(perplexity(dtm(words,
:dense), topics(model), mixture(model)))

perplexity(words::Matrix, model::LDA) = sum(perplexity(words,
topics(model), mixture(model)))

perplexity(words::DocumentTermMatrix, model::NMF) = sum(perplexity(dtm(words,
:dense), topics(model) + eps(Float32), mixture(model) + eps(Float32)))

perplexity(words::Matrix, model::LDA) = sum(perplexity(words,
topics(model) + eps(Float32), mixture(model) + eps(Float32)))
