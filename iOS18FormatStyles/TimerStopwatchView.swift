//
//  TimerStopwatchView.swift
//  iOS18FormatStyles
//
//  Created by Stewart Lynch on 2024-07-24.
//

import SwiftUI

struct TimerStopwatchView: View {
    let now: TimeDataSource<Date> = .currentDate
    @State private var start: Date?
    @State private var end: Date?
    @State private var stopwatchStart: Date?
    var range: Range<Date>? {
        if let start, let end {
            return start..<end
        } else {
            return nil
        }
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("Digital Clock") {
                    Text(now, format: .dateTime.hour().minute().second())
                        .font(.largeTitle)
                        .bold()
                        .monospacedDigit()
                }
                Button("Set Timer") {
                    start = Date(timeIntervalSinceNow: 10)
                    end = Date(timeIntervalSinceNow: 24)
                }
                Section("Timer") {
                    if let start, let end {
                        Group {
                            LabeledContent("Starts at") {
                                Text(start, format: .dateTime.hour().minute().second())
                            }
                            LabeledContent("Ends at") {
                                Text(end, format: .dateTime.hour().minute().second())
                            }
                        }
                        .font(.title)
                        .frame(width: 300)
                    }
                    if let range {
                        Group {
                            Text(now, format: .timer(countingDownIn: range))
                            Text(
                                now,
                                format: .timer(
                                    countingUpIn: range,
                                    showsHours: false,
                                    maxFieldCount: 3,
                                    maxPrecision: .microseconds(10)
                                )
                            )
                        }
                        .font(.largeTitle)
                        .bold()
                        .monospacedDigit()
                    }
                }
                Section("StopWatch") {
                    
                    Button("Start") {
                        stopwatchStart = Date.yesterday
                    }
                    if let stopwatchStart {
                        Text(
                            now,
                            format: .stopwatch(
                                startingAt: stopwatchStart,
                                showsHours: true,
                                maxFieldCount: 3,
                                maxPrecision: .microseconds(10)
                            )
                        )
                        .font(.largeTitle)
                        .bold()
                        .monospacedDigit()
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
