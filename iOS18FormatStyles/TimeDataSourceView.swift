//
// ----------------------------------------------
// Original project: iOS18FormatStyles
// by  Stewart Lynch on 2024-07-24
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
// ----------------------------------------------
// Copyright © 2024 CreaTECH Solutions. All rights reserved.


import SwiftUI

struct TimeDataSourceView: View {
    let now: TimeDataSource<Date> = .currentDate
    var body: some View {
        NavigationStack {
            Form {
                Section("Digital Clock") {
                    Text(now, format: .dateTime.hour().minute().second())
                        .font(.largeTitle)
                        .bold()
                        .monospacedDigit()
                }
                Section("Reference") {
                    // How long until?
                    let futureDate = Date.now.addingTimeInterval(7)
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
                    // Time since last mistake
                    let lastMistake = Date.now.addingTimeInterval(-1000000)
                    Text(
                        now,
                        format: .offset(
                            to: lastMistake,
                            allowedFields: [.year, .month, .day, .week],
                            maxFieldCount: 4,
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
