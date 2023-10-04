//
//  SwiftUIView.swift
//  Escapades
//
//  Created by Raphael Salaja on 03/10/2023.
//

import SwiftUI

// MARK: - Transition

struct RoundedRectangleWithBorder: ViewModifier {
    var radius: CGFloat
    var borderLineWidth: CGFloat = 1
    var backgroundColor: Color = .clear
    var borderColor: Color = .gray
    var antialiased: Bool = true

    let namespace: Namespace.ID = Namespace().wrappedValue

    func body(content: Content) -> some View {
        content
            .background(self.backgroundColor)
            .cornerRadius(self.radius, antialiased: self.antialiased)
            .overlay(
                RoundedRectangle(cornerRadius: self.radius)
                    .strokeBorder(self.borderColor, lineWidth: self.borderLineWidth, antialiased: self.antialiased)
            )
    }
}

extension Date {
    static func randomBetween(start: String, end: String, format: String = "DD-MM-YYYY") -> String {
        let date1 = Date.parse(start, format: format)
        let date2 = Date.parse(end, format: format)
        return Date.randomBetween(start: date1, end: date2).dateString(format)
    }

    static func randomBetween(start: Date, end: Date) -> Date {
        let date1 = min(start, end)
        var date2 = max(start, end)

        if date1 == date2 {
            date2 = date1.addingTimeInterval(120)
        }

        let span = TimeInterval.random(in: date1.timeIntervalSinceNow ... date2.timeIntervalSinceNow)
        return Date(timeIntervalSinceNow: span)
    }

    func dateString(_ format: String = "DD-MM-YYYY") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    static func parse(_ string: String, format: String = "DD-MM-YYYY") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format

        let date = dateFormatter.date(from: string)!
        return date
    }
}

extension View {
    func extendedBackground(radius: CGFloat,
                            borderLineWidth: CGFloat = 1,
                            backgroundColor: Color = .clear,
                            borderColor: Color = .gray,
                            antialiased: Bool = true) -> some View
    {
        modifier(
            RoundedRectangleWithBorder(
                radius: radius,
                borderLineWidth: borderLineWidth,
                backgroundColor: backgroundColor,
                borderColor: borderColor,
                antialiased: antialiased
            )
        )
    }

    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
