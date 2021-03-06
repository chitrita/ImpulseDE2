% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/srcImpulseDE2_fitImpulse.R
\name{fitModels}
\alias{fitModels}
\title{Fits impulse and constant models to a timecourse dataset}
\usage{
fitModels(objectImpulseDE2, vecConfounders, boolCaseCtrl)
}
\arguments{
\item{objectImpulseDE2}{(object class ImpulseDE2Object)
Object to be fit.}

\item{vecConfounders}{(vector of strings number of confounding variables)
Factors to correct for during batch correction.
Names refer to columns in dfAnnotation.}

\item{boolCaseCtrl}{(bool) 
Whether to perform case-control analysis. Does case-only
analysis if FALSE.}
}
\value{
objectImpulseDE2 (object class ImpulseDE2Object)
Object with sigmoidal fit added: objectImpulseDE2@lsModelFits
is updated to:
lsModelFits (list length number of conditions fit (1 or 3) +1)
\{'case'\} or \{'case', 'control', 'combined'\}
One model fitting object for each condition:
In case-only DE analysis, only the condition \{'case'\} is fit.
In case-control DE analysis, the conditions 
\{'case', 'control','combined\} are fit.
Each condition entry is a list of model fits for each gene.
Each gene entry is a list of model fits to the individual models:
Impulse model and constant model (if boolFitConst is TRUE).
At this level, the sigmoid model fit can be added later.
Each model fit per gene is a list of fitting parameters and results.
\itemize{
\item IdxGroups (list length number of conditions)
Samples grouped by time points and by batches and time point vectors. 
Sample groups are stored in the form of index vectors in which
samples of the same time point or batch have the same index.
\itemize{
\item Condition ID (list length 5)
List of index vectors and time points.
One entry of this format for each condition.
\itemize{
\item vecTimepointsUnique (numeric vector length number of unique
timepoints) Vector of unique time coordinates observed in this condition.
\item vecidxTimepoint (idx vector length number of samples)
Index of the time coordinates of each sample (reference is
vecTimepointsUnique).
\item lsvecBatchUnique (list number of confounders)
List of string vectors. One vector per confounder: vector of unique batches
in this confounder.
\item lsvecidxBatches (idx list length number of confounding variables)
List of index vectors. 
One vector per confounding variable.
Each vector has one entry per sample with the index of the batch ID
within the given confounding variable of the given sample. Reference
is the list of unique batch ids for each confounding variable.
  \item vecSamples (vector number of samples) Names of samples fit
for this condition in same order as index vectors above.
}
}
\item Condition ID (list length number of genes)
List of fits for each gene to the samples of this condition.
One entry of this format for all conditions fit.
\itemize{
\item Gene ID (list length 2)
Impulse and constant model fit to gene observations.
One entry of this format for all gene IDs.
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
}
}
\description{
[Model fitting function hierarchy: 1 out of 4]
This primary wrapper coordinates fitting of impulse and constant model
to separate conditions according to the differential expression
mode (case-only or case-control).
}
\seealso{
Calls \link{fitConstImpulse}
once for each condition with the appropriate parameters and samples.
}
\author{
David Sebastian Fischer
}
