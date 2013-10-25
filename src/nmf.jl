##############################################################################
#
# NMF
#
##############################################################################

nmf(d::DocumentTermMatrix, k) = factorize(dtm(d, :dense), k)
nmf(crps::Corpus, k) = nmf(DocumentTermMatrix(crps), k)
