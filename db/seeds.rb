### TEAMS & DRIVERS DATA 
drivers_teams_text = RestClient.get("http://ergast.com/api/f1/current/driverStandings.json")
drivers_teams_info = JSON.parse(drivers_teams_text)


drivers_teams_info["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"].each do |x|

    team = Team.find_or_create_by(name: x["Constructors"][0]["name"], nationality: x["Constructors"][0]["nationality"])

    Driver.create(firstname: x["Driver"]["givenName"], lastname: x["Driver"]["familyName"], nationality: x["Driver"]["nationality"], team_id: team.id)
end




# #get text from API
# teams_info_text = RestClient.get("http://ergast.com/api/f1/current/constructors.json")
# #parse the text to json format
# teams_info = JSON.parse(teams_info_text)
# #dive into the nested data in the JSON to get team names
# team_names = teams_info["MRData"]["ConstructorTable"]["Constructors"].map {|x| x["name"]}
# #go through each of the names and create an instance of Team with attribute name set as each of the elements in the array team_names
# team_names.each {|tn| Team.create(name: tn)}

# #how to add data to already created instances
# team_nationalities = teams_info["MRData"]["ConstructorTable"]["Constructors"].map {|x| x["nationality"]}
# # team_nationalities.each {|tn| Team.all.find(tn.index).country = tn}
# team_nationalities.count.times do |i|
#     Team.update(i+1, nationality: team_nationalities[i])
# end

# ### DRIVER DATA
# drivers_info_text = RestClient.get("http://ergast.com/api/f1/current/drivers.json")
# drivers_info = JSON.parse(drivers_info_text)

# drivers_info["MRData"]["DriverTable"]["Drivers"].each do |x|
#     binding.pry
#     i = 0
#     Driver.create(firstname: x["givenName"], lastname: x["familyName"], nationality: x["nationality"], )
#     i += 1
# end