//
//  TMDBTests.swift
//  TMDBTests
//
//  Created by Mahmoud on 5/17/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import XCTest
@testable import TMDB

class TMDBTests: XCTestCase {
    
    var sut:APIClient!
    
    //MARK:- TableView Test
    func testPopularMoviesControllerTableView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "popularMoviesController") as! PopularMoviesController
        _ = vc.view
        XCTAssertNotNil(vc.tbView)
    }
    
    
    //MARK:- Test APIClient
    func testGetMoviesListRequest(){
      APIClient.getMoviesListRequest(page: 1) { (data, error) in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
    
        }
        
    }
    
   


    
    
    
    override func setUpWithError() throws {
        
       
    }

    override func tearDownWithError() throws {
     
    }

    func testExample() throws {
      
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
