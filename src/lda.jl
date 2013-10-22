##############################################################################
#
# LDA
#
##############################################################################


lda(d::DocumentTermMatrix, k, maxiter = 100) = ldaimpl(dtm(d, :dense), k, maxiter)
lda(crps::Corpus, k, maxiter = 100) = lda(DocumentTermMatrix(crps), k, maxiter)
