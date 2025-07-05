//
//  AnimatedOverlayView.swift
//  PillKit
//
//  Created by ceviixx on 27.05.25.
//

import SwiftUI

struct AnimatedOverlayView: View {
    let content: GlobalOverlayContent
    let duration: TimeInterval

    @State private var isVisible = false
    @State private var dragOffset: CGFloat = 0
    @GestureState private var isDragging = false

    @State private var didStartAutoDismiss = false

    var body: some View {
        content.view
            .padding(.horizontal, 16)
            .offset(y: isVisible ? dragOffset : -150)
            .opacity(isVisible ? 1 : 0)
            .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isVisible)
            .gesture(
                DragGesture()
                    .updating($isDragging) { _, state, _ in
                        state = true
                    }
                    .onChanged { value in
                        dragOffset = min(0, value.translation.height)
                    }
                    .onEnded { value in
                        if value.translation.height < -60 {
                            dismiss()
                        } else {
                            withAnimation(.spring()) {
                                dragOffset = 0
                            }
                            if duration < .infinity && !didStartAutoDismiss {
                                startAutoDismiss()
                            }
                        }
                    }
            )
            .onAppear {
                withAnimation {
                    isVisible = true
                }

                if duration < .infinity && !isDragging {
                    startAutoDismiss()
                }
            }
    }

    private func startAutoDismiss() {
        guard !didStartAutoDismiss else { return }
        didStartAutoDismiss = true

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            if !isDragging {
                dismiss()
            } else {
                didStartAutoDismiss = false
            }
        }
    }

    private func dismiss() {
        withAnimation {
            isVisible = false
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            PillKitWindow.shared.hide()
        }
    }
}
