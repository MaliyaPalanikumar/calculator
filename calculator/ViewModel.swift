//
//  ViewModel.swift
//  calculator
//
//  Created by Maliya Palanikumar on 01/07/25.
//

import Foundation

enum NumericalError: String,Error {
    case negativeCase
}

class ViewModel: ObservableObject {
    var calculationString: String
    /// initializer to initialize the viewModel through dependency injection
    /// - Parameter calculationString: string to be calculated
    init(calculationString: String = "") {
        self.calculationString = calculationString
    }
    
    /// function to calculate the sum
    /// - Returns: return the calculate sum
    func calculate() throws -> Int {
        var sum = 0
        guard !calculationString.isEmpty else {
            return 0
        }
        do {
            // added the regression expression to match the pattern
            let regex = try NSRegularExpression(pattern: "-?[0-9]+")
            let result = regex.matches(in: calculationString,
                                       range: NSRange(calculationString.startIndex...,in: calculationString))
            let calculationArray = result.map {
                String(calculationString[Range($0.range,in: calculationString)!])
            }
            let numberValue = calculationArray.compactMap{ Int($0) }
            for number in Array(numberValue) {
                guard number.isPostive() else {
                    throw NumericalError.negativeCase
                }
                sum = sum + number
            }
        }
        return sum
    }
}
// adding custom function through extension

extension Int {
    func isPostive() -> Bool {
        return self > 0 ? true: false
    }
}

extension NumericalError: CustomStringConvertible {
    var description: String {
        return "Negative number are not allowed"
    }
}

extension NumericalError: LocalizedError {
    private var errorDescription: String {
        return NSLocalizedString("Negative number are not allowed",
                                 comment: "Negative number")
    }
}
