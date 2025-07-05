//
//  GlobalOverlayContent.swift
//  PillKit
//
//  Created by ceviixx on 27.05.25.
//

import SwiftUI

public enum GlobalOverlayContent {
    
    case success(
        title: String? = nil,
        message: String? = nil,
        haptic: HapticType = .success
    )
    
    case failure(
        title: String? = nil,
        message: String? = nil,
        haptic: HapticType = .error
    )
    
    case `default`(
        title: String,
        message: String? = nil,
        systemImage: String? = nil,
        color: Color = Color(.secondarySystemBackground),
        haptic: HapticType = .none
    )
    
    case custom(
        view: AnyView,
        haptic: HapticType = .none
    )
    
    public var haptic: HapticType {
        switch self {
        case .success(_, _, let haptic), .failure(_, _, let haptic),
             .default(title: _, message: _, systemImage: _, color: _, haptic: let haptic),
             .custom(_, let haptic):
            return haptic
        }
    }
    
    @MainActor
    @ViewBuilder
    public var view: some View {
        switch self {
        case .success(_, _, _), .failure(_, _, _),
                .default(title: _, message: _, systemImage: _, color: _, haptic: _):
            OverlayMessageView(type: self)
        case .custom(let customView, _):
            customView
        }
    }
}

extension GlobalOverlayContent {
    
    var title: String {
        switch self {
        case .success(let title, _, _): title ?? "Success"
        case .failure(let title, _, _): title ?? "Error"
        case .default(title: let title, message: _, systemImage: _, color: _, haptic: _): title
        case .custom: ""
        }
    }
    
    var message: String? {
        switch self {
        case .success(_, let message, _): message
        case .failure(_, let message, _): message
        case .default(title: _, message: let message, systemImage: _, color: _, haptic: _): message
        case .custom(_, _): nil
        }
    }
    
    var systemImage: String {
        switch self {
        case .success: "checkmark.circle.fill"
        case .failure: "exclamationmark.circle.fill"
        case .default(title: _, message: _, systemImage: let image, color: _, haptic: _): image ?? ""
        case .custom: ""
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .success: Color.green
        case .failure: Color.red
        case .default(title: _, message: _, systemImage: _, color: let color, haptic: _): color
        case .custom: Color.clear
        }
    }
    
}
