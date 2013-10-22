

function cluster(model::LDA, documents, k)
    res = {}
    for i in 1:size(documents, 1)
        d = documents[i]
        push!(res, (findmax(model.gamma[i,:])[2], split(d, "/")[end]))
    end
    res
end

function cluster(model::NMF, documents, k)
    res = {}
    for i in 1:size(documents, 1)
        d = documents[i]
        push!(res, (findmax(model.W[i,:])[2], split(d, "/")[end]))
    end
    res
end
