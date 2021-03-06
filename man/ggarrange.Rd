% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggarrange.R
\name{ggarrange}
\alias{ggarrange}
\title{Arrange Multiple ggplots}
\usage{
ggarrange(..., plotlist = NULL, ncol = NULL, nrow = NULL, labels = NULL,
  align = c("none", "h", "v", "hv"), widths = 1, heights = 1,
  legend = NULL, common.legend = FALSE)
}
\arguments{
\item{...}{list of plots to be arranged into the grid. The plots can be
either ggplot2 plot objects or arbitrary gtables.}

\item{plotlist}{(optional) list of plots to display.}

\item{ncol}{(optional) number of columns in the plot grid.}

\item{nrow}{(optional) number of rows in the plot grid.}

\item{labels}{(optional) list of labels to be added to the plots. You can
also set labels="AUTO" to auto-generate upper-case labels or labels="auto"
to auto-generate lower-case labels.}

\item{align}{(optional) Specifies whether graphs in the grid should be horizontally ("h") or
vertically ("v") aligned. Options are "none" (default), "hv" (align in both directions), "h", and "v".}

\item{widths}{(optional) numerical vector of relative columns widths. For
example, in a two-column grid, widths = c(2, 1) would make the first column
twice as wide as the second column.}

\item{heights}{same as \code{widths} but for column heights.}

\item{legend}{character specifying legend position. Allowed values are one of
c("top", "bottom", "left", "right", "none"). To remove the legend use
legend = "none".}

\item{common.legend}{logical value. Default is FALSE. If TRUE, a common
unique legend will be created for arranged plots.}
}
\value{
return an object of class \code{ggarrange}, which is a ggplot or a
  list of ggplot.
}
\description{
Arrange multiple ggplots on the same page. Wrapper around
  \code{\link[cowplot]{plot_grid}()}. Can arrange multiple ggplots over
  multiple pages, compared to the standard
  \code{\link[cowplot]{plot_grid}()}. Can also create a common unique legend
  for multiple plots.
}
\examples{
data("ToothGrowth")
df <- ToothGrowth
df$dose <- as.factor(df$dose)

# Create some plots
# ::::::::::::::::::::::::::::::::::::::::::::::::::
# Box plot
bxp <- ggboxplot(df, x = "dose", y = "len",
    color = "dose", palette = "jco")
# Dot plot
dp <- ggdotplot(df, x = "dose", y = "len",
    color = "dose", palette = "jco")
# Density plot
dens <- ggdensity(df, x = "len", fill = "dose", palette = "jco")

# Arrange
# ::::::::::::::::::::::::::::::::::::::::::::::::::
ggarrange(bxp, dp, dens, ncol = 2, nrow = 2)
# Use a common legend for multiple plots
ggarrange(bxp, dp,  common.legend = TRUE)


}
\seealso{
\code{\link{annotate_figure}()}
}
\author{
Alboukadel Kassambara \email{alboukadel.kassambara@gmail.com}
}
