\name{plot.pred.int}
\alias{plot.pred.int}
\title{
Plot objects of class \code{pred.int} for predicted interval plots
}
\description{
Plot objects of class \code{pred.int} for predicted interval plots
}
\usage{
\method{plot}{pred.int}(x, conf.int = TRUE, vline = NA, which = NULL, axes = TRUE, 
    pi.col.fun=NULL, ci.col=2, main, xlab, ylab, xlim, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Object of class \code{pred.int} containing the PIPs data for plotting
}
  \item{conf.int}{
Print confidence interval for observed data?  TRUE (default)/FALSE
}
  \item{vline}{
Vector of x-values for vertical lines to print on the graph. These may
  represent superiority/inferiority bounds or other x-values of interest
}
  \item{which}{
Only create graphs for some of the comparisons
}
  \item{axes}{
TRUE/FALSE. Print axes on graph?  Default is TRUE.  Probably
  you should only suppress axes now if you will add them later (for example 
  if you don't like the default axes)
}
  \item{pi.col.fun}{
An optional one parameter function that takes a number between
 0 and 100 and returns a color.  This can be used to color the predicted 
 intervals different colors.  The input argument is the position of the
 interval on the vertical axis of the graph.  Default coloring is three 
 shades of gray: Percentiles (0-10) and (90-100) are light gray, 
 (10-25) and (75-90) are darker, and (25-75) is darkest
}
  \item{ci.col}{
Color for effect estimate and confidence interval for the observed 
data.  Default is 2 (second color in palette).
}
  \item{main}{
Main title of graph.  If blank, a default will be used.  Can be either
    a single title or a vector of titles.  If a vector, the first will be used
    for the first graph, the second for the second graph, etc...  If any title
    contains the string "#BY#", this will be replaced with the name of the
    comparison (i.e. "B vs A")
}
  \item{xlab}{
Label on xaxis.  If blank, a default will be used.
}
  \item{ylab}{
Label on xaxis.  If blank, a default will be used.
}
  \item{xlim}{
Limits of xaxis (as vector of length 2).  Default is large enough to 
 contain the predicted intervals and confidence interval.  Limits narrower than
 the defaults will be ignored.
}
  \item{\dots}{
Other options will be passed through to the plot.default function. 
}
}

\value{
No return value.  Called for its side effect.
}
\references{
Evans SR, Li L, Wei LJ, "Data Monitoring in Clinical Trials Using Prediction", \emph{Drug Information Journal}, 41:733-742, 2007.

Li L, Evans SR, Uno H, Wei LJ. "Predicted Interval Plots: A Graphical Tool for Data Monitoring in Clinical Trials", 
  \emph{Statistics in Biopharmaceutical Research}, 1:4:348-355, 2009.
}

\author{
Daniel G. Muenz, Ray Griner \email{rgriner@sdac.harvard.edu}, Huichao Chen, Lijuan Deng, Sachiko Miyahara, and Scott R. Evans \email{evans@sdac.harvard.edu}, 
with contributions from Lingling Li, Hajime Uno, and Laura M. Smeaton.

See package documentation for affiliations and contributions.
}

\examples{
# Make some fake data
myY<-c(rep(1,times=20),rep(0,times=80),rep(1,times=25),rep(0,times=25))
myGroup<-c(rep('A',100),rep('B',50))

# Run the programs
pips <- pred.int(y=myY, group=myGroup, N=c(200,100), 
                 data.type="binary", iters=100)
print(pips)
plot(pips)

# Run demo(package="PIPS") for more examples.
}

\seealso{
\code{\link{PIPS}}

\code{\link{pred.int}}

\code{\link{print.pred.int}}
}
