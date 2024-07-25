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

struct ReferenceOffsetView: View {
    @State private var referenceDate: SpecialDate = SpecialDate.dates[0]
    var body: some View {
        NavigationStack {
            Form {
                Section("Constants") {
                    LabeledContent("Now") {
                        Text(Date.now, format: .dateTime)
                    }
                    LabeledContent("Tomorrow") {
                        Text(Date.tomorrow, format: .dateTime)
                    }
                    LabeledContent("Yesterday") {
                        Text(Date.yesterday, format: .dateTime)
                    }
                    LabeledContent("Next Month") {
                        Text(Date.nextMonth, format: .dateTime)
                    }
                    LabeledContent("Next New Year") {
                        Text(Date.startOfNextYear, format: .dateTime)
                    }
                    LabeledContent("Last New Year") {
                        Text(Date.startOfThisYear, format: .dateTime)
                    }
                }
                Section("References from Now") {
                    LabeledContent {
                        Text("Reference Here")
                    } label: {
                        Picker("Reference Date", selection: $referenceDate) {
                            ForEach(SpecialDate.dates, id: \.name) { date in
                                Text(date.name).tag(date)
                            }
                        }
                        .labelsHidden()
                    }
                }
                Section("Offset from now") {
                    LabeledContent {
                        Text("Offset Here")
                    } label: {
                        Picker("Offset", selection: $referenceDate) {
                            ForEach(SpecialDate.dates, id: \.name) { date in
                                Text(date.name).tag(date)
                            }
                        }
                        .labelsHidden()
                    }
                    
                }
            }
            .navigationTitle("Reference/Offset")
        }
    }
}

#Preview {
    ReferenceOffsetView()
}
