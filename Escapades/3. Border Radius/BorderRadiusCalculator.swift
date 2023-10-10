//
//  AppleMoreInformation.swift
//  Escapades
//
//  Created by Raphael Salaja on 09/10/2023.
//

import Observation
import SwiftUI

struct BorderRadiusCalculator: View {
    @State var outer: Double = 64
    @State var inner: Double = 32
    @State var padding: Double = 24
    
    init(outer: Double = 64,
         inner: Double = 32,
         padding: Double = 24)
    {
        self.outer = outer
        self.inner = inner
        self.padding = padding
    }
    
    public func animations(state: String) {
        switch state {
        case "outer":
            withAnimation(.bouncy) {
                inner = outer - padding
            }
        case "inner":
            withAnimation(.bouncy) {
                outer = inner + padding
            }
        case "padding":
            withAnimation(.bouncy) {
                inner = outer - padding
                outer = inner + padding
            }
        default:
            break
        }
    }
    
    func calculate_offset(position: String) -> CGSize {
        switch position {
        case "outer":
            return CGSize(
                width: (-290 / 2) - (-outer / 3) - 32,
                height: (-290 / 2) - (-outer / 3) - 32
            )
        case "inner":
            return CGSize(
                width: (-290 / 5) - (-inner / 3) - 32,
                height: (-290 / 5) - (-inner / 3) - 32
            )
        default:
            return CGSize(
                width: 0,
                height: 0
            )
        }
    }
    
    func randomize() {
        withAnimation(.bouncy) {
            outer = Double.random(in: 16...96)
            inner = Double.random(in: 32...64)
            padding = Double.random(in: 16...32)
        }
    }
    
    var body: some View {
        VStack(spacing: -32) {
            ZStack {
                BorderRadiusTextDebug(value: $outer,
                                      color: .green,
                                      offset: calculate_offset(position: "outer"))
                        
                BorderRadiusTextDebug(value: $inner,
                                      color: .blue,
                                      offset: calculate_offset(position: "inner"))
                        
                BorderRadiusTextDebug(value: $padding,
                                      color: .orange,
                                      offset: CGSize(width: 0, height: -145 + padding / 2),
                                      isPadding: true)
                        
                BorderRadiusCalculatorIllustration(outer: $outer,
                                                   inner: $inner,
                                                   padding: $padding)
            }
                
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .mask(LinearGradient(
                gradient:
                Gradient(
                    stops: [.init(color: .clear, location: 0),
                            .init(color: .clear, location: 0.40),
                            .init(color: .black, location: 0.80)]),
                startPoint: .bottom, endPoint: .center
            ))
            .onChange(of: outer, initial: true) {
                animations(state: "outer")
            }
            .onChange(of: inner, initial: true) {
                animations(state: "inner")
            }
            .onChange(of: padding, initial: true) {
                animations(state: "padding")
            }
                
            VStack(spacing: 16) {
                VStack {
                    Text(
                        """
                        Outer Radius = Inner Radius + Padding
                        """
                    )
                    .font(.system(.body, design: .rounded, weight: .bold))
                    .foregroundColor(Color(.secondaryLabel))
                    .contentTransition(.interpolate)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemFill))
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    
                HStack {
                    BorderRadiusTextBadge(color: .green, text: "Outer")
                    BorderRadiusTextField(value: $outer, color: .green, text: "Outer")
                    Slider(value: $outer, in: 16...96, step: 1).accentColor(.green)
                }
                    
                HStack {
                    BorderRadiusTextBadge(color: .blue, text: "Inner")
                    BorderRadiusTextField(value: $inner, color: .blue, text: "Inner")
                    Slider(value: $inner, in: 32...64, step: 1).accentColor(.blue)
                }
                    
                HStack {
                    BorderRadiusTextBadge(color: .orange, text: "Padding")
                    BorderRadiusTextField(value: $padding, color: .orange, text: "Padding")
                    Slider(value: $padding, in: 16...32, step: 1).accentColor(.orange)
                }
                    
                Button(action: randomize) {
                    VStack {
                        Text("Randomize")
                            .font(.system(.body, design: .rounded, weight: .bold))
                            .foregroundColor(Color(.secondaryLabel))
                            .contentTransition(.interpolate)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.secondarySystemFill))
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
            }
            .padding(24)
            .frame(maxHeight: nil, alignment: .top)
            .background {
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 24, topTrailing: 24))
                    .fill(Color(.secondarySystemBackground))
                    .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .animation(.none)
        .navigationTitle("Border Radius Calculator")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BorderRadiusCalculator()
}
