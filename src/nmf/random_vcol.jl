
function random_vcol(V::SparseMatrixCSC, rank::Integer, p_c, p_r)
    error("Not implemented yet")
end


function random_vcol(V::Matrix, rank::Integer, p_c, p_r)
    W = zeros(size(V, 1), rank)
    H = zeros(rank, size(V, 2))

    for i = 1:rank
        W[:, i] = mean(V[:, rand(1:size(V, 2), p_c)], 2)
        H[i, :] = mean(V[rand(1:size(V, 1), p_r), :], 1)
    end

    println("init done")

    W, H
end


function nmf_init(V, rank::Integer)
    println("Init W and H")

    # Number of columns of target matrix used to average the column of basis matrix.
    p_c = int(ceil(size(V, 2) / 5.0))

    # Number of rows of target matrix used to average the row of basis matrix.
    p_r = int(ceil(size(V, 1) / 5.0))

    return random_vcol(V, rank, p_c, p_r)
end
