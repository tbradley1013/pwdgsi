% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mars_functions.R
\name{hyetograph}
\alias{hyetograph}
\title{Plot hyetograph}
\usage{
hyetograph(dtime_edt, rainfall_in, raingage, event)
}
\arguments{
\item{rainfall_in}{vector, num, rainfall in inches for that rain event}

\item{raingage}{chr, Label for the hyetograph for what rain gage the data came from}

\item{event}{chr, label for the hyetograph for what rain gage the data came from}

\item{dtime_edit}{vector, POSIXct datetimes representing a single rain event}
}
\value{
Output will be a ggplot2 object of the hyetograph. Currently,
   the graphical parameters are hard coded and the legend is deleted.
   This may change in future versions.
}
\description{
Return hyetograph of events processed by \code{\link{detectEvents}}
}
\examples{
gage_temp <- mutate(marsSampleRain, 
  event_id = detectEvents(dtime_edt = marsSampleRain$dtime_edt, 
  rainfall_in = marsSampleRain$rainfall_in, 
  iet_hr = 6, mindepth_in = 0.10)) \%>\% filter(event_id == 2)
  
hyetograph(dtime_edt = gage_temp$dtime_edt, 
  rainfall_in = gage_temp$rainfall_in, raingage = 2, event = 2)   
}
\seealso{
\code{\link[dplyr]{mutate}}, \code{\link[dplyr]{filter}}
}
