% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/srcImpulseDE2_CostFunctionsFit.R
\name{evalLogLikImpulse_comp}
\alias{evalLogLikImpulse_comp}
\title{Compiled function: evalLogLikImpulse}
\usage{
evalLogLikImpulse_comp(vecTheta, vecCounts, scaDisp, vecSizeFactors,
  vecTimepointsUnique, vecidxTimepoint, lsvecidxBatch, vecboolObserved)
}
\arguments{
\item{vecTheta}{(numeric vector number of parameters to be estimated) 
Impulse model parameter and batch correction factor estimates.}

\item{vecCounts}{(numeric vector number of samples)
Read count data.}

\item{scaDisp}{(scalar) Gene-wise 
negative binomial dispersion hyper-parameter.}

\item{vecSizeFactors}{(numeric vector number of samples) 
Model scaling factors for each sample which take
sequencing depth into account (size factors).}

\item{vecTimepointsUnique}{(numeric vector length number of unique time points)
Unique time points of set of time points of given samples.}

\item{vecidxTimepoint}{(index vector length number of samples)
Index of of time point assigned to each sample in vector
vecTimepointsUnique.}

\item{lsvecidxBatch}{(list length number of confounding variables)
List of index vectors. 
One vector per confounding variable.
Each vector has one entry per sample with the index batch
within the given confounding variable of the given sample.
Batches are enumerated from 1 to number of batches.}

\item{vecboolObserved}{(bool vector number of samples)
Whether sample is observed (finite and not NA).}
}
\value{
scaLogLik (scalar) Value of cost function 
(loglikelihood) for given gene.
}
\description{
Pre-compile heavily used functions.
Refer to \link{evalLogLikImpulse}.
}
\author{
David Sebastian Fischer
}
