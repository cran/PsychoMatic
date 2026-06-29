## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(PsychoMatic)

## ----alignment-matrices-------------------------------------------------------
lambda <- matrix(
  c(0.70, 0.80, 0.75,
    0.72, 0.78, 0.74),
  nrow = 2,
  byrow = TRUE
)
nu <- matrix(
  c(0.00, 0.00, 0.00,
    0.10, 0.05, 0.08),
  nrow = 2,
  byrow = TRUE
)

## ----alignment-run, eval = FALSE----------------------------------------------
# alignment <- inv_align_auto(lambda = lambda, nu = nu, language = "eng")
# summary(alignment)

