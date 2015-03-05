source("./downloadData.R")
require(dplyr)
require(ggplot2)
## Graph 1: Cost of players by team
# Gives a view of player cost variation 
# and which teams have highest rated players (when cost is used as proxy)

ap <- tbl_df(allplayerdata)

ggplot(ap,aes(x=team_name,y=now_cost)) + geom_point()

## Graph 2: Average values for players from a team
# Provides a view of most expensive teams 
# (Cost also provides a proxy view of team quality)

ggplot(ap,aes(x=team_name,y=now_cost)) + 
    stat_summary(fun.y="mean", geom="point")

## Graph 3: Count of players in a team
ggplot(ap,aes(x=factor(team_name))) + geom_bar()

## 3.b Frequency
ggplot(ap,aes(x=factor(team_name))) + 
    geom_bar(aes(y=(..count../sum(..count..))))

## 4: Team total cost
require(dplyr)

team_details <- ap %>%
                    group_by(team_name) %>%
                    summarise(totcost = sum(now_cost), 
                                numplayers=n_distinct(id), 
                                avgcost = round(mean(now_cost),2),
                                maxcost = max(now_cost),
                                mincost = min(now_cost))

# Player cost variation in relation to overall average across league
team_details <- team_details %>%
                    mutate(costvar = (totcost - mean(totcost)))

# 4.a: Teams arranged by cost of players

ggplot(team_details,aes(x=reorder(team_name,totcost),y=totcost)) + 
    geom_bar(stat="identity",color="black") + coord_flip()

ggplot(team_details,aes(x=reorder(team_name,totcost),y=totcost,fill=totcost)) + 
    geom_bar(stat="identity",color="black") + coord_flip()

ggplot(team_details,aes(x=reorder(team_name,avgcost),y=avgcost,fill=avgcost)) + 
    geom_bar(stat="identity",color="black") + coord_flip()

ggplot(team_details,aes(x=reorder(team_name,maxcost),y=maxcost,fill=maxcost)) + 
    geom_bar(stat="identity",color="black") + coord_flip()

ggplot(team_details,aes(x=reorder(team_name,mincost),y=mincost,fill=mincost)) + 
    geom_bar(stat="identity",color="black") + coord_flip()

ggplot(team_details,aes(x=team_name,,y=costvar,fill=costvar)) + 
    geom_bar(stat="identity", position="identity")

ggplot(team_details,aes(x=reorder(team_name,costvar),y=costvar,fill=costvar)) + 
    geom_bar(stat="identity", position="identity") + coord_flip()

## Cost variation spread over x axis positive and negative
ggplot(team_details,aes(x=reorder(team_name,costvar),y=costvar,fill=costvar)) + 
    geom_bar(stat="identity", position="identity") + coord_flip()

## Colors for positive / negative display

ggplot(team_details,aes(x=team_name,y=costvar,fill=costvar)) + 
    geom_bar(stat="identity", position="identity", color="black", size=0.25) + 
    scale_fill_gradient(low="darkblue",high="lightgreen")

