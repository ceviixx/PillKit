//
//  PassthroughWindow.swift
//  PillKit
//
//  Created by ceviixx on 27.05.25.
//

import UIKit

final class PassthroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)

        // Wenn Treffer RootView oder nil → nicht abfangen → Touch geht durch
        if hitView == self || hitView == rootViewController?.view {
            return nil
        }

        return hitView
    }
}
