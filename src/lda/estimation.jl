
function parameter_estimation{T}(gam::Matrix, phi::Array{T, 3})

    """
    Things to know:
    -   M = # of documents ;
    -   K = # of topics ;
    -   N = # of words ;
    -   V = size of vocabulary.
    """

    K = size(gam, 2)

    # Iterate over all the documents and construct beta matrix.
    beta = reshape(sum(phi, 1), size(phi, 2), size(phi, 3))'

    # We normalize beta for each topic.
    for i = 1:K
        if norm(beta[i, :]) != 0
            beta[i, :] /= norm(beta[i, :], 1)
        end
    end
    # TODO: Try to optimize with normalize!
    # normalize!(beta, 2, 1)

    # Update alpha.
    alpha = newton_raphson(gam)
    alpha /= norm(alpha, 1)

    alpha, beta
end
