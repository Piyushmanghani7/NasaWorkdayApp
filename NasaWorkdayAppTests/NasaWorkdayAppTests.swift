//
//  NasaWorkdayAppTests.swift
//  NasaWorkdayAppTests
//
//  Created by Piyush Manghani on 7/3/23.
//

import XCTest
@testable import NasaWorkdayApp

final class NasaWorkdayAppTests: XCTestCase {
    
    var sut: RestAPI!
    
    override func setUpWithError() throws {
        sut = RestAPI()
        
    }
    
    
    
    func testExample() throws {
        // we are using XCTestExpectation to be able to wait untill finishing
        let expection = XCTestExpectation(description: " API data is fetching properly")
        
        
        var ItemModelReponse: [Collection.collection_model.Items_model]?
        var responseError: Error?
        sut.SearchFetch(SearchName: "Mars", Page: 1) { (itemmodel, error) in
            
            ItemModelReponse = itemmodel
            responseError = error
            expection.fulfill()
        }
        wait(for: [expection], timeout: 1)
        
        XCTAssertNotNil(ItemModelReponse) // Make sure that Items response != nil
        XCTAssertNil(responseError)// Make sure that error == nil
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
}
