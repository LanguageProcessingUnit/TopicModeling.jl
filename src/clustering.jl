
function cluster(mixture::Matrix, documents::Vector, k)
    res = {}
    for i in 1:size(documents, 1)
        push!(res, (findmax(mixture[i,:])[2], documents[i]))
    end
    res
end

cluster(model::LDA, documents, k) = cluster(mixture(model), documents, k)
cluster(model::NMF, documents, k) = cluster(mixture(model), documents, k)
