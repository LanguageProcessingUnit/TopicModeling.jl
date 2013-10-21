

function termscore(beta, k, v)
    beta[k, v] * log(beta[k, v] / reduce(*, beta[:, v], 1.0) ^ (1 / size(beta, 1)))
end
