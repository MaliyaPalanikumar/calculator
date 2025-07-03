//
//  ContentView.swift
//  calculator
//
//  Created by Maliya Palanikumar on 30/06/25.
//

import SwiftUI

struct ContentView: View {
    @State var calculateString: String = ""
    @State var calculatedValue: String?
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            Text(verbatim: calculatedValue ?? "")
            TextField("Enter the input", text: $calculateString)
            Button("Calculate") {
                viewModel.calculationString = calculateString
                do {
                    calculatedValue = String(try viewModel.calculate())
                }
                catch {
                    
                }
               
            }
        }
        .padding()
    }
}
