
import UIKit

/*
 A: Create an array with the names of the characters from one of your favourite TV series. Next, sort the array both alphabetically and reverse alphabetically, displaying the results each time.
 B: Display the first 4 characters for each array element in a. the first 4 letters of the characters in the characters array A
 C: For the TV series you chose in a., write a structure that represents an episode. Include characters(collection type), location, props(collection type).
 D: Create a method for your structure in c. that replaces one character with another one of your choice. (The Office: replace Jim with Michael)
*/

// ==========================================
// ASSIGNMENT 2 - Dark (2017 Netflix Series)
// ==========================================

// Part A: Creating an array of character names

let characters = [
    "Jonas Kahnwald",
    "Martha Nielsen",
    "Ulrich Nielsen",
    "Hannah Kahnwald",
    "Claudia Tiedemann",
    "Noah",
    "Adam",
    "Eva",
    "Bartosz Tiedemann",
    "Franziska Doppler",
    "Magnus Nielsen",
    "Katharina Nielsen",
    "Mikkel Nielsen",
    "Peter Doppler",
    "Regina Tiedemann",
    "Aleksander Tiedemann",
    "Elisabeth Doppler",
    "Charlotte Doppler",
    "H.G. Tannhaus"
]

print("\nOriginal Characters (Dark):")
print(String(repeating: "~", count: 27))
print(characters)

let alphabetical = characters.sorted() // sorting the array alphabetically
print("\nAlphabetical Order (A-Z):")
print(String(repeating: "~", count: 25))
print(alphabetical)

let reverseAlphabetical = characters.sorted(by: >) // sorting the array reverse alphabetically
print("\nReverse Alphabetical Order (Z-A):")
print(String(repeating: "~", count: 33))
print(reverseAlphabetical)

// Part B: First 4 Characters of Each Name

print("\nFirst 4 Characters of Each Name:")
print(String(repeating: "~", count: 32))

for name in characters {
    let firstFour = name.prefix(4)
    print("\"\(name)\" → '\(firstFour)'")
}

// Part C: Episode Structure

struct Episode {
    let title: String
    let season: Int
    let episodeNumber: Int
    let characters: [String]
    let location: String
    let props: [String]
    let airDate: String
    
    // Part D: Method inside struct
    func replaceCharacter(oldName: String, newName: String) -> Episode {
        var newCharacters = characters
        
        for (index, name) in newCharacters.enumerated() {
            if name == oldName {
                newCharacters[index] = newName
                break
            }
        }
        
        return Episode(
            title: title,
            season: season,
            episodeNumber: episodeNumber,
            characters: newCharacters,
            location: location,
            props: props,
            airDate: airDate
        )
    }
    
    func displayInfo() {
        print("\n📺 Episode: \(title)")
        print("Season \(season), Episode \(episodeNumber)")
        print("Location: \(location)")
        print("\nCharacters:")
        for character in characters {
            print("  • \(character)")
        }
        print("\nProps:")
        for prop in props {
            print("  • \(prop)")
        }
    }
}

// Creating Episode Instance

let originalEpisode = Episode(
    title: "Secrets",
    season: 1,
    episodeNumber: 1,
    characters: [
        "Jonas Kahnwald",
        "Martha Nielsen",
        "Ulrich Nielsen",
        "Hannah Kahnwald",
        "Bartosz Tiedemann",
        "Franziska Doppler",
        "Magnus Nielsen",
        "Katharina Nielsen",
        "Mikkel Nielsen",
        "Peter Doppler",
        "Charlotte Doppler"
    ],
    location: "Winden, Germany",
    props: ["Caves", "Flashlight", "Yellow raincoat", "Map", "Radiation suit"],
    airDate: "December 1, 2017"
)

print("\n" + String(repeating: "=", count: 19))
print("BEFORE REPLACEMENT:")
print(String(repeating: "=", count: 19))
originalEpisode.displayInfo()

// Part D: Replace Jonas with Adam

let updatedEpisode = originalEpisode.replaceCharacter(oldName: "Jonas Kahnwald", newName: "Adam")

print("\n" + String(repeating: "=", count: 18))
print("AFTER REPLACEMENT:")
print(String(repeating: "=", count: 18))
updatedEpisode.displayInfo()

// Verification
print("\n================== VERIFICATION: ==================")
if updatedEpisode.characters.contains("Adam") && !updatedEpisode.characters.contains("Jonas Kahnwald") {
    print(" ✅ Success! Jonas Kahnwald was replaced with Adam")
} else {
    print(" ❌ Replacement failed")
}
print(String(repeating: "=", count: 51))

