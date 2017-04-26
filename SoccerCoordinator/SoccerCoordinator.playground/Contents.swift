// PART 1
/*
    Defines a Dictionary holding each player with String keys and the corresponding values.
 */

let joeSmith: [String : Any] = ["name": "Joe Smith", "height":	42,	"hasExperience": true, "guardians": "Jim and Jan Smith"]
let jillTanner: [String : Any] = ["name": "Jill Tanner", "height":36, "hasExperience": true, "guardians":"Clara Tanner"]
let billBon: [String : Any] = ["name": "Bill Bon", "height":43, "hasExperience": true, "guardians": "Sara and Jenny Bon"]
let evaGordon: [String : Any] = ["name": "Eva Gordon", "height": 45, "hasExperience": false, "guardians": "Wendy and Mike Gordon"]
let mattGill: [String : Any] = ["name": "Matt Gill", "height": 40, "hasExperience": false, "guardians":	"Charles and Sylvia Gill"]
let kimmyStein: [String : Any] = ["name": "Kimmy Stein", "height": 41, "hasExperience":false, "guardians": "Bill and Hillary Stein"]
let sammyAdams: [String : Any] = ["name": "Sammy Adams", "height": 45, "hasExperience":false, "guardians":"Jeff Adams"]
let karlSaygan: [String : Any] = ["name": "Karl Saygan", "height": 42, "hasExperience": true,"guardians": "Heather Bledsoe"]
let suzaneGreenberg: [String : Any] = ["name":"Suzane Greenberg" , "height": 44, "hasExperience":true,"guardians":"Henrietta Dumas"]
let salDali: [String : Any] = ["name":"Sal Dali", "height":	41,	"hasExperience":false,"guardians": "Gala Dali"]
let joeKavalier: [String : Any] = ["name":"Joe Kavalier", "height":	39,	"hasExperience":false,"guardians": "Sam and Elaine Kavalier"]
let benFinkelstein: [String : Any] = ["name":"Ben Finkelstein", "height": 44, "hasExperience":false,"guardians": "Aaron and Jill Finkelstein"]
let diegoSoto: [String : Any] = ["name":"Diego Soto", "height":	41,	"hasExperience":true,"guardians": "Robin and Sarika Soto"]
let chloeAlaska: [String : Any] = ["name":"Chloe Alaska", "height": 47,	"hasExperience":false,"guardians": "David and Jamie Alaska"]
let arnoldWillis: [String : Any] = ["name":"Arnold Willis", "height": 43, "hasExperience":false,"guardians": "Claire Willis"]
let phillipHelm: [String : Any] = ["name":"Phillip Helm",  "height": 44, "hasExperience":true,"guardians": "Thomas Helm and Eva Jones"]
let lesClay: [String : Any] = ["name":"Les Clay", "height":	42,	"hasExperience":true, "guardians": "Wynonna Brown"]
let herschelKrustofski: [String : Any] = ["name": "Herschel Krustofski", "height": 45, "hasExperience": true, "guardians": "Hyman and Rachel Krustofski"]

/* 
    Array Collection holding all players
*/

let players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein,sammyAdams, karlSaygan,suzaneGreenberg,salDali, joeKavalier,benFinkelstein,diegoSoto,chloeAlaska,arnoldWillis,phillipHelm,lesClay,herschelKrustofski]

/*
    It declares two empty arrays to hold experienced players and unexperienced players
 */

var experiencedPlayers: [[String:Any]] = Array()
var nonExperiencedPlayers: [[String:Any]] = Array()

/*
    Defines 3 arrays to hold players for each team
*/

var teamSharks: [[String:Any]] = Array()
var teamDragons: [[String:Any]] = Array()
var teamRaptors: [[String:Any]] = Array()

/*
    Defines an empty array to hold personalized letters to guardians
*/

var letters: [String] = Array()

var teamRaptorsHeightSum = 0.0
var teamDragonsHeightSum = 0.0
var teamSharksHeightSum = 0.0

var teamRaptorsAvg = 0.0
var teamDragonsAvg = 0.0
var teamSharksAvg = 0.0

var orderedExperiencedPlayers: [[String:Any]] = Array()
var orderedUnexperiencedPlayers: [[String:Any]] = Array()


// PART 2

