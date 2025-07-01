//
//  calculatorTests.swift
//  calculatorTests
//
//  Created by Maliya Palanikumar on 30/06/25.
//

import XCTest

final class calculatorTests: XCTestCase {
    var viewModel:ViewModel!

    override func setUpWithError() throws {
        viewModel = ViewModel(calculationString: "")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        viewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmptyString() {
        try XCTAssertEqual(viewModel.calculate(),0)
    }
    func testWithoutDemiliter() {
        viewModel.calculationString = "1"
        try XCTAssertEqual(viewModel.calculate(),1)
    }
}
