//
//  WaterBalanceLogicApp.swift
//  WaterBalanceLogic
//
//  Created by Vasiliy Shannikov on 17.01.2022.
//

import SwiftUI
import UserNotifications

@main
struct WaterBalanceLogicApp: App {
    @StateObject var data = ProgrammData()
    let date = Date()
    @State var isFirstEnter = UserDefaults.standard.bool(forKey: "isInitiolized")

    var body: some Scene {
        WindowGroup {
            if !isFirstEnter {
                OnBoard1(isFistTime: $isFirstEnter, data: data)
            } else {
                ContentView(data: data).onAppear {
                    let day: Int = get_day(d: date)
                    let yesterday = day - 1
                    let month: Int = get_month(d: date)
                    let year = get_year(d: date)
                    data.today = String(day/10) + String(day%10) + "." + String(month/10) + String(month%10) + "." + String(year/10) + String(year%10)
                    data.yesterday = String(yesterday/10) + String(yesterday%10) + "." + String(month/10) + String(month%10) + "." + String(year/10) + String(year%10)
                    

                }
            }
        }
    }
}
