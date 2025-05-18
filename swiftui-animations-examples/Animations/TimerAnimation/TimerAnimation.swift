//
//  TimerAnimation.swift
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 18/05/2025.
//

import SwiftUI

public struct TimerAnimation: View {
    let width: CGFloat
    
    public init(width: CGFloat = 100) {
        self.width = width
    }
    
    public var body: some View {
        TimelineView(.periodic(from: .now, by: 1)) { context in
            
            HStack(spacing: 8) {
                TimeComponentView(value: context.date.getHour(), label: "HH")
                TimeComponentView(value: context.date.getMinute(), label: "MM")
                TimeComponentView(value: context.date.getSecond(), label: "SS")
            }
        }
    }
}

struct TimeComponentView: View {
    let value: Int
    let label: String
    var body: some View {
        VStack {
            Text(label)
            Text(String(format: "%02d", value))
                .foregroundStyle(.white)
                .contentTransition(.numericText())
                .animation(.linear, value: value)
                .font(.system(size: 20, weight: .bold))
                .monospacedDigit()
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 8)
                }
        }
    }
}

#Preview {
    TimerAnimation()
}

extension Date {
    // Get hour component from a Date
    func getHour() -> Int {
        return Calendar.current.component(.hour, from: self)
    }

    // Get minute component from a Date
    func getMinute() -> Int {
        return Calendar.current.component(.minute, from: self)
    }

    // Get second component from a Date
    func getSecond() -> Int {
        return Calendar.current.component(.second, from: self)
    }
}
