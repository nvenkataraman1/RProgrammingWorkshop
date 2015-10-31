library(jsonlite)
nobel <- data.frame(fromJSON("http://api.nobelprize.org/v1/laureate.json"))
View(nobel)

library(dplyr)

## count of countries by name

nobel %>%
    group_by(laureates.bornCountry) %>%
    summarize(count = n()) %>%
    arrange(desc(count))

## count by country code (more accurate)
nobel %>%
    group_by(laureates.bornCountryCode) %>%
    summarize(count = n()) %>%
    arrange(desc(count))

## filtering and selection

nobel %>%
    filter(laureates.bornCountryCode == "DE") %>%
    select(laureates.bornCountry, laureates.bornCountryCode)
