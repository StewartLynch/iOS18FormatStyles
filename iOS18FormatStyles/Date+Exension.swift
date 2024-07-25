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

import Foundation
extension Date {
    func startOfDay() -> Date {
        Calendar.current.startOfDay(for: self)
    }
    
    static var startOfNextYear: Date {
        let nextYear = Calendar.current.date(byAdding: .year, value: 1, to: Date.now)!
        return Calendar.current.date(from: Calendar.current.dateComponents([.year], from: nextYear))!
    }
    
    static var startOfThisYear: Date {
        return Calendar.current.date(byAdding: .year, value: -1, to: startOfNextYear)!
    }
    static var nextMonth: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month], from: Date.now)
        components.month! += 1
        
        // Handle the case where adding 1 to the month results in a month value of 13, which means we need to increment the year and reset the month to 1
        if components.month! > 12 {
            components.year! += 1
            components.month = 1
        }
        
        return calendar.date(from: components)!
    }
    
    static var tomorrow: Date {
        let tomorowSameTime = Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!
        return tomorowSameTime.startOfDay()
    }
    
    static var yesterday: Date {
        Date.now.startOfDay().addingTimeInterval(-1)
    }
    
    static var oneMinute: Date {
        Date.now.addingTimeInterval(60)
    }
}
