##############################################################################
#
# LSA
#
##############################################################################

function lsa(d::DocumentTermMatrix, k)
    U, S, V = svd(tf_idf(d))
    println(size(U))
    println(size(S))
    println(size(V))
    U = U[:, 1:k]
    S = S[1:k]
    V = V[:, 1:k]
    LSA(U, S, V)
end

lsa(crps::Corpus, k) = lsa(DocumentTermMatrix(crps), k)
