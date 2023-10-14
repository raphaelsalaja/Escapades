//
//  LayeredStackShowcase.swift
//  Escapades
//
//  Created by Raphael Salaja on 03/10/2023.
//

import Charts
import SwiftUI

struct LayeredStackShowcase: View {
    @Namespace private var namespace
    
    @State var collapsed: Bool = false
    @State var show: Bool = true
    @State var spacing: CGFloat
    @State var data: [Transaction] = SampleTransactions().data
    @State var pressed: Bool = false
    
    internal init(
        collapsed: Bool = false,
        spacing: CGFloat = 8
    ) {
        self.collapsed = collapsed
        self.spacing = spacing
    }

    func changeSpacing() {
        withAnimation(.bouncy) {
            self.spacing = self.spacing == 8 ? -64 : 8
            self.collapsed.toggle()
        }
        
        withAnimation(.bouncy) {
            self.show.toggle()
        }
    }
    
    func sortByDate(this: Transaction, that: Transaction) -> Bool {
        return this.date > that.date
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                VStack {
                    HStack {
                        Text("Wallet")
                            .font(.system(.title3, design: .rounded, weight: .bold))
                            .foregroundColor(.primary)
                            
                        Spacer()
                            
                        Button(action: { changeSpacing() }) {
                            HStack {
                                Text("Settings")
                                    .font(.system(.subheadline, design: .rounded, weight: .medium))
                                    .foregroundColor(Color(.secondaryLabel))
                                    .transition(.opacity)
                                    .id(collapsed.description)
                            }
                            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            .extendedBackground(radius: 100,
                                                borderLineWidth: 1,
                                                backgroundColor: .white,
                                                borderColor: Color(.systemGray6))
                        }
                    }
                        
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(.systemGray6))
                        .frame(width: .infinity, height: 300)
                }
                    
                VStack {
                    HStack {
                        Text("Transactions")
                            .font(.system(.title3, design: .rounded, weight: .bold))
                            .foregroundColor(.primary)
                            
                        Spacer()
                            
                        Button(action: { changeSpacing() }) {
                            HStack {
                                Text(collapsed ? "Expand" : "Collapse")
                                    .font(.system(.subheadline, design: .rounded, weight: .medium))
                                    .foregroundColor(Color(.secondaryLabel))
                                    .transition(.opacity)
                                    .id(collapsed.description)
                                    
                                Image(systemName: "chevron.down")
                                    .font(.system(.subheadline, design: .rounded, weight: .medium))
                                    .foregroundColor(Color(.secondaryLabel))
                                    .rotationEffect(.degrees(collapsed ? -90 : 0))
                            }
                            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            .extendedBackground(radius: 100,
                                                borderLineWidth: 1,
                                                backgroundColor: .white,
                                                borderColor: Color(.systemGray6))
                        }
                    }
                        
                    VStack(spacing: spacing) {
                        ForEach(Array(data.sorted(by: sortByDate).enumerated()), id: \.offset) {
                            index, transaction in
                                
                            let scale = 1.0 - (0.05 * Double(index))
                            let opacity = 1.0 - (0.1 * Double(index))
                            let offset = index > 3
                             
                            if offset {
                                LayeredStackElement(object: transaction, show: $show)
                                    .zIndex(Double(data.count - index))
                                    .opacity(collapsed ? CGFloat(opacity) : 1.0)
                                    .scaleEffect(collapsed ? CGFloat(scale) : 1.0)
                                    .matchedGeometryEffect(
                                        id: "layered.stack.element.\(index)",
                                        in: namespace
                                    )
                            }
                            else {
                                LayeredStackElement(object: transaction, show: .constant(true))
                                    .zIndex(Double(data.count - index))
                                    .opacity(collapsed ? CGFloat(opacity) : 1.0)
                                    .scaleEffect(collapsed ? CGFloat(scale) : 1.0)
                                    .matchedGeometryEffect(
                                        id: "layered.stack.element.\(index)",
                                        in: namespace
                                    )
                            }
                        }
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading
                    )
                    .matchedGeometryEffect(
                        id: "layered.stack",
                        in: namespace
                    )
                        
                    Spacer()
                }
                    
            }.padding()
                    
        }.background(.white.tertiary)
    }
}

#Preview {
    LayeredStackShowcase()
}
