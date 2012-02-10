\name{pred.int}
\alias{pred.int}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generates predicted intervals for predicted interval plots
}
\description{
Generates predicted intervals of some effect estimate given observed data
 and a hypothesis about the distribution of future data.
}
\usage{
pred.int(y, group = NA, N, true.y = "observed", ref = NA, 
         data.type = c("t.test", "binary"), var.equal = FALSE, 
         conf.level = 0.95, iters = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{
a numeric vector of outcomes (with at least 2 elements and no missing values)
}
  \item{group}{
an optional vector of groups. If it exists, it must be the same length as 
   \code{y} with no missing values. If missing, all observations put in the 
   same group, and one-sample analyses are performed.  See 'Details' for 
   more information.
}
  \item{N}{
A required vector with length equal to the number of distinct groups.
   The ith element is what we want the number of observations to be for the ith 
   group after simulation.  (So if \code{y} is length 150 and only one group, then to 
   simulate 50 outcomes we pass \code{N}=200.)
}
  \item{true.y}{
Either {"observed","no.diff", or a vector of constants}.  Define mean/proportion used when simulating the data.
}
  \item{ref}{
An optional group name that will serve as the reference group.  Default is the first alphabetically.
}
  \item{data.type}{
A required field indicating the type of data/statistical test that should be performed to get 
   the effect estimate.  Either "t.test" or "binary"
}
  \item{var.equal}{
TRUE/FALSE whether to assume variance equal in t-test. Default is FALSE. This does not affect
 the variance used when simulating data.  Data is always simulated with the variance for
 the group, not the pooled variance 
}
  \item{conf.level}{
Confidence level for intervals (between 0 and 1).  Default is 0.95
}
  \item{iters}{
Number of predicted intervals to generate.  Default is 100
}
}

\details{
 The \code{pred.int} function takes a vector of observations (\code{y}) as well as (optionally)
  the group of each observation (\code{group}), and the total number of observations expected
  in each group (\code{N}) when all data is observed.  The function then calculates the 
  amount of data that needs to be simulated in each group, and simulates the outcome, which 
  is either binary or normal depending on the value of \code{data.type}.  

 When simulating data, the parameter \code{true.y} determines the mean/proportion of the population
  from which the simulated data will be drawn.  This is either the observed mean/proportion 
  (\code{true.y="observed"}), the pooled mean/proportion (\code{true.y="no.diff"}), or a vector of 
  constants (representing the mean/proportion in each group).  
 
  Selecting \code{data.type="t.test"} with more than one group generates confidence intervals 
  using a t.test either under the assumption of equal variance if \code{var.equal=TRUE} or 
  unequal variance if \code{var.equal=FALSE}. In the latter case the degrees of freedom are 
  corrected using Satterthwaite's approximation.

 Selecting \code{data.type="binary"} generates confidence intervals using a test for equality 
  of proportions (similar to that calculated in \code{prop.test}).  A continuity correction is 
  not applied.

 When there is more than one group, the program treats one group as the reference group
  and generates N-1 sets of predicted intervals (where N is the number of groups), where
  each group is compared to the reference group.  When all the observations are in the
  same group (or no group vector was provided) one-sample tests are performed.
}
\value{
An object of class \code{pred.int} is returned, which is a list of the following:
\item{obs.mean}{Observed mean for each group (vector with length = n(groups)}
\item{obs.n}{Observed n for each group}
\item{sim.n}{Number simulated for each group}
\item{ci}{
A list of vectors of length 3 that contain the point estimate, lower, and 
   upper confidence intervals for the observed effect.  There are n(groups)-1 
   elements in the list (one for each comparison/graph)
}
\item{pi}{
A list of matrices with 3 columns and \code{iters} rows.  The columns are the point 
  estimate and lower/upper confidence limit for each predicted interval.  There 
  are (n(groups)-1) matrices in the list (one for each comparison/graph).
}
\item{data.type}{Data type (passed from input parameter)}
\item{conf.level}{Confidence level (passed from input parameter)}
}

\references{
Evans SR, Li L, Wei LJ, "Data Monitoring in Clinical Trials Using Prediction", \emph{Drug Information Journal}, 41:733-742, 2007.

Li L, Evans SR, Uno H, Wei LJ. "Predicted Interval Plots: A Graphical Tool for Data Monitoring in Clinical Trials", 
   \emph{Statistics in Biopharmaceutical Research}, 1:4:348-355, 2009.
}

\author{
Daniel G. Muenz, Ray Griner \email{rgriner@sdac.harvad.edu}, Huichao Chen, Lijuan Deng, Sachiko Miyahara, and Scott R. Evans \email{evans@sdac.harvard.edu}, 
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
}

\seealso{
\code{\link{PIPS}}

\code{\link{plot.pred.int}}

\code{\link{print.pred.int}}
}

