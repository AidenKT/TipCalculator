//
//  ContentView.swift
//  TipCalculator
//
//  Created by Aiden on 3/24/23.
//

import SwiftUI

func storeVariables(latestInit: Double) {
    let sharedDefaults = UserDefaults(suiteName: "com.github.aidenkt.TipCalculator")
    sharedDefaults?.set(latestInit, forKey: "latestTip")
}

struct ContentView: View {
    
    @State private var subtotalBill = 0
    @State private var tipPercentage = 0.00
    @State private var totalBill = 0
    @State private var amountofPeople = 1
    let formatter = NumberFormatter()

    var body: some View {
        VStack {
            
            Image(systemName: "dollarsign.circle.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Please enter the amount you \nwould like to calculate.")
                .multilineTextAlignment(.center)
                .padding(.top, 4.0)
            ;
            
            Form {
                TextField(
                    "Enter your subtotal",
                    value: $subtotalBill,
                    formatter: formatter
                ){
                    Text("Subtotal")
                }
                
                TextField(
                    "Tip Percentage",
                    value: $tipPercentage,
                    formatter: formatter
                ){
                    Text("Tip Percent")
                }
                
                Stepper(value: $amountofPeople,
                        in: 1...10,
                        label: {
                    if self.amountofPeople == 1{
                        Text("\(self.amountofPeople) Person")
                    }
                    else {
                        Text("\(self.amountofPeople) People")
                    }
                })
                
                Button(action: {
                    storeVariables(latestInit: tipPercentage)
                }, label: {
                    Text("Calculate Tip")
                })
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
