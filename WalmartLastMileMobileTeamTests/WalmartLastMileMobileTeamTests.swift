//
//  WalmartLastMileMobileTeamTests.swift
//  WalmartLastMileMobileTeamTests
//
//  Created by Home on 12/17/21.
//

import XCTest
@testable import WalmartLastMileMobileTeam
class WalmartLastMileMobileTeamTests: XCTestCase {
    let vm = MovieViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchData() throws {
        let expectation = XCTestExpectation(description: "Download apple.com home page")
            
            APIHandler.shared.fetchData(list: 1) {movie,error in
                XCTAssertNotNil(movie, "No data was downloaded.")
                      
                
                if let model = movie?.results, error == nil {
                    XCTAssertEqual("Avengers: Age of Ultron", model.first?.title , "titles not equal")
                }
                expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    func testFetchGenre() throws {
        let expectation = XCTestExpectation(description: "Download apple.com home page")
        APIHandler.shared.fetchGenre { (genre, error) in
            XCTAssertNotNil(genre, "No data was downloaded.")
            if let genr = genre?.genres, error == nil{
                XCTAssertEqual("Action", genr.first?.name , "titles not equal")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    func testCount() throws {
        let count = vm.arr.count
        XCTAssertEqual(count, 0)
    }

}
