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
        for character in calculationString {
            if character.isNumber{
                sum = sum + (character.wholeNumberValue ?? 0)
            }
        }
        return sum
    }
}
