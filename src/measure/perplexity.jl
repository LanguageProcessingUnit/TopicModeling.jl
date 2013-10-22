
function perplexity{F <: FloatingPoint, I <: Integer}(
    words::Matrix{I},
    beta::Matrix{F},
    gamma::Matrix{F})

    M = size(gamma, 1)
    s = sum(words)

    egamma = copy(gamma)

    # Normalize gamma.
    for i = 1:M
        egamma[i, :] ./= norm(egamma[i, :], 2)
    end

    exp(-sum(words .* log(egamma * beta), 2) / s)
end
