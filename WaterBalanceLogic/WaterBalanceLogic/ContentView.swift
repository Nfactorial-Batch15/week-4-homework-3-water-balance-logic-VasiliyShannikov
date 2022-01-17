//
//  ContentView.swift
//  WaterBalanceLogic
//
//  Created by Vasiliy Shannikov on 17.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 1
    @ObservedObject var data: ProgrammData
    var body: some View {
        TabView(selection: $selectedTab) {
            Main1(data: data)
                .tabItem {
                    Label("Main", systemImage: "house.fill")
                }
                .tag(1)
            
            Settings( data: data)
                .tabItem {
                    Label("Settings", systemImage: "slider.vertical.3")
                }
                .tag(2)
            
            History(data: data)
                .tabItem {
                    Label("History", systemImage: "doc.fill")
                }
                .tag(3)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(data: ProgrammData())
    }
}
