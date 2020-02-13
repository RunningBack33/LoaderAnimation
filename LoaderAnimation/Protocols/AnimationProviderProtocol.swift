//
//  AnimationProviderProtocol.swift
//  LoaderAnimation
//
//  Created by Pavel Maksimishin on 13.02.2020.
//  Copyright © 2020 Pavel Maksimishin. All rights reserved.
//

import QuartzCore
import CoreGraphics

///An abstract interface for prepare, add and remove animation
protocol AnimationProviderProtocol {
    func prepareLoader(frame: CGRect, elements count: Int, duration: TimeInterval, color: CGColor, shape: Shape)
    func addAnimation(to layer: CALayer)
    func removeAnimation()
}
