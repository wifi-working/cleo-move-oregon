##install packages
install.packages("dplyr")

##load packages
library(dplyr)


##create the datasource(s)
key_dates_data <- data.frame(key_dates = c("2012-07-23", "2013-01-23", "2022-09-23")
    , location = c("Unknown", "California", "Oregon")
    , description = c("Born", "Adopted", "Moved")
)


daily_schedule_data <- data.frame(hour = 0:23)
daily_schedule_data <- daily_schedule_data %>% mutate(crying = if_else(hour %in% c(0,5,6,7,8,9,23), "Definitely", 
    if_else(hour %in% c(1,2,3,4,22), "Potentially","Nope")))
daily_schedule_data <- daily_schedule_data %>% mutate(mar_sleeping = if_else(hour %in% c(0:8), "Y", "N"))
daily_schedule_data <- daily_schedule_data %>% mutate(cleo_sleeping = if_else(hour %in% c(10:17), "Y", "N"))


daily_schedule_data <- daily_schedule_data %>% slice(rep(1:n(), 13))
daily_schedule_data <- daily_schedule_data %>% group_by(hour) %>% mutate(day = 1:n())
# head(daily_schedule_data)
# tail(daily_schedule_data)