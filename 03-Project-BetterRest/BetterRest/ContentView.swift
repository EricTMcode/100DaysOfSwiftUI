//
//  ContentView.swift
//  BetterRest
//
//  Created by Eric on 02/11/2023.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
//    @State private var alertTitle = ""
//    @State private var alertMessage = ""
//    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var sleepResults: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return "Your ideal bedtime is " + sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "There was an error"
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    DatePicker("Please enter a tine", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("When do you want to wake up?")
                        .foregroundStyle(.red)
                        .bold()
                        .italic()
                }
                
                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep")
                        .foregroundStyle(.green)
                        .font(.headline)
                }
                
                Section {
                    Stepper("^[\(coffeeAmount) cup](inflect:true)", value: $coffeeAmount, in: 1...20)
                    
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach(1..<21) {
                            Text(String($0))
                        }
                    }
                } header: {
                    Text("Daily coffee intake")
                        .bold()
                        .foregroundStyle(.blue)
                }
                
                
                VStack(alignment: .center ,spacing: 20) {
                    
                    
                    Text(sleepResults)
                        .font(.title3)
                }
            }
            .navigationTitle("BetterRest")
            
            //            .toolbar {
            //                Button("Calculate", action: calculateBedTime)
            //            }
            //            .alert(alertTitle, isPresented: $showingAlert) {
            //                Button("OK") {}
            //            } message: {
            //                Text(alertMessage)
            //            }
        }
    }
    
//    func calculateBedTime() {
//        do {
//            let config = MLModelConfiguration()
//            let model = try SleepCalculator(configuration: config)
//            
//            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
//            let hour = (components.hour ?? 0) * 60 * 60
//            let minute = (components.minute ?? 0) * 60
//            
//            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
//            
//            let sleepTime = wakeUp - prediction.actualSleep
//            
//            alertTitle = "Your idel bedtime is..."
//            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
//            
//        } catch {
//            alertTitle = "Error"
//            alertMessage = "Sorry, there was a problem calculating your bedtime."
//        }
//        
//        showingAlert = true
//    }
}

#Preview {
    ContentView()
}
