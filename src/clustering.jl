
function cluster(mixture::Matrix, documents::Vector, k)
    res = {}
    for i in 1:size(documents, 1)
        push!(res, (findmax(mixture[i,:])[2], documents[i]))
    end
    res
end

cluster(model::LDA, documents, k) = cluster(model.gamma, documents, k)
cluster(model::NMF, documents, k) = cluster(model.W, documents, k)
