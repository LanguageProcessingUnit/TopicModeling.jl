

function cluster(model::LDA, k)
    kmeans(model.gamma', k)
end
