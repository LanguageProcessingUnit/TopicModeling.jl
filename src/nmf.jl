##############################################################################
#
# NMF
#
##############################################################################

nmf(d::DocumentTermMatrix, k) = DimensionalityReduction.nmf(dtm(d, :dense), k)
nmf(crps::Corpus, k) = nmf(DocumentTermMatrix(crps), k)
