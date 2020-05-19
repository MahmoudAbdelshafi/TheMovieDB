//
//  TMDBUITests.swift
//  TMDBUITests
//
//  Created by Mahmoud on 5/19/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import XCTest

class TMDBUITests: XCTestCase {

    override func setUpWithError() throws {
        
        continueAfterFailure = false

       
    }

    

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        
        let addbutton = app.buttons["add"]
        XCTAssertNotNil(addbutton)
        

    }

}
