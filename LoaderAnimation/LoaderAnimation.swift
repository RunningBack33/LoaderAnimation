//
//  LoaderAnimation.swift
//  LoaderAnimation
//
//  Created by Pavel Maksimishin on 09.02.2020.
//  Copyright © 2020 Pavel Maksimishin. All rights reserved.
//

import UIKit

///A view that shows that a task is in progress with custom shapes
open class LoaderAnimation: UIView {

    private var animator: AnimationProviderProtocol!
    /**
     Initialisez a new shape with the provided properties and sizes.
     
     - Parameters:
        - frame: loader frame
        - shape: shape type with size
        - shapeCount: count of elements in loader
        - shapeColor: color of elements
        - duration: duration of loader animation
     
     - Returns:
     Custom activity indicator with opacity animation
     */
    public init(frame: CGRect = CGRect(x: UIScreen.main.bounds.width / 2 - 16,
                                        y: UIScreen.main.bounds.height / 2 - 16,
                                        width: 32,
                                        height: 32),
                shape: Shape = .rectangle(size: CGSize(width: 8, height: 2),
                cornerRadius: 1),
                shapeCount: Int = 12,
                shapeColor: UIColor = .black,
                duration: TimeInterval = 2) {
        
        super.init(frame: frame)
        
        animator = AnimationProvider()
        animator.prepareLoader(frame: frame,
                               elements: shapeCount,
                               duration: duration,
                               color: shapeColor.cgColor,
                               shape: shape)
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// show activity indicator and start animation
    public func startAnimating() {
        animator.addAnimation(to: layer)
    }
    
    /// hide activity indicator and stop animation
    public func stopAnimating() {
        animator.removeAnimation()
    }

}

