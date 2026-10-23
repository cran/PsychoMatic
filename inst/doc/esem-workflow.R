## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----user-template, eval=FALSE------------------------------------------------
# result <- PsychoMatic::esem_auto(
#   data = MY_DATA,
#   n_factors = 3,
#   items = 2:13,
#   rotation = "geomin",
#   ordered = TRUE,
#   language = "esp"
# )
# result$manuscript_text

## ----data---------------------------------------------------------------------
population <- '
 A =~ .75*x1 + .70*x2 + .65*x3
 B =~ .75*x4 + .70*x5 + .65*x6
 C =~ .75*x7 + .70*x8 + .65*x9
 A =~ .12*x4
 B =~ .12*x7
 C =~ .12*x1
'
d <- lavaan::simulateData(population, sample.nobs = 400, seed = 101)
keys <- list(A = paste0("x", 1:3), B = paste0("x", 4:6), C = paste0("x", 7:9))
ordinal <- as.data.frame(lapply(d, function(v) {
  cut(v, unique(stats::quantile(v, seq(0, 1, length.out = 6))),
      include.lowest = TRUE, labels = FALSE)
}))
target <- PsychoMatic::esem_auto(ordinal, factors = keys, ordered = TRUE,
  compare_cfa = TRUE, seed = 2026, language = "esp", verbose = FALSE)
target$results$fit_indices[, c("metric", "value", "variant")]
target$results$item_diagnostics

## ----geomin-------------------------------------------------------------------
geomin <- PsychoMatic::esem_auto(d, items = names(d), n_factors = 3,
  rotation = "geomin", ordered = FALSE,
  rotation_args = list(geomin_epsilon = .01), seed = 2026, verbose = FALSE)
summary(geomin)$loadings[, c("factor", "item", "standardized")]

## ----draft--------------------------------------------------------------------
cat(target$manuscript_text)

## ----reports, eval=FALSE------------------------------------------------------
# PsychoMatic::psychomatic_report(target, format = c("word", "excel"),
#   file_name = "esem_results", language = "esp")

