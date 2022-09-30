//
//  ContentView.swift
//  ChartsInSwiftUI
//
//  Created by Ramill Ibragimov on 30.09.2022.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    let weekdays = Calendar.current.shortWeekdaySymbols
    let workouts = [45, 60, 55, 35, 70, 20, 65]
    
    var body: some View {
        VStack {
            Text("Chart in SwiftUI")
            Chart {
                ForEach(weekdays.indices, id: \.self) { idx in
                    BarMark(x: .value("Workout", workouts[idx]), y: .value("Day", weekdays[idx]))
                        .foregroundStyle(by: .value("Day", weekdays[idx]))
                        .annotation(position: .overlay) {
                            Text("\(workouts[idx]) mins")
                                .font(.caption.bold())
                                .foregroundColor(.white)
                        }
                }
            }
            .frame(height: 330)
            .padding(.vertical, 40)
            
            Chart {
                ForEach(weekdays.indices, id: \.self) { idx in
                    BarMark(x: .value("Day", weekdays[idx]), y: .value("Workout", workouts[idx]))
                        .foregroundStyle(by: .value("Day", weekdays[idx]))
                        .annotation {
                            Text("\(workouts[idx]) mins")
                                .font(.caption.bold())
                        }
                }
            }.frame(height: 200)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
