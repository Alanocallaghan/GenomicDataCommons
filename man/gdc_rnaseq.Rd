% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gdc_rnaseq.R
\name{available_rnaseq_workflows}
\alias{available_rnaseq_workflows}
\alias{gdc_rnaseq}
\title{Get RNA-seq quantification from the NCI GDC.}
\usage{
available_rnaseq_workflows()

gdc_rnaseq(project_id, workflow_type)
}
\arguments{
\item{project_id}{character() vector with one or more project ids. Available 
project_ids can be found using \code{ids(projects())}. Note that 
not all projects contain RNA-seq data.}

\item{workflow_type}{character(1) with the workflow type. Possible values
can be accessed using \code{available_rnaseq_workflows}}
}
\value{
a \code{SummarizedExperiment} object, populated with the expression
    values, the gene ids in the \code{rowData}, and the clinical data associated 
    with each sample in the \code{colData}.
}
\description{
\code{gdc_rnaseq} is a high-level function for accessing the NCI GDC 
RNA-seq data and summarizing as a
\code{\link[SummarizedExperiment]{SummarizedExperiment}}.
}
\details{
The RNA-seq data are downloaded using \code{\link{gdcdata}} 
    with caching used as available. The resulting files are read and combined
    without any transformation. It us up to the user to perform further 
    normalization or transformation if needed.
    
    Clinical information for each file (see \code{\link{gdc_clinical}} for 
    details) is loaded into the \code{colData} slot. Quality control mapping 
    information is also stored in the \code{colData} with column names beginning
    with "qc__".
}
\section{Functions}{
\itemize{
\item \code{available_rnaseq_workflows}: Show possible RNA-seq workflow types
}}

\examples{
available_rnaseq_workflows()

\dontrun{
tcga_se = gdc_rnaseq('TCGA-ACC', 'HTSeq - Counts')
tcga_se
}

}
\references{
See \url{https://docs.gdc.cancer.gov/Data/Bioinformatics_Pipelines/Expression_mRNA_Pipeline/} 
    for details of data processing that occurs at the GDC.
}
