//
//  GlobalOverlayWindow.swift
//  PillKit
//
//  Created by ceviixx on 27.05.25.
//

import SwiftUI
import UIKit

@MainActor
final class PillKitWindow {
    static let shared = PillKitWindow()

    private var window: PassthroughWindow?

    func show<Content: View>(_ view: Content) {
        guard let scene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
            return
        }

        let window = PassthroughWindow(windowScene: scene)
        window.windowLevel = .alert + 1
        window.isHidden = false
        window.backgroundColor = .clear
        window.isUserInteractionEnabled = true

        let hostingView = HostingView(
            content: view
                .padding(.top, 0)
                .transition(.move(edge: .top).combined(with: .opacity))
                .animation(.spring(response: 0.4, dampingFraction: 0.75), value: true)
        )

        let controller = UIViewController()
        controller.view = PassthroughRootView()
        controller.view.backgroundColor = .clear
        controller.view.addSubview(hostingView)

        hostingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: controller.view.topAnchor),
            hostingView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
            hostingView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor)
        ])

        window.rootViewController = controller
        window.makeKeyAndVisible()

        self.window = window
    }

    func hide() {
        window?.isHidden = true
        window = nil
    }

    var isVisible: Bool {
        window?.isHidden == false
    }
}
