

function ldaimpl(words::Matrix, k::Integer, max_iter::Integer)
    """
    Train the Latent Dirichlet Allocation model on the corpus of
    documents.

    M = number of documents.
    k = number of topics.
    V = number of words.
    """

    M, V = size(words)

    # We first need to create vectors from our text corpus.
    phi = zeros(Float64, M, V, k)
    gam = zeros(Float64, M, k)

    # Initialize alpha and beta.
    beta = rand(k, V)

    for i in 1:k
        beta[i, :] /= norm(beta[i, :], 1)
    end

    alpha = sort(rand(k), rev = true)
    alpha /= norm(alpha, 1)

    t_conv = 1
    old_t_conv = -Inf
    it = 0

    # We iterate until convergence.
    while norm(t_conv - old_t_conv) / norm(t_conv) > 10e-4 && it < max_iter
        # E-Step: variational inference, for each document.
        for d in 1:M
            res_phi, res_gam = variational_inference(alpha, beta, reshape(words[d, :], V))
            phi[d, :, :] = reshape(res_phi, 1, size(res_phi, 1), size(res_phi, 2))
            gam[d, :] = res_gam
        end

        # M-Step: parameter estimation.
        alpha, beta = parameter_estimation(gam, phi)

        # Convergence update.
        it += 1
        old_t_conv = t_conv

        t_conv = perplexity(words, beta, gam)
        println("LDA | it: $(it); ppl: $(sum(t_conv))")
    end

    LDA(alpha, beta, gam, phi)
end
