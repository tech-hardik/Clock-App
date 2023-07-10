//
//  ClockView.swift
//  ClockApp
//
//  Created by alex on 3/15/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            StopWatchView()
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("Stopwatch")
                }
            
            AlarmView()
                .tabItem {
                    Image(systemName: "alarm")
                    Text("Alarm")
                }
            
            TimerView()
                .tabItem {
                    Image(systemName: "timer")
                    Text("Timer")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
