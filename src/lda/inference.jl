
function variational_inference{F <: FloatingPoint, I <: Integer}(
    alpha::Vector{F},
    beta::Matrix{F},
    w::Vector{I})

    """
    Optimize the free varational parameters phi and gamma
    considering the logLikelihood of the document.
    Things to know:
    - K = number of topics ;
    - N = number of words.

    % Properties:
    - words: each row is a bit-vector of size V where sum(a row) = 1, and
        the i-th bit in the vector which is equal to 1 says the word is the
        i-th in the vocabulary.

    - phi: sum(n,:) = 1.
    """

    K = size(alpha, 1)
    V = size(w, 1)

    # Get number of words by summing occurence count
    N = sum(w)

    # Init phi and gamma vectors.
    gam = alpha + (N / K)
    phi = zeros(V, K)

    l = gam
    old_l = zeros(K)

    # repmat of w
    w_rep = repmat(w, 1, K)'

    # Loop until convergence.
    while norm(l - old_l) / norm(l) > 10e-3
        # Variational inference.
        phi = (beta .* w_rep .* exp(digamma(gam) - digamma(sum(gam, 1)[1])))'

        for v = 1:V
            if norm(phi[v, :]) != 0
                phi[v, :] /= norm(phi[v, :], 1)
            end
        end

        # Using broadcast here
        phi = phi .* w

        # gamma = alpha + sum over n of phi.
        gam = (alpha' + sum(phi, 1))'

        # Update our convergence considering the logLikelihood.
        old_l = l
        l = gam
    end

    (phi, reshape(gam, size(gam, 1)))
end
