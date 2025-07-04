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
        do {
            try viewModel.calculate { response in
                switch response {
                case .success(let sum):
                    XCTAssertEqual(sum,0)
                default:
                    return
                }
            }
        }
        catch {
            XCTAssertNil(error)
        }
    }
    
    func testWithoutDemiliter_WithIntValue() {
        viewModel.calculationString = "1"
        do {
            try viewModel.calculate { response in
                switch response {
                case .success(let sum):
                    XCTAssertEqual(sum,1)
                default:
                    return
                }
            }
        }
        catch {
            XCTAssertNil(error)
        }
        
    }
    
    func testWithMultipleIntValue() {
        viewModel.calculationString = "1,5,7,9"
        do {
            try viewModel.calculate { response in
                switch response {
                case .success(let sum):
                    XCTAssertEqual(sum,22)
                default:
                    return
                }
            }
        }
        catch {
            XCTAssertNil(error)
        }
    }
    
    func testWithDemiliter_WithIntValue() {
        viewModel.calculationString = "\n\t3,4,5"
        do {
            try viewModel.calculate { response in
                switch response {
                case .success(let sum):
                    XCTAssertEqual(sum,12)
                default:
                    return
                }
            }
        }
        catch {
            XCTAssertNil(error)
        }
    }
    
    func testWithCustomDemiliter_WithIntValue() {
        viewModel.calculationString = "//;\n1;2"
        do {
            try viewModel.calculate { response in
                switch response {
                case .success(let sum):
                    XCTAssertEqual(sum,3)
                default:
                    return
                }
            }
        }
        catch {
            XCTAssertNil(error)
        }
    }
    
    func testNegativeTestCase() {
        viewModel.calculationString = "-2"
        do {
            try viewModel.calculate { response in
                switch response {
                case .success(_):
                    return
                case .failure(let error):
                    XCTAssertNotNil(error)
                }
            }
        } catch {
                XCTAssertNil(error)
            }
        }
}
