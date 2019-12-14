//
//  ContentView.swift
//  WeSplit
//
//  Created by DARRELL A PAYNE on 12/12/19.
//  Copyright © 2019 DARRELL A PAYNE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // Calculate the total per person here
        let peopleCount = Double(numberOfPeople) ?? 2
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var totalCheck: Double {
        let peopleCount = Double(numberOfPeople) ?? 2
        return totalPerPerson * peopleCount
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2 ..< 100){
//                            Text("\($0) people")
//                        }
//                    }
                    TextField("Number of people (Default 2)", text: $numberOfPeople)
                    .keyboardType(.decimalPad)
                }
                Section (header: Text("How much tip do you want to leave?")){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section (header: Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section (header: Text("Total check with tip")){
                    Text("$\(totalCheck, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
