## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## -----------------------------------------------------------------------------
library(PsychoMatic)

items <- data.frame(
  item1 = c(1, 2, 3, 4, 5),
  item2 = c(2, 2, 3, 4, 5),
  item3 = c(5, 4, 3, 2, 1)
)

desc_auto(items, language = "eng")
cormat(items, type = "pearson")

