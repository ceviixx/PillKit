//
//  PillPresenter.swift
//  PillKit
//
//  Created by ceviixx on 27.05.25.
//

import SwiftUI

@MainActor
public struct PillPresenter {
    public static var hapticsEnabled: Bool = true

    public static func show(
        _ content: GlobalOverlayContent,
        autoHideEnabled: Bool = true,
        duration: TimeInterval = 2.5
    ) {
        if hapticsEnabled {
            content.haptic.trigger()
        }

        let view = AnimatedOverlayView(
            content: content,
            duration: autoHideEnabled ? duration : .infinity
        )

        PillKitWindow.shared.show(view)
    }

    public static func hide() {
        PillKitWindow.shared.hide()
    }
}
