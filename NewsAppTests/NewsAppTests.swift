//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by MacBook Pro on 2023/6/21.
//

import XCTest
@testable import NewsApp

final class NewsAppTests: XCTestCase {

    var sut:NewsManager = .share
    
//    override func setUp() {
//        sut = .sutb
//    }
    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

    
    
    func testfetchData() async {
        
//        _ =  await sut.getArticle(endpoint: .everything(keyword: "apple"))
        _ = await sut.getArticle(endpoint: .topheadline(country: "tw"))

        
    }
    
    

}



extension NewsManager{
    static var sutb:NewsManager{.init(getData: \.stub)}
}
