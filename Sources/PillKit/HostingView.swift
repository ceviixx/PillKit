//
//  GlobalOverlayHostingView.swift
//  PillKit
//
//  Created by ceviixx on 27.05.25.
//

import SwiftUI

final class HostingView<Content: View>: UIView {
    private let hostingController: UIHostingController<Content>

    init(content: Content) {
        self.hostingController = UIHostingController(rootView: content)
        super.init(frame: .zero)

        self.isUserInteractionEnabled = true

        let container = PassthroughRootView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .clear
        container.isUserInteractionEnabled = true

        hostingController.view.backgroundColor = .clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.isUserInteractionEnabled = true

        container.addSubview(hostingController.view)
        addSubview(container)

        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: container.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

