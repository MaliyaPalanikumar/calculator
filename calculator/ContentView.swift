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
            Image("backgroundImage")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text(verbatim: calculatedValue ?? "")
                .padding(EdgeInsets(top: 50, leading: 25, bottom: 50, trailing: 25))
                .font(.system(size: 50))
                .foregroundStyle(.purple)
            
            TextField("Enter the input", text: $calculateString)
                .cornerRadius(10.0)
                .font(.system(size: 20))
                .foregroundStyle(.purple)
                .padding(.leading,25)
            
            Button("Calculate") {
                viewModel.calculationString = calculateString
                do {
                   try viewModel.calculate { response in
                       switch response {
                       case .success(let sum):
                           calculatedValue = String(sum)
                       case .failure(let error):
                           calculatedValue = error.localizedDescription
                       }
                    }
                }
                catch {
                    calculatedValue = error.localizedDescription.debugDescription
                }
            }
            .disabled(calculateString.isEmpty)
            .cornerRadius(10.0)
            .font(.system(size: 50))
            .foregroundStyle(.purple)
            .padding(EdgeInsets(top: 50, leading: 25, bottom: 50, trailing: 25))
        }
    }
}
