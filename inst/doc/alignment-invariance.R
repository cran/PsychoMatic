## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----matrices-----------------------------------------------------------------
groups <- c("A", "B")
items <- paste0("i", 1:9)

lambda <- rbind(
  A = c(0.78, 0.73, 0.76, 0.72, 0.80, 0.69, 0.77, 0.74, 0.71),
  B = c(0.76, 0.75, 0.72, 0.74, 0.78, 0.71, 0.75, 0.76, 0.70)
)
nu <- rbind(
  A = rep(0, length(items)),
  B = c(0.03, -0.02, 0.45, 0.01, -0.03, 0.02, 0.00, 0.02, -0.01)
)
dimnames(lambda) <- dimnames(nu) <- list(groups, items)

## ----alignment, eval = FALSE--------------------------------------------------
# if (requireNamespace("sirt", quietly = TRUE)) {
#   alignment <- PsychoMatic::inv_align_auto(
#     lambda = lambda,
#     nu = nu,
#     fixed = TRUE,
#     meth = 2,
#     language = "eng"
#   )
#   summary(alignment)
# }

