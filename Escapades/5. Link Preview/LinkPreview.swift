//
//  BookmarkHome.swift
//  Escapades
//
//  Created by Raphael Salaja on 13/10/2023.
//

import LinkPresentation
import Popovers
import SkeletonView
import SwiftUI

struct LinkPeering: View {
    @GestureState var press = false
    @State var show = false

    var body: some View {
        VStack {
            Text("[Mysterious Link](https://www.youtube.com/watch?v=dQw4w9WgXcQ)")
                .font(.system(.body, design: .rounded, weight: .medium))
                .accentColor(.secondary)
                .scaleEffect(press ? 0.75 : 1)
                .animation(
                    .interactiveSpring(response: 0.4, dampingFraction: 0.6),
                    value: press
                )
                .gesture(
                    LongPressGesture(minimumDuration: 0.45)
                        .updating($press) { currentState, gestureState, _ in
                            gestureState = currentState
                        }
                        .onEnded { _ in
                            show.toggle()
                        }
                )
                .popover(present: $show,
                         attributes: {
                             $0.sourceFrameInset.top = -16
                             $0.position = .absolute(
                                 originAnchor: .top,
                                 popoverAnchor: .bottom
                             )
                             $0.presentation.animation = .bouncy(duration: 0.25)
                             $0.presentation.transition = .scale(scale: 0.5)
                         }) {
                    LinkPreviewView().scaleEffect(0.9)
                }
        }
        .padding(20)
    }
}

#Preview {
    LinkPeering()
}
