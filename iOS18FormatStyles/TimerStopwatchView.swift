//
//  TimerStopwatchView.swift
//  iOS18FormatStyles
//
//  Created by Stewart Lynch on 2024-07-24.
//

import SwiftUI

struct TimerStopwatchView: View {
    @State var start: Date?
    @State var stopWatchStart: Date?
    @State var end: Date?
    @State var range: Range<Date>?
    let now: TimeDataSource<Date> = .currentDate
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Digital Clock") {
                    Text(now, format: .dateTime.hour().minute().second())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .monospacedDigit()
                }
                Button("Set Timer") {
                    start = Date(timeIntervalSinceNow: 5)
                    end = Date(timeIntervalSinceNow: 19)
                    range = start!..<end!
                }
                Section("Timer") {
                    if let start, let end, let range {
                        Group {
                            LabeledContent("Starts at:") {
                                Text(start, format: .dateTime.hour().minute().second().second())
                            }
                            LabeledContent("Ends at:") {
                                Text(end, format: .dateTime.hour().minute().second())
                            }
                        }
                        
                        .font(.title)
                        .frame(width:300)
                        Text(now, format: .timer(countingDownIn: range))
                            .font(.largeTitle).bold()
                            .monospacedDigit()
                        Text(
                            now,
                            format: .timer(
                                countingUpIn: range,
                                showsHours: false,
                                maxFieldCount: 7,
                                maxPrecision: .microseconds(10)
                            )
                        )
                        .font(.largeTitle).bold()
                        .monospacedDigit()
                            
                    }
                }
                Section("StopWatch") {
                    if let stopWatchStart {
                        Text(
                            now,format:
                            .stopwatch(
                                startingAt: stopWatchStart,
                                showsHours: false,
                                maxFieldCount: 5,
                                maxPrecision: .microseconds(10)
                            )
                        )
                        .font(.largeTitle).bold()
                        .monospacedDigit()
                    }
                    Button(stopWatchStart == nil ? "Start" : "Stop") {
                        if stopWatchStart == nil {
                            stopWatchStart = Date.now
                            
                        } else {
                            stopWatchStart = nil
                        }
                    }
                }
            }
            .navigationTitle("Timer/Stopwatch")
        }
    }
}

#Preview {
    TimerStopwatchView()
}
