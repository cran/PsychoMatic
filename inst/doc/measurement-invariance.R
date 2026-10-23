## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----continuous-data----------------------------------------------------------
grouped_items <- lavaan::simulateData(
  "general =~ 0.7*mg1 + 0.7*mg2 + 0.7*mg3 + 0.7*mg4 + 0.7*mg5 + 0.7*mg6",
  sample.nobs = 400, seed = 2402
)
grouped_items$group <- factor(rep(c("A", "B"), each = 200))
table(grouped_items$group)
continuous_model <- "general =~ mg1 + mg2 + mg3 + mg4 + mg5 + mg6"

## ----complete, eval = FALSE---------------------------------------------------
# complete <- PsychoMatic::factorial_invariance_auto(
#   grouped_items,
#   group = "group",
#   model = continuous_model,
#   estimator = "ML",
#   missing = "auto",
#   language = "eng"
# )
# summary(complete)$fit

## ----ordinal-data-------------------------------------------------------------
set.seed(2402)
latent <- matrix(stats::rnorm(600 * 3), ncol = 3)
group <- factor(rep(c("A", "B"), each = 300))
ordinal_groups <- as.data.frame(sapply(seq_len(9), function(j) {
  response <- 0.8 * latent[, ceiling(j / 3)] + stats::rnorm(600, sd = 0.6)
  values <- integer(600)
  for (g in levels(group)) {
    thresholds <- c(-Inf, -1, -0.3, 0.3, 1, Inf)
    if (j == 3 && g == "B") thresholds[4] <- 0.8
    values[group == g] <- cut(response[group == g], thresholds, labels = FALSE)
  }
  values
}))
names(ordinal_groups) <- paste0("i", 1:9)
ordinal_groups[] <- lapply(ordinal_groups, ordered, levels = 1:5)
ordinal_groups$group <- group
ordinal_model <- paste(
  "factor1 =~ i1 + i2 + i3",
  "factor2 =~ i4 + i5 + i6",
  "factor3 =~ i7 + i8 + i9",
  sep = "\n"
)

## ----ordinal-complete, eval = FALSE-------------------------------------------
# ordinal_complete <- PsychoMatic::ordinal_invariance_auto(
#   ordinal_groups, group = "group", model = ordinal_model,
#   estimator = "WLSMV", language = "eng"
# )
# summary(ordinal_complete)$fit

## ----partial, eval = FALSE----------------------------------------------------
# if (requireNamespace("semTools", quietly = TRUE)) {
#   partial <- PsychoMatic::invariance_partial(
#     ordinal_groups,
#     group = "group",
#     model = ordinal_model,
#     free = "i3 | t3",
#     rationale = "The simulation preregisters a group-B shift in this threshold.",
#     stage = "thresholds",
#     workflow = "ordinal",
#     measurement = "ordinal",
#     estimator = "WLSMV",
#     ordered = paste0("i", 1:9),
#     min_anchor_items = 2,
#     language = "eng"
#   )
#   summary(partial)$releases
#   summary(partial)$comparisons
# }

