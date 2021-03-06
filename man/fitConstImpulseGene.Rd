% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/srcImpulseDE2_fitImpulse.R
\name{fitConstImpulseGene}
\alias{fitConstImpulseGene}
\title{Fit an impulse and constant model to a single gene}
\usage{
fitConstImpulseGene(vecCounts, scaDisp, vecSizeFactors, vecTimepointsUnique,
  vecidxTimepoint, lsvecidxBatch, boolFitConst, MAXIT = 1000)
}
\arguments{
\item{vecCounts}{(numeric vector number of samples)
Read count data.}

\item{scaDisp}{(scalar) Gene-wise 
negative binomial dispersion hyper-parameter.}

\item{vecSizeFactors}{(numeric vector number of samples) 
Model scaling factors for each sample which take
sequencing depth into account (size factors).}

\item{vecTimepointsUnique}{(numeric vector length number of unique
timepoints) Vector of unique time coordinates observed in this condition.}

\item{vecidxTimepoint}{(numeric vector length number of samples)
Index of the time coordinates of each sample (reference is
vecTimepointsUnique).}

\item{lsvecidxBatch}{(idx list length number of confounding variables)
List of vectors. 
One vector per confounding variable.
Each vector has one entry per sample with the index of the batch ID
within the given confounding variable of the given sample. Reference
is the list of unique batch ids for each confounding variable.}

\item{boolFitConst}{(bool) Whether to fit a constant model.}

\item{MAXIT}{(scalar) [Default 1000] 
Maximum number of BFGS iterations for model fitting with \link{optim}.}
}
\value{
(list length 2)
Impulse and constant model fit to gene observations.
\itemize{
\item lsImpulseFit (list) List of impulse fit parameters and results.
\itemize{
\item vecImpulseParam (numeric vector length 6)
\{beta, h0, h1, h2, t1, t2\}
Maximum likelihood estimators of impulse model parameters.
\item vecImpulseValue (numeric vector length number of time points)
Values of impulse model fit at time points used for fit.
\item lsvecBatchFactors (list length number of confounders)
List of vectors of scalar batch correction factors for each sample.
These are also maximum likelihood estimators.
NULL if no confounders given.
\item scaDispParam (scalar) Dispersion parameter estimate
used in fitting (hyper-parameter).
\item scaLL (scalar) Loglikelihood of data under maximum likelihood
estimator model.
\item scaConvergence (scalar) 
Convergence status of optim on impulse model.
}
\item lsConstFit (list) List of constant fit parameters and results.
\itemize{
\item scaMu (scalar) Maximum likelihood estimator of
negative binomial mean parameter.
\item lsvecBatchFactors (list length number of confounders)
List of vectors of scalar batch correction factors for each sample.
These are also maximum likelihood estimators.
NULL if no confounders given.
\item scaDispParam (scalar) Dispersion parameter estimate
used in fitting (hyper-parameter).
\item scaLL (scalar) Loglikelihood of data under maximum likelihood
estimator model.
\item scaConvergence (scalar) 
Convergence status of optim on constant model.
}
}
}
\description{
[Model fitting function hierarchy: 3 out of 4]
This tertiary fitting wrapper calls the optimisation wrappers
for the individual fitting operations to be performed on the 
observations of this gene.
Structure of this function:
\itemize{
\item Fit impulse model
\itemize{
\item Initialise impulse model parameters (peak and valley)
\item Fit impulse model (peak initialisation)
\item Fit impulse model (valley initialisation)
}
\item Select best impulse model fit from initialisations,
\item Fit constant model (if constant model is to be fit).
}
}
\seealso{
Called by \link{fitConstImpulseGene} to fit constant and impulse
model to samples of one condition and one gene.
Calls impulse parameter initialisation function
\link{estimateImpulseParam} and 
optimisation wrappers 
\link{fitImpulseModel} and \link{fitConstModel}.
}
\author{
David Sebastian Fischer
}
