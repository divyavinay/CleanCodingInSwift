import Foundation
import PlaygroundSupport
import XCTest

PlaygroundPage.current.needsIndefiniteExecution = true
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)


class ViewControllerTests: XCTestCase {

    func testSearcharacterByName() {
        let viewController = ViewController(dataProvider: MockDataProvider())
        viewController.fetchCharacterWithName("Arya Stark")
        let outputString = "Arya Stark is played by Maisie Williams"
        XCTAssertEqual(outputString, viewController.label)
    }
}

class DataProvierTests: XCTestCase {
    func testSearchCharater() {
        let dataProvider = DataProvider()
        let expect = expectation(description: "successful")
        dataProvider.searchForCharacter(characterName: "Arya Stark") { (results) in
            for result in results {
                XCTAssertEqual(result.name, "Arya Stark")
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 5.0) { (error) in
            if error != nil {
                XCTFail()
            }
        }
    }

}

ViewControllerTests.defaultTestSuite().run()
DataProvierTests.defaultTestSuite().run()

