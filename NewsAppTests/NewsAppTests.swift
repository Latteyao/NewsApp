//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by MacBook Pro on 2023/6/21.
//

@testable import NewsApp
import XCTest

@MainActor
final class NewsAppTests: XCTestCase {
  var sut: ArticleViewModel = .init()

  override func setUp() {
    sut.apiManager = .sutb
  }

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

  func testfetchData() {
    Task {
      let topLine = await sut.getTopheadline(country: "tw", page: 0, pagesize: 5)
      XCTAssertEqual(topLine, .success(nextpage: 1))
      XCTAssertEqual(5, sut.article.count)
    }
  }
}

extension APIManager {
  static var sutb: APIManager { .init(getData: { $0.stub }) }
}
