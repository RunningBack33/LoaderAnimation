//
//  ShapeProtocol.swift
//  LoaderAnimation
//
//  Created by Pavel Maksimishin on 11.02.2020.
//  Copyright © 2020 Pavel Maksimishin. All rights reserved.
//

import CoreGraphics

///An abstract interface for create a shape
protocol ShapeProtocol {
    func getPath(with size: CGSize, cornerRadius: CGFloat) -> CGPath
}
