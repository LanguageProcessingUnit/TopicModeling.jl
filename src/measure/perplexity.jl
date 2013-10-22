
function perplexity{F <: FloatingPoint, I <: Integer}(
    words::Matrix{I},
    pw::Matrix{F},
    pd::Matrix{F})
    """
    pw is corresponding to P(w|params): distribution of topics over words.
    pd is corresponding to P(d|params): distribution of topics over
    documents.
    """

    M = size(pd, 1)
    s = sum(words)

    n_pd = copy(pd)

    # Normalize gamma.
    for i = 1:M
        n_pd[i, :] ./= norm(n_pd[i, :], 2)
    end

    exp(-sum(words .* log(n_pd * pw), 2) / s)
end
