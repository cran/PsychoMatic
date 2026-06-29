## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(PsychoMatic)
data(psychomatic_ordinal)

## ----item-screening-----------------------------------------------------------
screen_items(psychomatic_ordinal)

## ----scoring------------------------------------------------------------------
scored <- score_scale(
  psychomatic_ordinal,
  items = names(psychomatic_ordinal),
  method = "mean",
  min_valid = 0.80
)
scored$reliability

## ----efa-auto, eval = FALSE---------------------------------------------------
# efa_result <- efa_auto(
#   psychomatic_ordinal,
#   rotation = "oblique",
#   max_iter = 3,
#   verbose = FALSE,
#   language = "eng"
# )
# summary(efa_result)

