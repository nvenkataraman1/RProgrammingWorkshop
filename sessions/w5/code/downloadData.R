require(jsonlite)
require(dplyr)

url <- "http://fantasy.premierleague.com/web/api/elements/"

nonRelevantFields <- c("event_explain","photo","fixture_history","season_history","fixtures")

relevantFields <- c("points_per_game","total_points","type_name",
                    "team_name","team_code","team_id",
                    "id","status","first_name","second_name",
                    "now_cost","value_form","team",
                    "ep_next","minutes","goals_scored",
                    "assists","clean_sheets","goals_conceded",
                    "own_goals","penalties_saved","penalties_missed",
                    "yellow_cards","red_cards","saves",
                    "bonus","bps","ea_index",
                    "value_form","value_season","selected_by")

numCols = length(relevantFields)

# Initializing an empty dataframe
allplayerdata <- data.frame(matrix(NA,nrow=1,ncol=numCols))
allplayerdata <- allplayerdata[-1,]

for (i in 1:567) {
    res <- try(jsondata <- fromJSON(paste0(url,i)))
    if(!inherits(res, "try-error")) {
        
        jsondata <- jsondata[which(names(jsondata) %in% relevantFields)]
        
        if(i == 1) names(allplayerdata) <- names(jsondata)
        
        allplayerdata <- rbind(allplayerdata, as.data.frame(jsondata))
    }
    else {
        # continue with next loop iteration on error
        
    }
}