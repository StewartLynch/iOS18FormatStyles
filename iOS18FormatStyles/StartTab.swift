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

struct StartTab: View {
    var body: some View {
        TabView {
            ReferenceOffsetView()
                .tabItem {
                    Label("Reference/Offset", systemImage: "1.circle.fill")
                }
            TimeDataSourceView()
                .tabItem {
                    Label("TimeDataSource", systemImage: "2.circle.fill")
                }
            TimerStopwatchView()
                .tabItem {
                    Label("Timer/Stopwatch", systemImage: "3.circle.fill")
                }
        }
    }
}

#Preview {
    StartTab()
}
