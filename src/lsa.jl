##############################################################################
#
# LSA
#
##############################################################################

function normresult!(mat)
    if any(mat .< 0)
        mat -= minimum(mat)
    end

    for i = 1:size(mat, 2)
        mat[:, i] /= norm(mat[:, i], 2)
    end

    mat
end

function lsa(d::DocumentTermMatrix, k)
    U, S, V = svd(tf_idf(d))

    U = U[:, 1:k]
    S = S[1:k]
    V = V[:, 1:k]

    # Normalize results
    U = normresult!(U)
    V = normresult!(V)

    LSA(U, S, V)
end

lsa(crps::Corpus, k) = lsa(DocumentTermMatrix(crps), k)
