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
    
    func testWithoutDemiliter_WithIntValue() {
        viewModel.calculationString = "1"
        try XCTAssertEqual(viewModel.calculate(),1)
    }
    
    func testWithMultipleIntValue() {
        viewModel.calculationString = "1,5,7,9"
        try XCTAssertEqual(viewModel.calculate(), 22)
    }
    
    func testWithDemiliter_WithIntValue() {
        viewModel.calculationString = "\n\t3,4,5"
        try XCTAssertEqual(viewModel.calculate(), 12)
    }
    
    func testWithCustomDemiliter_WithIntValue() {
        viewModel.calculationString = "//;\n1;2"
        try XCTAssertEqual(viewModel.calculate(), 3)
    }
    
    func testNegativeTestCase() {
        viewModel.calculationString = "-2"
        try XCTAssertThrowsError(viewModel.calculate())
    }
}
