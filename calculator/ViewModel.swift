//
//  ViewModel.swift
//  calculator
//
//  Created by Maliya Palanikumar on 01/07/25.
//

import Foundation

class ViewModel {
    var calculationString: String
    /// initializer to initialize the viewModel through dependency injection
    /// - Parameter calculationString: string to be calculated
    init(calculationString: String) {
        self.calculationString = calculationString
    }
    
    func calculate() throws -> Int {
        var sum = 0
        guard !calculationString.isEmpty else {
            return 0
        }
        do {
            let regex = try NSRegularExpression(pattern: "[0-9]+")
            let result = regex.matches(in: calculationString,
                                       range: NSRange(calculationString.startIndex...,in: calculationString))
            let calculationArray = result.map {
                String(calculationString[Range($0.range,in: calculationString)!])
            }
            let numberValue = calculationArray.compactMap{ Int($0) }
            for number in Array(numberValue) {
                guard number > 0 else {
                    return 0 // Exception needs to be handled here
                }
                sum = sum + number
            }
        }
        return sum
    }
}

extension Int {
    func isPostive() -> Bool {
        return self > 0 ? true: false
    }
}
