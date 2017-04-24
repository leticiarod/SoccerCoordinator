// PART 1
/*
    Dictionary holding each player with String keys and the corresponding values
 */

let joeSmith: [String : Any] = ["name": "Joe Smith", "height":	42,	"hasExperience": true, "guardians": "Jim and Jan Smith"]
let jillTanner: [String : Any] = ["name": "Jill Tanner", "height":36, "hasExperience": true, "guardians":"Clara Tanner"]
let billBon: [String : Any] = ["name": "Bill Bon", "height":43, "hasExperience": true, "guardians": "Sara and Jenny Bon"]
let evaGordon: [String : Any] = ["name": "Eva Gordon", "height": 45, "hasExperience": false, "guardians": "Wendy and Mike Gordon"]
let mattGill: [String : Any] = ["name": "Matt Gill", "height": 40, "hasExperience": false, "guardians":	"Charles and Sylvia Gill"]
let kimmyStein: [String : Any] = ["name": "Kimmy Stein", "height":	41, "hasExperience":false, "guardians": "Bill and Hillary Stein"]
let sammyAdams: [String : Any] = ["name": "Sammy Adams", "height":	45, "hasExperience":false,	"guardians":"Jeff Adams"]
let karlSaygan: [String : Any] = ["name": "Karl Saygan", "height":	42,	"hasExperience": true,"guardians":	"Heather Bledsoe"]
let suzaneGreenberg: [String : Any] = ["name":"Suzane Greenberg" , "height":	44,	"hasExperience":true,"guardians":"Henrietta Dumas"]
let salDali: [String : Any] = ["name":"Sal Dali", "height":	41,	"hasExperience":false,"guardians":	"Gala Dali"]
let joeKavalier: [String : Any] = ["name":"Joe Kavalier", "height":	39,	"hasExperience":false,"guardians":	"Sam and Elaine Kavalier"]
let benFinkelstein: [String : Any] = ["name":"Ben Finkelstein", "height":	44,	"hasExperience":false,"guardians":	"Aaron and Jill Finkelstein"]
let diegoSoto: [String : Any] = ["name":"Diego Soto", "height":	41,	"hasExperience":true,"guardians":	"Robin and Sarika Soto"]
let chloeAlaska: [String : Any] = ["name":"Chloe Alaska", "height": 47,	"hasExperience":false,"guardians":	"David and Jamie Alaska"]
let arnoldWillis: [String : Any] = ["name":"Arnold Willis", "height":	43,	"hasExperience":false,"guardians":	"Claire Willis"]
let phillipHelm: [String : Any] = ["name":"Phillip Helm",  "height":	44,	"hasExperience":true,"guardians":	"Thomas Helm and Eva Jones"]
let lesClay: [String : Any] = ["name":"Les Clay", "height":	42,	"hasExperience":true, "guardians":	"Wynonna Brown"]
let herschelKrustofski: [String : Any] = ["name": "Herschel Krustofski", "height":	45, "hasExperience": true, "guardians":	"Hyman and Rachel Krustofski"]

/* 
    Array Collection holding all players
*/

let players = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein,sammyAdams, karlSaygan,suzaneGreenberg,salDali, joeKavalier,benFinkelstein,diegoSoto,chloeAlaska,arnoldWillis,phillipHelm,lesClay,herschelKrustofski]

/*
    It declares two empty arrays to hold experienced players and no experienced players
 */

var experiencedPlayers: [[String:Any]] = Array()
var nonExperiencedPlayers: [[String:Any]] = Array()

/*
    It declares 3 arrays to hold players for each team
*/

var teamSharks: [[String:Any]] = Array()
var teamDragons: [[String:Any]] = Array()
var teamRaptors: [[String:Any]] = Array()

/*
    It declares an empty array to hold personalized letter to guardians
*/

var letters: [String] = Array()

// PART 2

/*
    Logic
*/

// It is obtain the experienced players and the non experienced players in two different arrays

for player in players {
    //if player["hasExperience"] is not nil
    if let hasExperience = player["hasExperience"] as? Bool {
        //if current player hasExperience == true
        if hasExperience {
            //if let playerTeam = player  {
        //it adds his corresponding name to the experiencedPlayers array
           experiencedPlayers.append(player) // it is force the to be converted to type [String:String] using as! because
                                                                  //if the player hasnt a nil value of experience that means the player does exists.
        }
        else {
            // if player does not have experience adds his corresponding player to the noExperiencePlayers array
            nonExperiencedPlayers.append(player)
        }
    }
   }

//nonExperiencedPlayers.count

// Store experiencePlayers in each team

for experiencedPlayer in experiencedPlayers {
    if teamSharks.count >= teamDragons.count{
        if teamDragons.count >= teamRaptors.count{
            teamRaptors.append(experiencedPlayer)
        }
        else {
            teamDragons.append(experiencedPlayer)
        }
    }
    else{
            teamSharks.append(experiencedPlayer)
        }
}


for nonExperiencedPlayer in nonExperiencedPlayers {
    if teamSharks.count >= teamDragons.count{
        if teamDragons.count >= teamRaptors.count{
            teamRaptors.append(nonExperiencedPlayer)
        }
        else {
            teamDragons.append(nonExperiencedPlayer)
        }
    }
    else{
        teamSharks.append(nonExperiencedPlayer)
    }

}

teamSharks.count
teamDragons.count
teamRaptors.count

// PART 3a
/*
    Logic
*/

var index: Int = 0
var letter:String


// It is assumed that every team player collection has always equal number of players

while index < teamSharks.count {
    
    letter = "Sharks - March 17, 3pm -  \(teamSharks[index]["name"]) - \(teamSharks[index]["guardians"])"
    letters.append(letter)
    letter = "Dragons - March 17, 1pm -  \(teamDragons[index]["name"]) - \(teamDragons[index]["guardians"])"
    letters.append(letter)
    letter = "Raptors - March 18, 1pm -  \(teamRaptors[index]["name"]) - \(teamRaptors[index]["guardians"])"
    letters.append(letter)
    
    
    index += 1
    
}

for letter in letters {
    print(letter)
}


