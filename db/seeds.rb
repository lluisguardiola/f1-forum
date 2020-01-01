#get text from API
teams_info_text = RestClient.get("http://ergast.com/api/f1/current/constructors.json")
#parse the text to json format
teams_info = JSON.parse(teams_info_text)
#dive into the nested data in the JSON to get team names
team_names = teams_info["MRData"]["ConstructorTable"]["Constructors"].map {|x| x["name"]}
#go through each of the names and create an instance of Team with attribute name set as each of the elements in the array team_names
team_names.each {|tn| Team.create(name: tn)}
#

#how to add data to already created instances
team_nationalities = teams_info["MRData"]["ConstructorTable"]["Constructors"].map {|x| x["nationality"]}

# team_nationalities.each {|tn| Team.all.find(tn.index).country = tn}

team_nationalities.count.times do |i|
    Team.update(i+1, country: team_nationalities[i])
end
