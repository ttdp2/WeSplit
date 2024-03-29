//
//  ContentView.swift
//  WeSplit
//
//  Created by Tian Tong on 2019/10/13.
//  Copyright © 2019 TTDP. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var peopleCount = ""
//    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }
    
    var totalPerPerson: Double {
        let peopleNumber = Double(peopleCount) ?? 1
        let amountPerPerson = grandTotal / peopleNumber
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2 ..< 9) {
//                            Text("\($0) People")
//                        }
//                    }
                }
                
                Section(header: Text("Number of people")) {
                    TextField("1", text: $peopleCount)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< self.tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total amount")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per people")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit", displayMode: .inline)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
