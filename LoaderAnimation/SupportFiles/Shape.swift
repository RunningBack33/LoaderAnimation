//
//  Shape.swift
//  LoaderAnimation
//
//  Created by Pavel Maksimishin on 13.02.2020.
//  Copyright © 2020 Pavel Maksimishin. All rights reserved.
//

import CoreGraphics

///Shape for one element in a Loader Animation
public enum Shape {
    case rectangle(size: CGSize, cornerRadius: CGFloat)
    case triangle(size: CGSize, cornerRadius: CGFloat)
    case custom(path: CGPath)
    
    var path: CGPath {
        switch self {
        case .rectangle(let size, let cornerRadius):
            return LARectangle().getPath(with: size, cornerRadius: cornerRadius)
        
        case .triangle(let size, let cornerRadius):
            return LATriangle().getPath(with: size, cornerRadius: cornerRadius)
            
        case .custom(let path):
            return path
        }
    }
}
