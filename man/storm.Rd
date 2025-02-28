% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mars_functions.R
\name{storm}
\alias{storm}
\alias{stormDepth_in}
\alias{stormDuration_hr}
\alias{stormPeakIntensity_inhr}
\alias{stormAvgIntensity_inhr}
\title{Return storm attributes}
\usage{
stormDepth_in(rainfall_in)

stormDuration_hr(dtime_edt)

stormPeakIntensity_inhr(dtime_edt, rainfall_in)

stormAvgIntensity_inhr(dtime_edt, rainfall_in)
}
\arguments{
\item{rainfall_in}{vector, num, rainfall depth in inches representing a single rain event}

\item{dtime_edt}{vector, POSIXct date times representing a single rain event}
}
\value{
\describe{
       \item{\code{stormDepth_in}}{Output will be total rainfall depth for the event, in inches.}
}

\describe{
       \item{\code{stormDuration_hr}}{Output will be a double with the duration of the event, in hours.}
}

\describe{
       \item{\code{stormPeakIntensity_inhr}}{Output will be a number representing the event's peak intensity in inches/hour.}
}

\describe{
       \item{\code{stormAvgIntensity_inhr}}{Output will be a number representing the event's average intensity in inches/hour.}
}
}
\description{
Return storm depth, duration, average intensity, and peak intensity of an event processed using \code{\link{detectEvents}}.
}
\examples{
rain_newevents <- marsSampleRain \%>\%  #use dplyr pipe to update dataframe
 group_by(gage_uid) \%>\% 
  arrange(dtime_edt) \%>\% 
  mutate(event_id = detectEvents(dtime_edt, rainfall_in)) \%>\%
  group_by(gage_uid, event_id) \%>\%
  summarize(eventdatastart_edt = first(dtime_edt),
            eventdataend_edt = last(dtime_edt),
            eventduration_hr = stormDuration_hr(dtime_edt),
            eventpeakintensity_inhr = stormPeakIntensity_inhr(dtime_edt, rainfall_in),
            eventavgintensity_inhr = stormAvgIntensity_inhr(dtime_edt, rainfall_in),
            eventdepth_in = stormDepth_in(rainfall_in)) \%>\%
}
\seealso{
\code{\link[dplyr]{group_by}}, \code{\link[dplyr]{arrange}},
 \code{\link[dplyr]{mutate}}, \code{\link[dplyr]{filter}}, \code{\link[dplyr]{summarize}},
 \code{\link[dplyr]{select}}
}
