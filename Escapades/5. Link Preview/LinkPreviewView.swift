//
//  LinkPreviewView.swift
//  Escapades
//
//  Created by Raphael Salaja on 14/10/2023.
//

import SwiftUI
struct LinkPreviewView: View {
    enum version {
        case simple
        case expanded
    }

    @State var current: version = .simple
    @State var text = "Expand"

    @Namespace var animation

    func expand() {
        withAnimation(.snappy) {
            switch current {
            case .simple:
                text = "Expand"
                current = .expanded

            case .expanded:
                text = "Close"
                current = .simple
            }

            switch current {
            case .simple:
                text = "Expand"
            case .expanded:
                text = "Collapse"
            }
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            if current == .expanded {
                Image(.rick)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.snappy.delay(0.3)),
                            removal: .opacity.animation(.snappy.delay(0.2))
                        )
                    )
            }

            VStack(spacing: 8) {
                if current == .expanded {
                    LinkPreviewDetail(
                        icon: "textformat",
                        detail: "Rick Astley - Never Gonna Give You Up"
                    )
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.snappy.delay(0.2)),
                            removal: .opacity
                        )
                    )

                    LinkPreviewDetail(
                        icon: "link",
                        detail: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
                    )
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.snappy.delay(0.25)),
                            removal: .opacity
                        )
                    )

                    LinkPreviewDetail(
                        icon: "calendar",
                        detail: "25 Oct 2009"
                    )
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.snappy.delay(0.3)),
                            removal: .opacity
                        )
                    )

                    LinkPreviewDetail(
                        icon: "chart.line.uptrend.xyaxis",
                        detail: "1,458,380,013 views"
                    )
                    .transition(
                        .asymmetric(
                            insertion: .opacity.animation(.snappy.delay(0.35)),
                            removal: .opacity
                        )
                    )
                }
                else {
                    LinkPreviewDetail(
                        icon: "textformat",
                        detail: "Rick Astley - Never Gonna Give You Up"
                    )

                    LinkPreviewDetail(
                        icon: "link",
                        detail: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
                    )
                }
            }

            HStack {
                LinkPreviewButton(text: .constant("Open"), color: .indigo)

                Spacer()

                LinkPreviewButton(text: .constant("Share"), color: .mint)

                Spacer()

                LinkPreviewButton(text: $text, color: .brown, action: expand)
            }
        }
        .padding(10)
        .frame(maxWidth: 325, alignment: .bottom)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .shadow(radius: 2, x: 0, y: 1)
        }
    }
}

struct LinkPreviewView_2: View {
    var body: some View {
        ZStack {
            VStack(spacing: -24) {
                Image(.rick)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 2, x: 0, y: 1)

                VStack {
                    VStack(spacing: 8) {
                        LinkPreviewDetail(
                            icon: "textformat",
                            detail: "Rick Astley - Never Gonna Give You Up"
                        )

                        LinkPreviewDetail(
                            icon: "link",
                            detail: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
                        )
                    }

                    HStack {
                        LinkPreviewButton(text: .constant("Open"), color: .indigo)

                        Spacer()

                        LinkPreviewButton(text: .constant("Share"), color: .mint)
                    }
                }
                .padding(10)
                .frame(maxWidth: 250)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white)
                        .shadow(radius: 2, x: 0, y: 1)
                }
                .zIndex(1)
            }
        }
        .padding(10)
        .frame(maxWidth: 325)
    }
}

struct LinkPreviewView_3: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(.rick)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(spacing: 8) {
                LinkPreviewDetail(
                    icon: "textformat",
                    detail: "Rick Astley - Never Gonna Give You Up"
                )

                LinkPreviewDetail(
                    icon: "link",
                    detail: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
                )

                LinkPreviewDetail(
                    icon: "calendar",
                    detail: "25 Oct 2009"
                )

                LinkPreviewDetail(
                    icon: "chart.line.uptrend.xyaxis",
                    detail: "1,458,380,013 views"
                )
            }

            HStack {
                LinkPreviewButton(text: .constant("Open"), color: .indigo)

                Spacer()

                LinkPreviewButton(text: .constant("Share"), color: .mint)
            }
        }
        .padding(10)
        .frame(maxWidth: 300)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .shadow(radius: 2, x: 0, y: 1)
        }
    }
}

#Preview {
    VStack {
        LinkPreviewView()
    }
}

#Preview {
    VStack {
        LinkPreviewView_2()
        LinkPreviewView_3()
    }
}

struct LinkPreviewDetail: View {
    @State var icon: String = "textformat"
    @State var detail: String = "Rick Astley - Never Gonna Give You Up"

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: icon)
                .font(.system(.footnote, design: .rounded, weight: .bold))
                .foregroundStyle(.tertiary)
                .frame(width: 24)
                .frame(height: 16)

            Text(detail)
                .font(.system(.footnote, design: .rounded, weight: .bold))
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .truncationMode(.tail)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
    }
}

struct LinkPreviewButton: View {
    @Binding var text: String
    @State var color: Color = .blue
    @State var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            VStack {
                Text(text)
                    .font(.system(.footnote, design: .rounded, weight: .bold))
                    .foregroundStyle(.primary)
                    .contentTransition(.identity)
            }
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .frame(maxWidth: .infinity)
            .background(color.quaternary)
            .foregroundStyle(color)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        }
    }
}
