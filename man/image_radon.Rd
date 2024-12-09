% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/radon.R
\name{image_radon}
\alias{image_radon}
\title{Radon Transform}
\usage{
image_radon(image, steps = 90, bg = "white", border = "black", progress = TRUE)
}
\arguments{
\item{image}{magick image object returned by \code{\link[magick:image_read]{image_read()}} or \code{\link[magick:image_graph]{image_graph()}}}

\item{steps}{number of steps around a half circle to rotate the image}

\item{bg}{color with which to replace the background of the image}

\item{border}{color to paint the rotated image outside the central circle}

\item{progress}{print some verbose status output}
}
\value{
Magick image object.
}
\description{
The Radon transform (sinogram) of an image.
}
\examples{
(im <- magick::image_extent(magick::rose, "46x46"))
image_radon(im, progress = FALSE)
}
