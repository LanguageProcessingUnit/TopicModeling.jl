
function factorize(V, rank)
    #Compute matrix factorization.
    #Return fitted factorization model.

    tolerance = 10e-8
    max_iter = 1000
    test_conv = 1

    n_iter = 0
    final_obj = 0
    best_obj = 0

    n_run = 1

    bestW, bestH = nothing, nothing

    for run = 1:n_run

        println("run $(run)")

        W, H = nmf_init(V, rank)
        W, H = _adjustment(W, H)
        p_obj = typemax(Float64)
        c_obj = typemax(Float64)

        if run == 1
            best_obj = c_obj
        end

        iter = 0

        while is_satisfied(tolerance, test_conv, max_iter, p_obj, c_obj, iter)

            println("iter $iter")

            if iter % test_conv == 0
                p_obj = c_obj
            end

            W, H = divergence_update(V, W, H)
            W, H = _adjustment(W, H)
            iter += 1

            if iter % test_conv == 0
                c_obj = div_objective(V, W, H)
            end

            println("diff: $(p_obj - c_obj)")
        end

        # if multiple runs are performed, fitted factorization model with the lowest objective function value is retained
        if c_obj <= best_obj || run == 1
            best_obj = c_obj
            n_iter = iter
            final_obj = c_obj
            bestW, bestH = W, H
        end
    end

    NMF(bestW, bestH)
end


function is_satisfied(tolerance, test_conv, max_iter, p_obj, c_obj, iter)

    if max_iter <= iter
        return false
    elseif iter % test_conv != 0
        return true
    elseif iter > 0 && c_obj > p_obj
        return false
    elseif iter > 0 && p_obj - c_obj < tolerance
        return false
    else
        return true
    end
end



function _adjustment(W, H)
    # Adjust small values to factors to avoid numerical underflow.
    H = max(H, eps(eltype(H)))
    W = max(W, eps(eltype(W)))

    W, H
end


function divergence_update(V, W, H)
    # Update basis and mixture matrix based on divergence multiplicative update rules.

    H1 = repmat(sum(W, 1)', 1, size(V, 2))
    H = H .* (W' * (V ./ (W * H)) ./ H1)

    W1 = repmat(sum(H, 2)', size(V, 1), 1)
    W = W .* (((V ./ (W * H)) * H') ./ W1)

    W, H
end


function div_objective(V, W, H)
    # Compute divergence of target matrix from its NMF estimate.

    Va = W * H
    sum(V .* log(V ./ Va) - V + Va)
end
