//
//  HapticType.swift
//  PillKit
//
//  Created by ceviixx on 27.05.25.
//

import Foundation
import UIKit

@MainActor
public enum HapticType {
    case none
    case soft
    case rigid
    case light
    case medium
    case heavy
    case success
    case warning
    case error

    func trigger() {
        switch self {
        case .none:
            break
        case .soft:
            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        case .rigid:
            UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
        case .light:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .medium:
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .heavy:
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        case .success:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case .warning:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        case .error:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }
    }
}
