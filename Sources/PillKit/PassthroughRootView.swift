//
//  PassthroughRootView.swift
//  PillKit
//
//  Created by ceviixx on 27.05.25.
//

import UIKit

final class PassthroughRootView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        subviews.contains { $0.hitTest(convert(point, to: $0), with: event) != nil }
    }
}
