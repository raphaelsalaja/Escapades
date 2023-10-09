//
//  NotificationStackShowcase.swift
//  Escapades
//
//  Created by Raphael Salaja on 04/10/2023.
//

import SwiftUI

struct Notifications: Identifiable {
    var id: UUID = .init()
    var color: Color

    internal init(id: UUID = UUID(), color: Color) {
        self.id = id
        self.color = color
    }
}

struct NotificationsSampleData {
    var data = [
        Notifications(color: .red),
        Notifications(color: .blue),
        Notifications(color: .green),
        Notifications(color: .yellow),
        Notifications(color: .purple),
        Notifications(color: .orange),
        Notifications(color: .pink),
        Notifications(color: .gray)
    ]
}

struct NotificationStackShowcase: View {
    var items = NotificationsSampleData().data

    var body: some View {
        NavigationStack {
            VStack {
                NotificationStack(items) { item in
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(item.color)
                        .frame(height: 400)
                }
            }.padding(64)
        }
    }
}

#Preview {
    NotificationStackShowcase()
}
