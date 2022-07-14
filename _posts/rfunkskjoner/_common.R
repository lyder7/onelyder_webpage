set.seed(1014)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  # cache = TRUE,
  fig.retina = 2,
  fig.width = 6,
  fig.asp = 2/3,
  fig.show = "hold"
)

options(dplyr.print_min = 6, dplyr.print_max = 6)

# Activate crayon output
options(
  #crayon.enabled = TRUE,
  pillar.bold = TRUE,
  stringr.html = FALSE
)

ggplot2::theme_set(ggplot2::theme_gray(12))

status <- function(type) {
  status <- switch(type,
                   polishing = "should be readable but is currently undergoing final polishing",
                   restructuring = "is undergoing heavy restructuring and may be confusing or incomplete",
                   drafting = "*Under arbeid*. Denne versjonen er ufullstendig og er fortsatt under utvikling. Kan potensielt inneha feil. Anbefaler på nåværende tidspunkt anbefaler vi ikke å referere til innholdet i dokumentet.",
                   complete = "is largely complete and just needs final proof reading",
                   stop("Invalid `type`", call. = FALSE)
  )
  
  cat(paste0(
    "::: status\n",
    "**Status** ",
    "**Varsling**: ", status, ". ",
    "<https://github.com/lyder7>.\n",
    ":::\n"
  ))
}

