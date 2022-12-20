//
//  UIView extension.swift
//  Navigation
//
//  Created by RAMIL ASEYDULLIN on 20.12.2022.
//

import UIKit

public extension UIView {
    func addNewSubviews(_ subviews: UIView...) {
        for item in subviews {
            self.addSubview(item)
        }
    }
}
