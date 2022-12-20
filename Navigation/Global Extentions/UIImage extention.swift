//
//  UIImage extention.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 20.12.2022.
//

import UIKit

public extension UIImage {
    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let imageNew = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageNew
    }
}
