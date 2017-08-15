import Foundation

public class MockDataProvider: DataProvidingProtocol {
    public init() { }
    public func searchForCharacter(characterName: String, handler: @escaping ([GotCharacter]) -> Void) {
        let character = GotCharacter(url: "", name: "Arya Stark", gender: "", culture: "", born: "", died: "", titles: [], aliases: [], father: "", mother: "", spouse: "", allegiances: [], books: [], povBooks: [], tvSeries: [], playedBy: ["Maisie Williams"])
        handler([character])
    }
}
