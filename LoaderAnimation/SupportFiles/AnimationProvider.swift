//
//  AnimationProvider.swift
//  LoaderAnimation
//
//  Created by Pavel Maksimishin on 13.02.2020.
//  Copyright © 2020 Pavel Maksimishin. All rights reserved.
//

import QuartzCore
import CoreGraphics

private extension FloatingPoint {
    var degreesToRadian: Self { self * .pi / 180}
}

/// An object that provides a layer with animation
struct AnimationProvider: AnimationProviderProtocol {
    
    private let replicatorLayer = CAReplicatorLayer()
    private let shapeLayer = CAShapeLayer()
    private let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
    
    ///prepare loader animation layer before start
    func prepareLoader(frame: CGRect,
                       elements count: Int,
                               duration: TimeInterval,
                               color: CGColor,
                               shape: Shape) {
        
        let center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        
        configureReplicator(center: center, elements: count, delay: duration / Double(count))
        setupAnimation(duration: duration)
        configureShape(path: shape.path,  inFrame: frame, color: color)
        
    }
    
    ///Add animation to layer
    func addAnimation(to layer: CALayer) {
        shapeLayer.add(animation, forKey: "opacity")
        layer.addSublayer(replicatorLayer)
    }
    
    ///remove animation from layer
    func removeAnimation() {
        shapeLayer.removeAllAnimations()
        replicatorLayer.removeFromSuperlayer()
    }
    
    private func configureReplicator(center: CGPoint, elements count: Int, delay: TimeInterval) {
        let angle = CGFloat(360).degreesToRadian / CGFloat(count)
        let rotation = CATransform3DMakeRotation(angle, 0, 0, 1.0)
        
        replicatorLayer.transform = CATransform3DMakeRotation(CGFloat(-90).degreesToRadian, 0, 0, 1.0)
        replicatorLayer.position = center
        replicatorLayer.instanceTransform = rotation
        replicatorLayer.instanceCount = count
        replicatorLayer.instanceDelay = delay
        
        replicatorLayer.addSublayer(shapeLayer)
    }
    
    private func configureShape(path: CGPath, inFrame frame: CGRect, color: CGColor) {
        shapeLayer.path = path
        shapeLayer.fillColor = color
        shapeLayer.position = getShapePosition(path: path, inFrame: frame)
    }
    
    private func setupAnimation(duration: TimeInterval) {
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.repeatCount = Float.greatestFiniteMagnitude
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = duration
    }

    private func getShapePosition(path: CGPath, inFrame frame: CGRect) -> CGPoint {
        let posX = (frame.width / 2) - (path.boundingBox.width / 2)
        return CGPoint(x: posX, y: 0)
    }
}
