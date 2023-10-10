//
//  BanterClubHome.swift
//  Escapades
//
//  Created by Raphael Salaja on 04/10/2023.
//

import SwiftUI

private enum BanterConstants {
    static let radius: CGFloat = 20
}

struct BanterClubTeam: Identifiable {
    var id = UUID()
    var name: String
    var logo: String
    var wins: Int
    var draws: Int
    var losses: Int
}

struct BanterClub: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                BanterClubScoreboard()
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .frame(maxWidth: .infinity)
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(.body, design: .rounded, weight: .bold))
                            .foregroundColor(Color(.tertiaryLabel))
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(alignment: .center, spacing: 4) {
                        Text("🤣")
                            .font(.system(.body, design: .rounded, weight: .bold))
                            .foregroundColor(Color(.label))

                        Text("Trending Banter")
                            .font(.system(.body, design: .rounded, weight: .bold))
                            .foregroundColor(Color(.label))
                    }
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(Color(.secondarySystemFill),
                                          style: StrokeStyle(lineWidth: 2))
                    )
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "gearshape")
                            .font(.system(.body, design: .rounded, weight: .bold))
                            .foregroundColor(Color(.tertiaryLabel))
                    }
                }
            }
        }
    }
}

#Preview() { BanterClub() }

// MARK: - Scoreboard

struct BanterClubScoreboard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            BanterClubScoreboardThoughts()

            VStack(spacing: 24) {
                Text("English Premier League")
                    .font(.system(.headline, design: .rounded, weight: .bold))
                    .foregroundColor(Color(.label))

                HStack(spacing: 32) {
                    BanterClubScoreboardTeam(image: .chelsea, name: "Chelsea", record: "2 - 1 - 12")

                    BanterClubScoreboardHype()

                    BanterClubScoreboardTeam(image: .everton, name: "Everton", record: "5 - 4 - 14")
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .cornerRadius(BanterConstants.radius)
            .overlay(
                RoundedRectangle(cornerRadius: BanterConstants.radius)
                    .strokeBorder(Color(.secondarySystemFill),
                                  style: StrokeStyle(lineWidth: 2))
            )

            HStack {
                BanterClubScoreboardReaction(emoji: "😭", amount: "92.3k")
                BanterClubScoreboardReaction(emoji: "😂", amount: "22.3k")
                BanterClubScoreboardReaction(emoji: "💀", amount: "4239")
                BanterClubScoreboardReaction(emoji: "💔", amount: "32")
                HStack(alignment: .top, spacing: 2) {
                    Image(systemName: "plus")
                        .font(.system(.footnote, design: .rounded, weight: .bold))
                        .foregroundColor(Color(.secondaryLabel))
                }
                .padding(8)
                .cornerRadius(12, antialiased: true)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(Color(.secondarySystemFill),
                                      style: StrokeStyle(lineWidth: 2))
                )
            }
        }
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
    }
}

struct BanterClubScoreboardTeam: View {
    @State var image: ImageResource
    @State var name: String
    @State var record: String

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image(image)
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundColor(Color(.quaternaryLabel))

            Text(name)
                .font(.system(.headline, design: .rounded, weight: .bold))
                .foregroundColor(Color(.label))

            Text(record)
                .font(.system(.headline, design: .rounded, weight: .bold))
                .foregroundColor(Color(.tertiaryLabel))
        }.frame(maxWidth: .infinity)
    }
}

struct BanterClubScoreboardHype: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("2 - 9")
                .font(.system(.title, design: .rounded, weight: .bold))
                .foregroundColor(Color(.label))
            HStack(spacing: 4) {
                Image(systemName: "flame.fill")
                    .font(.system(.footnote, design: .rounded, weight: .bold))
                    .foregroundStyle(.primary)

                Text("76:23")
                    .font(.system(.footnote, design: .rounded, weight: .bold))
                    .foregroundStyle(.primary)
            }
            .padding(8)
            .background(.red.tertiary)
            .cornerRadius(12)
            .foregroundStyle(.red)
        }
    }
}

struct BanterClubScoreboardReaction: View {
    @State var emoji: String
    @State var amount: String

    var body: some View {
        HStack(alignment: .top, spacing: 2) {
            Text(emoji)
                .font(.system(.footnote, design: .rounded, weight: .bold))
                .foregroundColor(Color(.label))
            Text(amount)
                .font(.system(.footnote, design: .rounded, weight: .bold))
                .foregroundColor(Color(.label))
        }
        .padding(8)
        .cornerRadius(12, antialiased: true)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color(.secondarySystemFill),
                              style: StrokeStyle(lineWidth: 2))
        )
    }
}

struct BanterClubScoreboardThoughts: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center, spacing: 8) {
                Image(.chelseaProfilePicture)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())

                HStack(alignment: .firstTextBaseline) {
                    Text("@youngkippa")
                        .font(.system(.body, design: .rounded, weight: .bold))
                        .foregroundColor(Color(.label))
                }

                Spacer()

                HStack(alignment: .firstTextBaseline) {
                    Text("3h")
                        .font(.system(.body, design: .rounded, weight: .medium))
                        .foregroundColor(Color(.secondaryLabel))
                }
            }
            Text("Why are people saying chelsea is going to lose to Everton? We are going to win this matchup with complete ease 💙💙 #CFC"
            )
            .font(.system(.body, design: .rounded, weight: .regular))
            .foregroundColor(Color(.label))
        }
        .frame(maxWidth: .infinity)
    }
}

struct BanterClubScoreboardTime: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center) {
                    Circle()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Color(.quaternaryLabel))

                    HStack(alignment: .firstTextBaseline) {
                        Text("@youngkippa")
                            .font(.system(.body, design: .rounded, weight: .bold))
                            .foregroundColor(Color(.label))
                    }
                }
            }
            Text("Why are people saying chelsea is going to lose to Everton? We are going to win this matchup with complete ease 💙💙 #CFC"
            )
            .font(.system(.body, design: .rounded, weight: .regular))
            .foregroundColor(Color(.secondaryLabel))
        }
        .frame(maxWidth: .infinity)
    }
}
