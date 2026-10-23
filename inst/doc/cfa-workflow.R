## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
continuous_items <- lavaan::simulateData(
  "general =~ 0.7*item1 + 0.7*item2 + 0.7*item3 + 0.7*item4 + 0.7*item5 + 0.7*item6",
  sample.nobs = 200, seed = 2401
)
model <- "general =~ item1 + item2 + item3 + item4 + item5 + item6"

## ----cfa, eval = FALSE--------------------------------------------------------
# cfa <- PsychoMatic::cfa_auto(
#   continuous_items,
#   model = model,
#   estimator = "ML",
#   language = "eng"
# )
# summary(cfa)$fit
# summary(cfa)$loadings

## ----compare, eval = FALSE----------------------------------------------------
# models <- list(
#   one_factor = model,
#   two_factor = paste(
#     "factor1 =~ item1 + item2 + item3",
#     "factor2 =~ item4 + item5 + item6",
#     sep = "\n"
#   )
# )
# comparison <- PsychoMatic::compare_models_auto(
#   continuous_items,
#   models = models,
#   estimator = "ML",
#   language = "eng"
# )
# comparison$fit
# comparison$recommendation

## ----model-reliability, eval = FALSE------------------------------------------
# reliability <- PsychoMatic::reliability_auto(
#   continuous_items,
#   level = "continuous",
#   model = cfa$fit,
#   language = "eng"
# )
# summary(reliability)$coefficients

