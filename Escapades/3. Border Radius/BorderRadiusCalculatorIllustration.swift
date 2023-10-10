//
//  BorderRadiusCalculatorIllustration.swift
//  Escapades
//
//  Created by Raphael Salaja on 10/10/2023.
//

import SwiftUI

struct BorderRadiusCalculatorIllustration: View {
    @Binding var outer: Double
    @Binding var inner: Double
    @Binding var padding: Double

    let gradient_outer = LinearGradient(
        gradient: Gradient(
            stops: [.init(color: .clear, location: 0.8),
                    .init(color: .green, location: 1.0)]
        ),
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )

    let gradient_inner = LinearGradient(
        gradient: Gradient(
            stops: [.init(color: .clear, location: 0.8),
                    .init(color: .blue, location: 1.0)]
        ),
        startPoint: .bottomLeading,
        endPoint: .topTrailing
    )

    var body: some View {
        VStack(spacing: 16) {
            VStack {}
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.green)
                .background {
                    RoundedRectangle(
                        cornerRadius: inner
                    )
                    .stroke(Color(.systemFill), lineWidth: 4)

                    RoundedRectangle(
                        cornerRadius: inner
                    )
                    .stroke(gradient_inner, lineWidth: 4)
                    .rotationEffect(Angle(degrees: 270))
                }
        }
        .padding(padding)
        .frame(width: 290, height: 290)
        .foregroundStyle(.green)
        .background {
            RoundedRectangle(
                cornerRadius: outer
            )
            .stroke(Color(.systemFill), lineWidth: 4)

            RoundedRectangle(
                cornerRadius: outer
            )

            .stroke(gradient_outer, lineWidth: 4)
            .rotationEffect(Angle(degrees: 270))
        }
    }
}

#Preview {
    BorderRadiusCalculatorIllustration(outer: .constant(64),
                                       inner: .constant(32),
                                       padding: .constant(24))
}
