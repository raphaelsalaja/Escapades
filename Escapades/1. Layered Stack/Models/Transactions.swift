//
//  Transactions.swift
//  Escapades
//
//  Created by Raphael Salaja on 03/10/2023.
//

import SwiftUI

enum TransactionType: String {
    case Grocieries
    case Restaurants
    case Entertainment
    case Bills
    case Travel
    case Subscription
    case Taxes
    case Salary
    case Gifts
}

struct Transaction: Identifiable {
    var id = UUID()
    var name: String
    var icon: String
    var amount: Double
    var date: Date
    var type: TransactionType

    internal init(id: UUID = UUID(),
                  name: String,
                  icon: String,
                  amount: Double = Double.random(in: -100000 ... -1),
                  date: Date = Date.randomBetween(start: Date.parse("01-01-2023"), end: Date.now),
                  type: TransactionType)
    {
        self.id = id
        self.name = name
        self.icon = icon
        self.amount = amount
        self.date = date
        self.type = type
    }
}

struct SampleTransactions {
    var data: [Transaction] = [
        // MARK: - Subscription
        
        Transaction(name: "Apple Music", icon: "applelogo", type: .Subscription),
        Transaction(name: "Spotify Premium", icon: "music.note", type: .Subscription),
        Transaction(name: "Netflix", icon: "tv.fill", type: .Subscription),
        Transaction(name: "Amazon Prime", icon: "tv.fill", type: .Subscription),
        Transaction(name: "Hulu", icon: "tv.fill", type: .Subscription),
        
        // MARK: - Groceries
        
        Transaction(name: "Walmart", icon: "bag.fill", type: .Grocieries),
        Transaction(name: "Whole Foods", icon: "bag.fill", type: .Grocieries),
        
        // MARK: - Restaurants
        
        Transaction(name: "McDonald's", icon: "takeoutbag.and.cup.and.straw.fill", type: .Restaurants),
        Transaction(name: "Pizza Hut", icon: "takeoutbag.and.cup.and.straw.fill", type: .Restaurants),
        
        // MARK: - Entertainment
        
        Transaction(name: "Movie Tickets", icon: "party.popper.fill", type: .Entertainment),
        Transaction(name: "Coachella", icon: "party.popper.fill", type: .Entertainment),
        
        // MARK: - Salary
        
        Transaction(name: "𝕏", icon: "banknote.fill", amount: 132434.00, date: Date(), type: .Salary),
        
        // MARK: - Gifts
        
        Transaction(name: "Birthday", icon: "gift.fill", amount: 12.00, type: .Gifts),
        Transaction(name: "Anniversary", icon: "gift.fill", amount: 100.00, type: .Gifts),
    ]
}
