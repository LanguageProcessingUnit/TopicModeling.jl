
function termscore(beta::Matrix, k::Integer, v::Integer)
    beta[k, v] * (log(beta[k, v]) - (sum(map(log, beta[:, v]))) / k)
end


function computeTermScore(beta::Matrix)
    beta_c = copy(beta) + eps(Float32)
    for k = 1:size(beta, 1), v = 1:size(beta, 2)
        beta_c[k, v] = termscore(beta, k, v)
    end
    map!(beta_c) do x
        if isnan(x)
            return 0.0
        end
        if isinf(x)
            return 0.0
        end
        return x
    end
    beta_c
end
