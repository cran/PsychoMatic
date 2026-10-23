## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval=FALSE)

## -----------------------------------------------------------------------------
# fit <- PsychoMatic::network_auto(my_data, items=paste0("I",1:12), group="sex",
#   reverse=c("I3","I8"), ranges=list(I3=c(1,5), I8=c(1,5)), seed=2026)
# print(fit)
# plot(fit, type="network")
# plot(fit, type="ega_stability") # EGA network and item replication, side by side
# PsychoMatic::network_plots(fit, "figures", formats=c("pdf","svg","png"))
# PsychoMatic::psychomatic_report(fit, format=c("word","excel"),
#   file_name="network_results", language="eng")
# PsychoMatic::psychomatic_report(fit, format=c("word","excel"),
#   file_name="resultados_red", language="esp")

## -----------------------------------------------------------------------------
# install.packages(c("EGAnet","bootnet","NetworkComparisonTest","igraph","qgraph",
#   "officer","flextable","openxlsx"))

## -----------------------------------------------------------------------------
# # Skip UVA (default)
# fit <- network_auto(my_data, uva=NULL)
# # Describe redundancy, preserve all items
# diagnostic <- network_auto(my_data, uva="diagnostic")
# # Authorize justified representative removal
# reduced <- network_auto(my_data, uva="removed")

## -----------------------------------------------------------------------------
# # Diagnostic run, not publication-level precision:
# quick <- PsychoMatic::network_auto(my_data, items=1:12, group="sex", n_boot=20,
#   n_perm=19, consensus_iter=10, seed=2026, verbose=TRUE)
# quick$results$stages
# quick$errors
# quick$decision_log
# quick$results$invariance$families
# # Review optional failed stages before interpreting a partial workflow.

