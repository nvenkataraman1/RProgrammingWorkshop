library(lubridate)
library(jsonlite)

nobel <- data.frame(fromJSON("http://api.nobelprize.org/v1/laureate.json"))

birth_dates <- ymd(nobel$laureates.born)

str(birth_dates)

year(birth_dates[1])
month(birth_dates[1])
day(birth_dates[1])

wday(birth_dates[1])

weekdays(birth_dates[1], abbreviate = F) ## base R

nobel <- data.frame(nobel, 
                    year_birth = year(birth_dates), 
                    month_birth = month(birth_dates),
                    date_birth = day(birth_dates),
                    wday_num = wday(birth_dates),
                    wday_text = weekdays(birth_dates))

View(nobel)
