
# Define a vectorized version of trigamma
function trigamma{F <: FloatingPoint}(x::F)
    polygamma(1, x)
end
@vectorize_1arg FloatingPoint trigamma


function newton_raphson{F <: FloatingPoint}(gammas::Matrix{F})
    """
        Wrapper over the newton raphson algorithm to
        initialize alpha
    """
    K = size(gammas, 2)
    ini_alpha = reshape(mean(gammas, 1) / K, K)
    newton_raphson(gammas, ini_alpha)
end

function newton_raphson{F <: FloatingPoint}(
    gammas::Matrix{F},
    ini_alpha::Vector{F})

    """
        Use the newton & raphson method to find alpha
    """

    M, K = size(gammas)

    if M <= 1
        alpha = gammas[0, :]'
        return alpha
    end

    maxiter = 20
    alpha = copy(ini_alpha)
    palpha = zeros(K)
    t = 0

    while t < maxiter
        f = M * (digamma(sum(alpha)) - digamma(alpha)) + reshape(sum(digamma(gammas), 1), K) - sum(digamma(sum(gammas, 2)), 1)[1]
        df = M .* trigamma(alpha) - trigamma(sum(alpha)[1])
        alpha += f ./ df

        # If any alpha is negative, we try again.
        # There is no sense of a negative parameter for the Dirichlet
        # distribution.
        if any(alpha .< 0)
            ini_alpha /= 10
            alpha = copy(ini_alpha)
            palph = zeros(K)
            t = 0
            continue
        end

        # Test of convergence if we already have done an iteration.
        if t > 1 && norm(alpha - palpha, 1) / norm(alpha, 1) < 10e-4
            break
        end

        palpha = alpha
        t += 1
    end

    alpha
end
