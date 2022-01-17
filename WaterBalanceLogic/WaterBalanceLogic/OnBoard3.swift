//
//  OnBoard3.swift
//  Water Balance UI
//
//  Created by Vasiliy Shannikov on 10.12.2021.
//

import SwiftUI

struct OnBoard3: View {
    let headerColor:Color = Color(red: 5.0 / 255, green: 165.0 / 255, blue:239.0 / 255, opacity: 1.0)
    var goalNomber: String
    @AppStorage("goalVolume1") var goalVolume1 = 0
    @AppStorage("goalVolume2") var goalVolume2 = 0
    @AppStorage("goalVolume3") var goalVolume3 = 0
    @AppStorage("goalVolume4") var goalVolume4 = 0
    @AppStorage("isInitiolized") var isInitiolized = false
    @Binding var isFistTime: Bool
    @State var volume = ""
    @ObservedObject var data: ProgrammData
    var body: some View {
        VStack{
//            LeftButton()
//                .padding(.bottom,29)
//                .padding(.trailing,350
//                )
            Text("WATER BALANCE")
                .font(.system(size: 24))
                .italic()
                .fontWeight(.black)
                .foregroundColor(headerColor)
                .padding(.bottom, 62)
            
            Text("What is your goal?")
                .font(.system(size: 36))
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 212 / 255, green: 225 / 255, blue: 248 / 255))
                    .frame(height: 108)
                
               
                HStack(alignment: .center, spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color( red: 252, green: 253, blue: 255, opacity: 1))
                            .frame(height: 60)
                        TextField(getCurrentVol(goalNr: goalNomber), text: $volume)
                            .foregroundColor(.blue)
                            .disableAutocorrection(true)
                            .font(.system(size: 16))
                            .frame(width: 250, height: 60)
                            .multilineTextAlignment(.center)
                      
                    }
                   
                    Spacer()
                    Text("ML")
                        .padding(.trailing, 43)
                }
                .padding(.leading,19)
            }
            .padding(.bottom, 77)
            .padding(.horizontal, 19)
            
            NextButton(title: "Save") {
                var volSetpoint:Int = 0
                if let a = Int(volume) {
                    volSetpoint = a
                    isInitiolized = true
                    isFistTime = true
                }
                
                switch goalNomber {
                case "goal1" :
                    goalVolume1 = volSetpoint
                case "goal2" :
                    goalVolume2 = volSetpoint
                case "goal3" :
                    goalVolume3 = volSetpoint
                case "goal4" :
                    goalVolume4 = volSetpoint
                default:
                    goalVolume1 = 0
                    goalVolume2 = 0
                    goalVolume3 = 0
                    goalVolume4 = 0
                }
                data.currentDaylyIntake = Double(volSetpoint) / 1000
            }
          Spacer()
        }
        .frame(width: 400, height: 780)
    }
    func getCurrentVol (goalNr: String) -> String {
        var res = ""
        switch goalNr {
        case "goal1":
           res = String(goalVolume1)
        case "goal2":
           res = String(goalVolume2)
        case "goal3":
           res = String(goalVolume3)
        case "goal4":
           res = String(goalVolume4)
        default:
            res = "0"
        }
        return res
    }
}

struct OnBoard3_Previews: PreviewProvider {
    static var previews: some View {
        OnBoard3(goalNomber: "", isFistTime: .constant(false), data: ProgrammData())
    }
}
