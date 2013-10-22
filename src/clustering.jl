

function cluster(model::LDA, documents, k)
    result = kmeans(model.gamma', k)
    Clustering(documents, result.assignments)
end

function cluster(model::NMF, documents, k)
    result = kmeans(model.W', k)
    Clustering(documents, {})
end
