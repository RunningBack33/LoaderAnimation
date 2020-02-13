//
//  LATriangle.swift
//  LoaderAnimation
//
//  Created by Pavel Maksimishin on 11.02.2020.
//  Copyright © 2020 Pavel Maksimishin. All rights reserved.
//

import CoreGraphics

struct LATriangle: ShapeProtocol {
    
    func getPath(with size: CGSize, cornerRadius: CGFloat) -> CGPath {
        
        let path = CGMutablePath()
        let center = CGPoint(x: 0, y: 0)
        
        let bottomCenter = CGPoint(x: 0, y: center.y - size.height / 3)
        let leftCorner = CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 3)
        let rightCorner = CGPoint(x: center.x + size.width / 2, y: center.y - size.height / 3)
        let upCorner = CGPoint(x: center.x, y: center.y + size.height - size.height / 3 )
        
        path.move(to: bottomCenter)
        path.addArc(tangent1End: bottomCenter, tangent2End: rightCorner, radius: 0)
        path.addArc(tangent1End: rightCorner, tangent2End: upCorner, radius: cornerRadius)
        path.addArc(tangent1End: upCorner, tangent2End: leftCorner, radius: cornerRadius)
        path.addArc(tangent1End: leftCorner, tangent2End: bottomCenter, radius: cornerRadius)
        path.closeSubpath()
        
        return path
    }
}
