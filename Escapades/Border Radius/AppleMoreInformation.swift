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
    @State var inner: Double = 48
    @State var padding: Double = 24
    
    init(outer: Double = 64,
         inner: Double = 48,
         padding: Double = 24)
    {
        self.outer = outer
        self.inner = inner
        self.padding = padding
    }
    
    func calculate() {}
    
    func animations(state: String) {
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
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Spacer()
                ZStack {
                    Text("\(outer, specifier: "%.0f")")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(8)
                        .background(.green.quaternary)
                        .clipShape(Circle())
                        .offset(x: -150, y: -150)
                        .zIndex(2)
                    
                    Text("\(inner, specifier: "%.0f")")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(8)
                        .background(.blue.quaternary)
                        .clipShape(Circle())
                        .offset(x: -75, y: -75)
                        .zIndex(2)
                    
                    VStack {
                        Text("\(padding, specifier: "%.0f")")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.bold)
                    }
                    .padding(8)
                    .frame(height: padding)
                    .foregroundColor(.orange)
                    .background(.orange.quaternary)
                    .offset(x: 0, y: -145 + padding / 2)
                    .zIndex(2)
                    
                    VStack(spacing: 16) {
                        VStack {}
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundStyle(.green)
                            .background {
                                RoundedRectangle(
                                    cornerRadius: inner
                                )
                                .stroke(Color(.systemFill), lineWidth: 4)
                                .rotationEffect(Angle(degrees: 90))
                                
                                RoundedRectangle(
                                    cornerRadius: inner
                                )
                                .trim(from: 0.8, to: 0.95)
                                .stroke(.blue.secondary, lineWidth: 4)
                                .rotationEffect(Angle(degrees: 270))
                            }
                            .onChange(of: inner, initial: true) {
                                animations(state: "inner")
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
                        .rotationEffect(Angle(degrees: 90))
                        
                        RoundedRectangle(
                            cornerRadius: outer
                        )
                        .trim(from: 0.8, to: 0.95)
                        .stroke(.green.secondary, lineWidth: 4)
                        .rotationEffect(Angle(degrees: 270))
                    }
                    .onChange(of: outer, initial: true) {
                        animations(state: "outer")
                    }
                }
                
                HStack(spacing: 32) {
                    VStack {
                        HStack {
                            VStack {
                                Text("Outer")
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.primary)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            .background(.green.quaternary)
                            .foregroundStyle(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            
                            TextField("Outer", value: $outer, formatter: NumberFormatter())
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                .multilineTextAlignment(.center)
                                .background(.green.quaternary)
                                .foregroundStyle(.green)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                .onChange(of: outer, initial: true) {
                                    animations(state: "outer")
                                }
                            
                            Slider(value: $outer, in: 16...96, step: 1)
                                .onChange(of: outer, initial: true) {
                                    animations(state: "outer")
                                }
                        }
                        
                        HStack {
                            VStack {
                                Text("Inner")
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.primary)
                            }
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            .frame(maxWidth: .infinity)
                            .background(.blue.quaternary)
                            .foregroundStyle(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            
                            TextField("Inner", value: $inner, formatter: NumberFormatter())
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                .background(.blue.quaternary)
                                .foregroundStyle(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                .onChange(of: inner, initial: true) {
                                    animations(state: "inner")
                                }
                            
                            Slider(value: $inner, in: 32...64, step: 1)
                        }
                        
                        HStack {
                            VStack {
                                Text("Padding")
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.primary)
                            }
                            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                            .frame(maxWidth: .infinity)
                            .background(.orange.quaternary)
                            .foregroundStyle(.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            
                            TextField("Padding", value: $padding, formatter: NumberFormatter())
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                .multilineTextAlignment(.center)
                                .background(.orange.quaternary)
                                .foregroundStyle(.orange)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                .onChange(of: padding, initial: true) {
                                    animations(state: "padding")
                                }
                            
                            Slider(value: $padding, in: 16...32, step: 1)
                        }
                    }
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    BorderRadiusCalculator()
}
