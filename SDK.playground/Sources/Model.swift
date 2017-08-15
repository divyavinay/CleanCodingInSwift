import Foundation

protocol JSONDeserializable {
    init?(dictionary: JSONDictionary)
}

public struct GotCharacter {
    public let url: String
    public let name: String
    public let gender: String
    public let culture: String
    public let born: String
    public let died: String
    public let titles: [String]
    public let aliases: [String]
    public let father: String
    public let mother: String
    public let spouse: String
    public let allegiances: [String]
    public let books: [String]
    public let povBooks: [String]
    public let tvSeries: [String]
    public let playedBy: [String]
}

extension GotCharacter: JSONDeserializable  {
    public init?(dictionary: JSONDictionary) {
        guard
            let url = dictionary["url"] as? String,
            let name = dictionary["name"] as? String,
            let gender = dictionary["gender"] as? String,
            let culture = dictionary["culture"] as? String,
            let born = dictionary["born"] as? String,
            let died = dictionary["died"] as? String,
            let titles = dictionary["titles"] as? [String],
            let aliases = dictionary["aliases"] as? [String],
            let father = dictionary["father"] as? String,
            let mother = dictionary["mother"] as? String,
            let allegiances = dictionary["allegiances"] as? [String],
            let spouse = dictionary["spouse"] as? String,
            let books = dictionary["books"] as? [String],
            let povBooks = dictionary["povBooks"] as? [String],
            let tvSeries = dictionary["tvSeries"] as? [String],
            let playedBy = dictionary["playedBy"] as? [String]
            else {
                return nil
        }
        self.name = name
        self.url = url
        self.gender = gender
        self.culture = culture
        self.born = born
        self.died = died
        self.titles = titles
        self.aliases = aliases
        self.father = father
        self.mother = mother
        self.allegiances = allegiances
        self.spouse = spouse
        self.books = books
        self.povBooks = povBooks
        self.tvSeries = tvSeries
        self.playedBy = playedBy
    }
}
