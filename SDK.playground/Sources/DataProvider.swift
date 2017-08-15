import Foundation

enum SearchOptions {
    case characters
    case books
    case houses
}

public typealias JSONDictionary = [String: AnyObject]

public protocol DataProvidingProtocol {
    func searchForCharacter(characterName: String, handler: @escaping ([GotCharacter]) -> Void)
}

public class DataProvider: DataProvidingProtocol {

    public init() { }

    public func searchForCharacter(characterName: String, handler: @escaping ([GotCharacter]) -> Void) {
        let constructedUrl = buildUrl(searchingFor: .characters, key: characterName)
        guard let url = constructedUrl else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            guard let characterData = data else { return }
            guard let httpResponse = response as? HTTPURLResponse else { return }
            guard httpResponse.statusCode == 200 else { return }
            self.fetchJSONDictionary(data: characterData, handler: handler)
        }
        task.resume()
    }

    private func fetchJSONDictionary(data: Data, handler: @escaping ([GotCharacter]) -> Void) {
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [JSONDictionary]
            var characters = [GotCharacter]()
            guard let results = jsonData else { return }
            for result in results {
                let charater = GotCharacter(dictionary: result)
                guard let c = charater else { return }
                characters.append(c)
            }
            handler(characters)
        } catch {
            print("ERROR:\(error.localizedDescription)")
        }
    }

    private func buildUrl(searchingFor: SearchOptions, key: String) -> URL? {
        var url = URLComponents()
        url.scheme = "https"
        url.host = "anapioficeandfire.com"
        url.path = "/api/\(searchingFor)"
        url.queryItems = [URLQueryItem(name: "name", value: key)]
        return url.url
    }
}
