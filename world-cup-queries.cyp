//find all stadiums that germany ever played in

MATCH (stadium:Stadium)<-[:PLAYED_IN_STADIUM]-(m)-[:HOME_TEAM|AWAY_TEAM] ->(Country)
WHERE Country.name="Germany"
return stadium, Country.name, Count(*)
order by Count(*) DESC


// find average size of squad per team per year 

MATCH (player:Player) - [:IN_SQUAD]- (squad:Squad) - [:FOR_WORLD_CUP] -(wc) - [:IN_YEAR] - (year:Year),
(country:Country)-[:NAMED_SQUAD]->(squad)
with squad, wc, country, year, count(*) as count_player

return year, avg(count_player)
order by year.year DESC
limit 30
