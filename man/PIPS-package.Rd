\name{PIPS-package}
\alias{PIPS-package}
\alias{PIPS}
\docType{package}
\title{
Generate Predicted Interval Plots
}
\description{
Generate Predicted Interval Plots.  Simulate and plot confidence intervals of 
  an effect estimate given observed data and a hypothesis about the 
  distribution of future data.
}
\details{
\tabular{ll}{
Package:  \tab PIPS\cr
Type:     \tab Package\cr
Version:  \tab 1.0\cr
Date:     \tab 2012-02-01\cr
License:  \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
}

\author{
Daniel G. Muenz, Ray Griner, Huichao Chen, Lijuan Deng, Sachiko Miyahara, and Scott R. Evans \email{evans@sdac.harvard.edu}, 
with contributions from Lingling Li, Hajime Uno, and Laura M. Smeaton.

LL, HU, and SRE contributed code that created predicted interval plots (PIPS) for time to event analyses. LMS provided enhancements for time-to-event 
  outcomes. (Time-to-event outcomes are not yet supported by the package, but these programs aided our design.)  HC wrote code for binary outcomes. 
  LD and SM wrote for normal outcomes.  DGM consolidated, modularized, and improved these contributions. RG finished the modularization and tested.
  SRE provided statistical concepts/methodology.

Affiliations:

DGM, RG, HC, LD, SM, LS, SRE: Center for Biostatistics in AIDS Research, Harvard School of Public Health, Boston, MA

HC, SM, HU, SRE: Department of Biostatistics, Harvard School of Public Health, Boston, MA 

LL: Harvard Pilgrim Health Care Institute, Boston, MA

HU: Dana Farber Cancer Institute, Boston, MA

Maintainer: Ray Griner \email{rgriner@sdac.harvard.edu}
}

\references{
Evans SR, Li L, Wei LJ, "Data Monitoring in Clinical Trials Using Prediction", 
  \emph{Drug Information Journal}, 41:733-742, 2007.

Li L, Evans SR, Uno H, Wei LJ. "Predicted Interval Plots: A Graphical Tool for Data Monitoring in Clinical Trials", 
  \emph{Statistics in Biopharmaceutical Research}, 1:4:348-355, 2009.
}

\note{
The work was supported by National Institute of Health (NIH) grants including the Neurologic AIDS Research Consortium grant NS32228 from NINDS, the Statistical and Data Management Center of the Adult AIDS Clinical Trials Group grant 1 U01 068634 from NIAID, the Statistical Methods for HIV/AIDS Studies 2 R01 AI052817-04 from NIAID, and the Statistical and Data Management Center of the International Maternal Pediatric and Adolescent AIDS Clinical Trials Group grant U01 AI068616 from NIAID.
}

\keyword{ package }
\seealso{ 
\code{\link{pred.int}}

\code{\link{plot.pred.int}}

\code{\link{print.pred.int}}
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
