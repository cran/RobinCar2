## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(RobinCar2)
head(dummy_data)

## -----------------------------------------------------------------------------
robin_lm(y ~ treatment * s1 + covar,
  data = dummy_data,
  treatment = treatment ~ pb(s1)
)

## -----------------------------------------------------------------------------
robin_lm(y ~ treatment + s1 + covar,
  data = dummy_data,
  treatment = treatment ~ pb(s1),
  vcov = "vcovHC"
)

## -----------------------------------------------------------------------------
robin_glm(y_b ~ treatment * s1 + covar,
  data = dummy_data,
  treatment = treatment ~ pb(s1),
  family = binomial(link = "logit")
)

## -----------------------------------------------------------------------------
dummy_data$y_count <- rpois(nrow(dummy_data), lambda = 20)
robin_glm(
  y_count ~ treatment * s1 + covar,
  data = dummy_data,
  treatment = treatment ~ pb(s1),
  family = MASS::negative.binomial(theta = 1)
)

## -----------------------------------------------------------------------------
robin_glm(y_b ~ treatment * s1 + covar,
  data = dummy_data,
  treatment = treatment ~ ps(s1),
  family = binomial(link = "logit")
)