/*
    Logic to iterate through all 18 players and assign them to teams such that the number of experienced players on each team are the same. 
    Store each team’s players in its own new collection variable.
    
    Extra Credits:
 
    Logic to ensure that each team's average height is within 1.5 inches of the others.
*/

//  Experienced players and the unexperienced players are stored sin two different arrays.


for player in players {
    //if player["hasExperience"] is not nil
    if let hasExperience = player["hasExperience"] as? Bool {
        //if current player hasExperience == true
        if hasExperience {
        //it adds his corresponding name to the experiencedPlayers array
           experiencedPlayers.append(player)
        }
        else {
            // if player does not have experience adds his corresponding player to the noExperiencePlayers array
            nonExperiencedPlayers.append(player)
        }
    }
   }


// Experienced players are ranked from largest to smallest and stored in orderedExperiencedPlayers array.

var i = 0, j = 0, max = 0, maxPosition = 0


while i < experiencedPlayers.count {
    if let heightPlayer = experiencedPlayers[i]["height"] as? Int {
        max = heightPlayer
        while j < experiencedPlayers.count {
            if let heightPlayer = experiencedPlayers[j]["height"] as? Int {
                if (heightPlayer>max) && (heightPlayer != 0) {
                    max = heightPlayer
                    maxPosition=j
                }
            }
            j+=1
        }
    }
    orderedExperiencedPlayers.append(experiencedPlayers[maxPosition])
    experiencedPlayers[maxPosition]["height"] = 0
    j=0
    i+=1
    
}

/*  Iterates through the orderedExperiencedPlayers array taking the first and last player (which are ordered by height  from smallest to largest) and storing it in each team ensuring that each team's average height is within 1.5 inch of the others teams.
*/

var startIndex = 0
var endIndex = orderedExperiencedPlayers.count - 1
var indexmm = orderedExperiencedPlayers.count

while indexmm >= (orderedExperiencedPlayers.count % 6) {
    teamSharks.append(orderedExperiencedPlayers[startIndex])
    teamSharks.append(orderedExperiencedPlayers[endIndex])
    startIndex+=1
    endIndex-=1
    teamDragons.append(orderedExperiencedPlayers[startIndex])
    teamDragons.append(orderedExperiencedPlayers[endIndex])
    startIndex+=1
    endIndex-=1
    teamRaptors.append(orderedExperiencedPlayers[startIndex])
    teamRaptors.append(orderedExperiencedPlayers[endIndex])
    startIndex+=1
    endIndex-=1
    indexmm -= 6
}


while startIndex < endIndex {
    teamSharks.append(orderedExperiencedPlayers[startIndex])
    startIndex+=1
    if startIndex != endIndex{
        teamDragons.append(orderedExperiencedPlayers[startIndex])
        startIndex+=1
    }
    if startIndex != endIndex{
        teamRaptors.append(orderedExperiencedPlayers[startIndex])
    }
}

// Unexperienced players are ranked from largest to smallest and stored in orderedUnexperiencedPlayers array.

i = 0
j = 0
max = 0
maxPosition = 0


while i < nonExperiencedPlayers.count {
    if let heightPlayer = nonExperiencedPlayers[i]["height"] as? Int {
        max = heightPlayer
        while j < nonExperiencedPlayers.count {
            if let heightPlayer = nonExperiencedPlayers[j]["height"] as? Int {
                if (heightPlayer>max) && (heightPlayer != 0) {
                    max = heightPlayer
                    maxPosition=j
                }
            }
            j+=1
        }
    }
    orderedUnexperiencedPlayers.append(nonExperiencedPlayers[maxPosition])
    nonExperiencedPlayers[maxPosition]["height"] = 0
    j=0
    i+=1
    
}

/*  Iterates through the orderedUnexperiencedPlayers array taking the first and last player (which are ordered by height  from smallest to largest) and storing it in each team ensuring that each team's average height is within 1.5 inch of the others teams.
*/

startIndex = 0
endIndex = orderedUnexperiencedPlayers.count - 1
indexmm = orderedUnexperiencedPlayers.count

