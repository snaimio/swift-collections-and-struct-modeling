import Foundation

// MARK: - Domain Models & Value Types

/// Represents a television episode using Swift value semantics (struct).
///
/// Models episode metadata, character rosters, set locations, and props collections
/// while maintaining immutability and providing non-mutating transformation methods.
struct Episode {
    let title: String
    let season: Int
    let episodeNumber: Int
    let characters: [String]
    let location: String
    let props: [String]
    let airDate: String
    
    /// Replaces a character in the cast roster and returns a new immutable `Episode` instance.
    ///
    /// Preserves value semantics and pure functional immutability.
    /// - Parameters:
    ///   - oldName: Name of the existing cast member to replace.
    ///   - newName: Name of the replacement cast member.
    /// - Returns: A new `Episode` instance with the updated character roster.
    func replacingCharacter(oldName: String, with newName: String) -> Episode {
        var updatedCharacters = characters
        
        if let index = updatedCharacters.firstIndex(of: oldName) {
            updatedCharacters[index] = newName
        }
        
        return Episode(
            title: title,
            season: season,
            episodeNumber: episodeNumber,
            characters: updatedCharacters,
            location: location,
            props: props,
            airDate: airDate
        )
    }
    
    /// Pretty-prints formatted episode information to the standard output.
    func displayInfo() {
        print("\n📺 Episode: \"\(title)\" (Season \(season), Episode \(episodeNumber))")
        print("📍 Location: \(location)")
        print("📅 Air Date: \(airDate)")
        print("👥 Characters (\(characters.count)):")
        for character in characters {
            print("   • \(character)")
        }
        print("📦 Props & Equipment (\(props.count)):")
        for prop in props {
            print("   • \(prop)")
        }
    }
}

// MARK: - Collection Operations & Demonstrations

func runCollectionDemonstrations() {
    print("==========================================================")
    print(" Swift Collections & Struct Modeling: Domain Architecture")
    print("==========================================================")
    
    // 1. Array Collection Initialization & Mutation Analysis
    let castRoster = [
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
    
    print("\n--- 1. Collection Sorting Algorithms ---")
    print("Original Count: \(castRoster.count) characters")
    
    // Alphabetical Sorting (A-Z)
    let alphabetical = castRoster.sorted()
    print("\n🔤 Alphabetical Order (A-Z) [First 5]:")
    print(alphabetical.prefix(5).joined(separator: ", ") + "...")
    
    // Reverse Alphabetical Sorting (Z-A) with closure comparator
    let reverseAlphabetical = castRoster.sorted(by: >)
    print("\n🔤 Reverse Alphabetical Order (Z-A) [First 5]:")
    print(reverseAlphabetical.prefix(5).joined(separator: ", ") + "...")
    
    // 2. String Slicing & Prefix Transformation
    print("\n--- 2. Substring & Prefix Operations ---")
    for name in castRoster.prefix(6) {
        let prefix4 = name.prefix(4)
        print("  \"\(name)\" -> 4-char prefix: '\(prefix4)'")
    }
    
    // 3. Struct Value Semantics & Pure Transformation
    print("\n--- 3. Immutable Struct Modeling & Transformation ---")
    
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
    
    print("\n[Original State]")
    originalEpisode.displayInfo()
    
    // Performing non-mutating replacement
    let updatedEpisode = originalEpisode.replacingCharacter(oldName: "Jonas Kahnwald", with: "Adam")
    
    print("\n[Transformed State (Pure Replacement)]")
    updatedEpisode.displayInfo()
    
    // 4. Verification of Immutability and State
    print("\n================== VERIFICATION ==================")
    let originalPreserved = originalEpisode.characters.contains("Jonas Kahnwald")
    let newUpdated = updatedEpisode.characters.contains("Adam") && !updatedEpisode.characters.contains("Jonas Kahnwald")
    
    if originalPreserved && newUpdated {
        print("✅ Success: Immutability verified. Original struct untouched; new struct updated.")
    } else {
        print("❌ Verification failed.")
    }
    print("==================================================")
}

runCollectionDemonstrations()
