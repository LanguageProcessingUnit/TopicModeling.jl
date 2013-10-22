

function cluster(model::LDA, documents, k)
    result = kmeans(model.gamma', k)
    Clustering(documents, result.assignments)
end
