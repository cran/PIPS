\name{print.pred.int}
\alias{print.pred.int}
\title{
Print objects of class \code{pred.int} for predicted interval plots
}
\description{
Print objects of class \code{pred.int} for predicted interval plots
}
\usage{
\method{print}{pred.int}(x, pi.count = 8, 
     digits = max(3, getOption("digits") - 3), ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Object of class \code{pred.int} to print
}
  \item{pi.count}{
Number of predicted intervals to print.  Default is 8.
}
  \item{digits}{
Number of digits to print.  Default is max(3, getOption("digits")-3)
}
  \item{\dots}{
Additional arguments to pass to print.default
}
}
\value{
Returns a copy of the object passed
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

\seealso{
\code{\link{PIPS}}

\code{\link{pred.int}}

\code{\link{plot.pred.int}}
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
}

