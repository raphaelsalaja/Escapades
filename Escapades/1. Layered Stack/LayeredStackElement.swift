//
//  LayeredStackElement.swift
//  Escapades
//
//  Created by Raphael Salaja on 03/10/2023.
//

import SwiftUI

struct LayeredStackElement: View {
    @State var object: Transaction
    
    @Binding var show: Bool
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    func setColor(type: TransactionType) -> Color {
        switch type {
        case .Grocieries:
            return Color(.systemRed)
        case .Restaurants:
            return Color(.systemOrange)
        case .Entertainment:
            return Color(.systemYellow)
        case .Bills:
            return Color(.systemGreen)
        case .Travel:
            return Color(.systemTeal)
        case .Subscription:
            return Color(.systemBlue)
        case .Taxes:
            return Color(.systemIndigo)
        case .Salary:
            return Color(.systemPurple)
        case .Gifts:
            return Color(.systemPink)
        }
    }
    
    var body: some View {
        if show {
            HStack(spacing: 12) {
                Image(systemName: object.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .font(.system(.subheadline, design: .rounded, weight: .bold))
                    .scaleEffect(0.5)
                    .foregroundColor(.white)
                    .background(setColor(type: object.type))
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(object.name)
                        .font(.system(.subheadline, design: .rounded, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Text(object.type.rawValue)
                        .font(.system(.subheadline, design: .rounded, weight: .medium))
                        .foregroundColor(Color(.secondaryLabel))
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(NumberFormatter.localizedString(
                        from: object.amount as NSNumber,
                        number: .currency)
                    )
                    .font(.system(.subheadline, design: .rounded, weight: .bold))
                    .foregroundColor(object.amount < 0 ? .red : .green)
                    
                    Text(formatter.string(from: object.date))
                        .font(.system(.subheadline, design: .rounded, weight: .medium))
                        .foregroundColor(Color(.secondaryLabel))
                }
            }
            .padding(16)
            .extendedBackground(radius: 20,
                                borderLineWidth: 1,
                                backgroundColor: .white,
                                borderColor: Color(.systemGray6))
            .shadow(color: Color(.systemGray6), radius: 5, x: 0, y: 5)
        }
    }
}

#Preview {
    LayeredStackElement(object: SampleTransactions().data[0], show: .constant(true))
}
