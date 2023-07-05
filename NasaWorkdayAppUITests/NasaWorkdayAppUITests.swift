//
//  NasaWorkdayAppUITests.swift
//  NasaWorkdayAppUITests
//
//  Created by Piyush Manghani on 7/3/23.
//

import XCTest

final class NasaWorkdayAppUITests: XCTestCase {

    override func setUpWithError() throws {
       
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
  
        let app = XCUIApplication()
        app.launch()

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
           
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
