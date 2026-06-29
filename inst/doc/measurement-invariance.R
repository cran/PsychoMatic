## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----setup--------------------------------------------------------------------
library(PsychoMatic)
data(psychomatic_multigroup)

## ----structure----------------------------------------------------------------
table(psychomatic_multigroup$group)
head(psychomatic_multigroup)

## ----model--------------------------------------------------------------------
model <- "
factor1 =~ mg1 + mg2 + mg3
factor2 =~ mg4 + mg5 + mg6
"

## ----invariance, eval = FALSE-------------------------------------------------
# invariance <- factorial_invariance_auto(
#   psychomatic_multigroup,
#   group = "group",
#   model = model,
#   estimator = "ML",
#   language = "eng",
#   report = FALSE
# )
# summary(invariance)