while indexmm >= (orderedUnexperiencedPlayers.count % 6) {
    teamSharks.append(orderedUnexperiencedPlayers[startIndex])
    teamSharks.append(orderedUnexperiencedPlayers[endIndex])
    startIndex+=1
    endIndex-=1
    teamDragons.append(orderedUnexperiencedPlayers[startIndex])
    teamDragons.append(orderedUnexperiencedPlayers[endIndex])
    startIndex+=1
    endIndex-=1
    teamRaptors.append(orderedUnexperiencedPlayers[startIndex])
    teamRaptors.append(orderedUnexperiencedPlayers[endIndex])
    startIndex+=1
    endIndex-=1
    indexmm -= 6
}

while startIndex < endIndex {
    teamSharks.append(orderedUnexperiencedPlayers[startIndex])
    startIndex+=1
    if startIndex != endIndex{
        teamDragons.append(orderedUnexperiencedPlayers[startIndex])
        startIndex+=1
    }
    if startIndex != endIndex {
        teamRaptors.append(orderedUnexperiencedPlayers[startIndex])
    }
}


// PART 3
/*
    Logic that iterates through all three teams of players and generates a personalized letter to the guardians
    providing player name, team name, guardian names, practice date/time.
    For the “Exceeds Expectations” rating print out the average height of the players of each team.
*/


//  The averages of each equipment are calculated.

// The sum of the heights of the players of the Raptors team is accumulated.
for k in 0..<teamRaptors.count {
    if let heightPlayer = teamRaptors[k]["height"] as? Int {
        teamRaptorsHeightSum += Double(heightPlayer)
    }
}

// The sum of the heights of the players of the Dragons team is accumulated.
for k in 0..<teamDragons.count {
    if let heightPlayer = teamDragons[k]["height"] as? Int {
        teamDragonsHeightSum += Double(heightPlayer)
    }
}

// The sum of the heights of the players of the Sharks team is accumulated.
for k in 0..<teamSharks.count {
    if let heightPlayer = teamSharks[k]["height"] as? Int {
        teamSharksHeightSum += Double(heightPlayer)
    }
}

// Average of Raptors Team
teamRaptorsAvg = teamRaptorsHeightSum/Double(teamRaptors.count)
// Average of Dragons Team
teamDragonsAvg = teamDragonsHeightSum/Double(teamDragons.count)
// average of Shark Team
teamSharksAvg = teamSharksHeightSum/Double(teamSharks.count)

var index: Int = 0 // to iterate through each team players
var letter:String  // to hold each letter

while index < teamSharks.count {
    
    //unwrap the name and guadians name's from the dictionary
    if let teamSharksNamePlayer = teamSharks[index]["name"], let teamSharksGuardiansPlayer = teamSharks[index]["guardians"]  {
    letter = "Dear Guardians \(teamSharksGuardiansPlayer): \n\(teamSharksNamePlayer) has been placed on Sharks Team. \nThe starting date is on March 17, 3pm. \nThe average height of the players of the team is \(teamSharksAvg). \nSee you then!\n"
    letters.append(letter)
    }
    index += 1
}

index = 0
while index < teamDragons.count {

    //unwrap the name and guadians name's from the dictionary
    if let teamDragonsNamePlayer = teamDragons[index]["name"], let teamDragonsGuardiansPlayer = teamDragons[index]["guardians"]  {
    letter = "Dear Guardians \(teamDragonsGuardiansPlayer): \n\(teamDragonsNamePlayer) has been placed on Dragons Team. \nThe starting date is on March 17, 1pm. \nThe average height of the players of the team is \(teamDragonsAvg). \nSee you then!\n"
    letters.append(letter)
    }
    
    index += 1
}

index = 0
while index < teamRaptors.count {

    //unwrap the name and guadians name's from the dictionary
    if let teamRaptorsNamePlayer = teamRaptors[index]["name"], let teamRaptorsGuardiansPlayer = teamRaptors[index]["guardians"]  {
    letter = "Dear Guardians \(teamRaptorsGuardiansPlayer): \n\(teamRaptorsNamePlayer) has been placed on Raptors Team. \nThe starting date is on March 18, 1pm. \nThe average height of the players of the team is \(teamRaptorsAvg). \nSee you then!\n"
    letters.append(letter)
    }
    
    index += 1
}

// The letters are printed in the console using a for loop to iterate through the letters array

for letter in letters {
    print(letter)
}


