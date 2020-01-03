# Race.destroy_all
# Venue.destroy_all
# Team.destroy_all
# Driver.destroy_all
# Result.destroy_all
# User.destroy_all
# Review.destroy_all

ergast_text = RestClient.get("http://ergast.com/api/f1/current/results.json?limit=420") #info for the whole current season
ergast_info = JSON.parse(ergast_text)

all_rounds_info = ergast_info["MRData"]["RaceTable"]["Races"]

all_rounds_info.each do |round|
    
    venue = Venue.create(trackname: round["Circuit"]["circuitName"], country: round["Circuit"]["Location"]["country"], city: round["Circuit"]["Location"]["locality"])

    race = Race.find_or_create_by(venue_id: venue.id, name: round["raceName"], round: round["round"].to_i, date: round["date"], time: round["time"])
    
    round["Results"].each do |result|
        team = Team.find_or_create_by(name: result["Constructor"]["name"], nationality: result["Constructor"]["nationality"])
        
        driver = Driver.find_or_create_by(
            firstname: result["Driver"]["givenName"], 
            lastname: result["Driver"]["familyName"], 
            abbr: result["Driver"]["code"], 
            car_number: result["Driver"]["permanentNumber"].to_i, 
            dob: result["Driver"]["dateOfBirth"], 
            nationality: result["Driver"]["nationality"], 
            team_id: team.id
        )
            
        # binding.pry

        race_time_value = result["Time"]["time"] if result.has_key?("Time")

        if result.has_key?("FastestLap")
            fastest_lap_time_value = result["FastestLap"]["Time"]["time"]
            fastest_lap_value = result["FastestLap"]["lap"] 
            fastest_lap_rank_value = result["FastestLap"]["rank"].to_i
            avg_speed_value = result["FastestLap"]["AverageSpeed"]["speed"].to_f
        end

        Result.create(
            driver_id: driver.id,
            race_id: race.id,
            grid: result["grid"].to_i,
            place: result["position"].to_i,
            status: result["status"],
            laps: result["laps"].to_i,
            race_time: race_time_value,
            fastest_lap_time: fastest_lap_time_value,
            fastest_lap: fastest_lap_value,
            fastest_lap_rank: fastest_lap_rank_value,
            avg_speed: avg_speed_value
        )
    end
end

50.times do
    user = User.create(
        username: Faker::Pokemon.name.delete("\s"), 
        email: Faker::Pokemon.unique.location.delete("\s"), 
        password: Faker::FunnyName.unique.two_word_name.delete("\s")
    )
    3.times do
        Review.create(
            user_id: user.id,
            race_id: Race.all.sample.id,
            content: Faker::Lorem.paragraph,
            rating: (1..10).to_a.sample
        )
    end
end
        
        
##### PREVIOUS IMPLEMENTATIONS #####
### V2
### TEAMS & DRIVERS DATA 
# drivers_teams_text = RestClient.get("http://ergast.com/api/f1/current/driverStandings.json")
# drivers_teams_info = JSON.parse(drivers_teams_text)


# drivers_teams_info["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"].each do |x|

#     team = Team.find_or_create_by(name: x["Constructors"][0]["name"], nationality: x["Constructors"][0]["nationality"])

#     Driver.create(firstname: x["Driver"]["givenName"], lastname: x["Driver"]["familyName"], nationality: x["Driver"]["nationality"], team_id: team.id)
# end

### V1

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