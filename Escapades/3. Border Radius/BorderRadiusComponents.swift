//
//  BorderRadius+Modifiers.swift
//  Escapades
//
//  Created by Raphael Salaja on 10/10/2023.
//

import SwiftUI

struct BorderRadiusTextDebug: View {
    @Binding var value: Double

    var color: Color
    var offset: CGSize
    var isPadding: Bool = false

    var body: some View {
        if isPadding {
            Rectangle()
                .fill(color.quaternary)
                .frame(width: 32, height: value, alignment: .bottom)
                .overlay(
                    Text("\(value, specifier: "%.0f")")
                        .font(.system(.caption, design: .rounded, weight: .bold))
                        .foregroundColor(color)
                        .contentTransition(.interpolate)
                )
                .offset(offset)
                .zIndex(2)
        }
        else {
            Circle()
                .fill(color.quaternary)
                .frame(width: 32, height: 32)
                .overlay(
                    Text("\(value, specifier: "%.0f")")
                        .font(.system(.caption, design: .rounded, weight: .bold))
                        .foregroundColor(color)
                        .contentTransition(.interpolate)
                )
                .offset(offset)
                .zIndex(2)
        }
    }
}

struct BorderRadiusTextBadge: View {
    var color: Color
    var text: String

    init(color: Color, text: String) {
        self.color = color
        self.text = text
    }

    var body: some View {
        VStack {
            Text(text)
                .font(.system(.body, design: .rounded, weight: .bold))
                .foregroundStyle(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .background(color.quaternary)
        .foregroundStyle(color)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct BorderRadiusTextField: View {
    @Binding var value: Double
    var color: Color
    var text: String

    var body: some View {
        TextField(text, value: $value, formatter: NumberFormatter())
            .font(.system(.body, design: .rounded, weight: .bold))
            .multilineTextAlignment(.center)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .frame(maxWidth: .infinity)
            .background(color.quaternary)
            .foregroundStyle(color)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
