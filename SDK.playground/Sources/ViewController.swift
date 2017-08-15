import Foundation
import UIKit

public class ViewController: UIViewController {

    private let dataProvider: DataProvidingProtocol
    public var label: String!

    public init(dataProvider: DataProvidingProtocol) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }

    required public convenience init?(coder aDecoder: NSCoder) {
        self.init(dataProvider: DataProvider())
    }

    public convenience init() {
        self.init(dataProvider: DataProvider())
    }

    public func fetchCharacterWithName(_ name: String) {
        dataProvider.searchForCharacter(characterName: name) { (results) in
            guard results.count > 0 else { return }
            for result in results {
                self.label = "\(result.name) is played by \(result.playedBy[0])"
            }
        }
    }
}
