//
//  TimeDataSourceView.swift
//  iOS18FormatStyles
//
//  Created by Stewart Lynch on 2024-07-24.
//

import SwiftUI

struct TimeDataSourceView: View {
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
                Section("Reference") {
                    // How long until?
                    let futureDate = Date.now.addingTimeInterval(7000)
                    Text(
                        now,
                        format: .reference(
                            to: futureDate,
                            allowedFields: [.year, .month, .day, .hour, .minute, .second],
                            maxFieldCount: 3,
                            thresholdField: .year
                        )
                    )
                }
                Section("Offset") {
                    // Time since last mistack
                    let lastMistack = Date.now.addingTimeInterval(-7)
                    Text(
                        now,
                        format: .offset(
                            to:lastMistack,
                            allowedFields: [.year, .month, .day, .hour, .minute, .second],
                            maxFieldCount: 7,
                            sign: .automatic
                        )
                    )
                }
            }
                .navigationTitle("TimeDataSource")
        }
    }
}

#Preview {
    TimeDataSourceView()
}
