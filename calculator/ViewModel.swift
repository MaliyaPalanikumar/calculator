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
    func calculate(completionHandler: @escaping (Result<Int,Error>) -> Void) throws{
        var sum = 0
        guard !calculationString.isEmpty else {
            completionHandler(.success(sum))
            return
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
                    completionHandler(.failure(NumericalError.negativeCase))
                    return
                }
                sum = sum + number
            }
        }
        completionHandler(.success(sum))
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
