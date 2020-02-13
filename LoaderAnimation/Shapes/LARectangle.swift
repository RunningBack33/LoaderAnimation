//
//  LARectangle.swift
//  LoaderAnimation
//
//  Created by Pavel Maksimishin on 11.02.2020.
//  Copyright © 2020 Pavel Maksimishin. All rights reserved.
//

import CoreGraphics

struct LARectangle: ShapeProtocol {
    
    func getPath(with size: CGSize, cornerRadius: CGFloat) -> CGPath {
        
        let path = CGMutablePath()
        let center = CGPoint(x: 0, y: 0)
        
        let bottomCenter = CGPoint(x: 0, y: center.y - size.height / 2)
        let rightBottomCorner = CGPoint(x: center.x + size.width / 2, y: center.y - size.height / 2)
        let rightUpCorner = CGPoint(x: center.x + size.width / 2, y: center.y + size.height / 2 )
        let leftUpCorner = CGPoint(x: center.x - size.width / 2, y: center.y + size.height / 2 )
        let leftBottomCorner = CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2)
        
        path.move(to: bottomCenter)
        path.addArc(tangent1End: bottomCenter, tangent2End: rightBottomCorner, radius: 0)
        path.addArc(tangent1End: rightBottomCorner, tangent2End: rightUpCorner, radius: cornerRadius)
        path.addArc(tangent1End: rightUpCorner, tangent2End: leftUpCorner, radius: cornerRadius)
        path.addArc(tangent1End: leftUpCorner, tangent2End: leftBottomCorner, radius: cornerRadius)
        path.addArc(tangent1End: leftBottomCorner, tangent2End: bottomCenter, radius: cornerRadius)
        path.closeSubpath()
        
        return path
    }
}
