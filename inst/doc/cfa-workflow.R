## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(PsychoMatic)
data(psychomatic_continuous)

## ----model--------------------------------------------------------------------
model <- "
factor1 =~ item1 + item2 + item3
factor2 =~ item4 + item5 + item6
"

## ----compare-models, eval = FALSE---------------------------------------------
# models <- list(
#   one_factor = "general =~ item1 + item2 + item3 + item4 + item5 + item6",
#   two_factor = model
# )
# comparison <- compare_models_auto(
#   psychomatic_continuous,
#   models = models,
#   estimator = "ML",
#   language = "eng"
# )
# comparison$fit

## ----cfa-auto, eval = FALSE---------------------------------------------------
# cfa_result <- cfa_auto(
#   psychomatic_continuous,
#   model = model,
#   estimator = "ML",
#   language = "eng"
# )
# summary(cfa_result)

