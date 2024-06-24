import SwiftUI

struct ContentView: View {
    @State private var userInput = 1.0
    @State private var baseUnit = "F"
    @State private var endUnit = "K"
    
    let units = ["F", "C", "K"]

    //Convert the units that is selected
    var convertUnit: String {
        let selectedUnits = String(baseUnit) + String(endUnit)
        let input = Double(userInput)
        
        switch selectedUnits{
        case "FC":
            let answer = Double((input - 32) * (5/9))
            return String(answer.formatted() + " C")
        case "CF":
            let answer = Double((input * 9/5) + 32)
            return String(answer.formatted() + " F")
        case "FK":
            let answer = Double((input - 32) * (5/9) + 273.15)
            return String(answer.formatted() + " K")
        case "KF":
            let answer = Double((input - 273.15) * (9/5) + 32)
            return String(answer.formatted() + " F")
        case "CK":
            let answer = Double(input + 273.15)
            return String(answer.formatted() + " K")
        case "KC":
            let answer = Double(input - 273.15)
            return String(answer.formatted() + " C")
        default:
            return String(userInput) + " " + baseUnit
            }
        }       
    
    var body: some View {
        VStack {
            NavigationStack{
                Form{
                    Section ("Enter value") {
                        TextField("User value", value:  $userInput, format: .number)
                    }
                    
                    Section ("Convert from") {
                        Picker("Base Unit", selection: $baseUnit) {
                            ForEach(units, id: \.self){
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section ("Convert to") {
                        Picker("Base Unit", selection: $endUnit) {
                            ForEach(units, id: \.self){
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section ("Converted Value") {
                        Text (convertUnit)
                    }
                }
                .navigationTitle("Convert Unit")
            }
        }
    }
}
